#!/usr/bin/env bash
# Deterministic Bedrock protocol synchronizer.
# Runs before any agent. Compares the pinned protocol release against the
# adopter's situation/protocol-lock.json; when different, replaces the full
# protocol-owned file set byte-for-byte and makes an explicit sync commit.
set -euo pipefail

PROTOCOL_REPO="${BEDROCK_PROTOCOL_REPO:?BEDROCK_PROTOCOL_REPO not set}"
PROTOCOL_RELEASE="${BEDROCK_PROTOCOL_RELEASE:?BEDROCK_PROTOCOL_RELEASE not set}"
LOCK_PATH="situation/protocol-lock.json"
WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

log() { printf '[protocol-sync] %s\n' "$*" >&2; }

# --- Resolve the release tag to an immutable commit -------------------------
tag_ref=$(gh api "repos/${PROTOCOL_REPO}/git/ref/tags/${PROTOCOL_RELEASE}")
tag_type=$(printf '%s' "$tag_ref" | jq -r .object.type)
tag_sha=$(printf '%s' "$tag_ref" | jq -r .object.sha)
if [ "$tag_type" = "tag" ]; then
  resolved=$(gh api "repos/${PROTOCOL_REPO}/git/tags/${tag_sha}" --jq .object.sha)
else
  resolved="$tag_sha"
fi
log "release ${PROTOCOL_RELEASE} -> commit ${resolved}"

# --- Unchanged path: verify local digests and exit ---------------------------
if [ -f "$LOCK_PATH" ]; then
  locked=$(jq -r .commit "$LOCK_PATH")
  if [ "$locked" = "$resolved" ]; then
    valid=true
    while IFS=$'\t' read -r rel sha; do
      if [ ! -f "$rel" ]; then
        log "LOCK MISMATCH: ${rel} missing"
        valid=false
        continue
      fi
      actual=$(sha256sum "$rel" | cut -d' ' -f1)
      if [ "$actual" != "$sha" ]; then
        log "LOCK MISMATCH: ${rel} digest ${actual} != ${sha}"
        valid=false
      fi
    done < <(jq -r '.files | to_entries[] | "\(.key)\t\(.value)"' "$LOCK_PATH")
    root_sha=$(jq -r '.root_protocol.sha256 // empty' "$LOCK_PATH")
    if [ -z "$root_sha" ] || ! python3 - "$root_sha" <<'PY'
import hashlib, pathlib, re, sys
p = pathlib.Path("AGENTS.md")
if not p.exists():
    raise SystemExit(1)
m = re.findall(r'<bedrock-protocol>.*?</bedrock-protocol>', p.read_text(), re.S)
if len(m) != 1 or hashlib.sha256(m[0].encode()).hexdigest() != sys.argv[1]:
    raise SystemExit(1)
PY
    then
      log "LOCK MISMATCH: root protocol block missing or changed"
      valid=false
    fi
    if [ "$valid" = true ]; then
      log "unchanged at ${resolved}; local protocol bytes verified"
      {
        printf 'changed=false\n'
        printf 'commit=%s\n' "$resolved"
        printf 'head=%s\n' "$(git rev-parse HEAD)"
      } >> "$GITHUB_OUTPUT"
      exit 0
    fi
    log "same release requires canonical byte restoration"
  fi
  log "lock at ${locked}; migration required"
else
  log "no lock present; first adoption"
fi

# --- Fetch the protocol archive at the exact commit ---------------------------
gh api "repos/${PROTOCOL_REPO}/tarball/${resolved}" > "${WORKDIR}/protocol.tar.gz"
mkdir -p "${WORKDIR}/src"
tar -xzf "${WORKDIR}/protocol.tar.gz" -C "${WORKDIR}/src" --strip-components=1

manifest="${WORKDIR}/src/manifest.json"
if [ ! -f "$manifest" ]; then
  log "FATAL: manifest.json absent at ${resolved}"
  exit 1
fi

# --- Verify every manifest digest against the downloaded bytes ----------------
while IFS=$'\t' read -r rel sha; do
  src="${WORKDIR}/src/${rel}"
  if [ ! -f "$src" ]; then
    log "FATAL: manifest lists ${rel} but archive lacks it"
    exit 1
  fi
  actual=$(sha256sum "$src" | cut -d' ' -f1)
  if [ "$actual" != "$sha" ]; then
    log "FATAL: ${rel} digest ${actual} != manifest ${sha}"
    exit 1
  fi
done < <(jq -r '.files[] | "\(.path)\t\(.sha256)"' "$manifest")
root_protocol=$(jq -r '.root_protocol.path' "$manifest")
root_protocol_sha=$(jq -r '.root_protocol.sha256' "$manifest")
actual=$(sha256sum "${WORKDIR}/src/${root_protocol}" | cut -d' ' -f1)
if [ "$actual" != "$root_protocol_sha" ]; then
  log "FATAL: root protocol block digest ${actual} != manifest ${root_protocol_sha}"
  exit 1
fi
log "manifest verified: $(jq '.files | length' "$manifest") files"

# --- Remove installed protocol-owned files, then install the new set ----------
proto_paths=$(jq -r '.files[].path' "$manifest")
if [ -f "$LOCK_PATH" ]; then
  while IFS= read -r old; do
    rm -f "$old"
  done < <(jq -r '.files | keys[]' "$LOCK_PATH")
fi
while IFS= read -r rel; do
  mkdir -p "$(dirname "$rel")"
  cp "${WORKDIR}/src/${rel}" "$rel"
done <<< "$proto_paths"

# --- Install the protocol-owned root block, preserve repository-owned text ---
python3 - "${WORKDIR}/src/${root_protocol}" <<'PY'
import pathlib, re, sys
protocol = pathlib.Path(sys.argv[1]).read_text().strip()
target = pathlib.Path("AGENTS.md")
existing = target.read_text().strip() if target.exists() else ""
matches = list(re.finditer(r'<bedrock-protocol>.*?</bedrock-protocol>', existing, re.S))
if len(matches) > 1:
    raise SystemExit("AGENTS.md contains multiple bedrock-protocol blocks")
if matches:
    start, end = matches[0].span()
    rendered = existing[:start] + protocol + existing[end:]
elif existing:
    rendered = protocol + "\n\n<bedrock-repository>\n" + existing + "\n</bedrock-repository>"
else:
    rendered = protocol + "\n\n<bedrock-repository>\nRepository-specific orientation has not yet been authored.\n</bedrock-repository>"
target.write_text(rendered.rstrip() + "\n")
PY

# --- Write the new lock --------------------------------------------------------
lock_files=$(jq -r '.files | map({key: .path, value: .sha256}) | from_entries' "$manifest")
jq -n \
  --arg repo "$PROTOCOL_REPO" \
  --arg release "$PROTOCOL_RELEASE" \
  --arg commit "$resolved" \
  --arg root_path "$root_protocol" \
  --arg root_sha "$root_protocol_sha" \
  --argjson files "$lock_files" \
  '{repository: $repo, release: $release, commit: $commit, root_protocol: {source: $root_path, sha256: $root_sha}, files: $files}' > "$LOCK_PATH"

# --- Explicit sync commit -------------------------------------------------------
git add $proto_paths "$LOCK_PATH" AGENTS.md
git -c user.name="github-actions[bot]" \
    -c user.email="41898282+github-actions[bot]@users.noreply.github.com" \
    commit -m "bedrock: sync protocol ${PROTOCOL_RELEASE}

Protocol: ${PROTOCOL_REPO}
Commit: ${resolved}"
git push origin "HEAD:${BEDROCK_PR_BRANCH:-${GITHUB_HEAD_REF:?no PR branch available}}"
new_head=$(git rev-parse HEAD)

{
  printf 'changed=true\n'
  printf 'commit=%s\n' "$resolved"
  printf 'head=%s\n' "$new_head"
} >> "$GITHUB_OUTPUT"
log "synced ${PROTOCOL_RELEASE}; sync commit ${new_head}"
