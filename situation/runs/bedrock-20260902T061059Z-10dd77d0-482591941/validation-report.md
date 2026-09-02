# Bedrock validation report

## Run

- Run: `bedrock-20260902T061059Z-10dd77d0-482591941`
- Opening: `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d`
- Operation: `BACKPORT`
- Repository phase: `IMPLEMENTATION`
- Ownership: `UPSTREAM_FORK`
- Records: `bd6624d90073c988f453123e9bdea0a3ffe3c34f`
- Agents index: `3562eac2a88cffeef326e0e9866f3e83c4ec8b74`
- README: `a14f95f05f6b8d2328e559d356dec97ffa13a03a`
- Protocol: `e5637ad8e4783879ff149a4e02209e82db6dafce`

## Verdict

`APPROVED`

No actionable finding remains in the bounded validation surface.

## Checkpoint and stage validation

- The opening commit has the exact opening subject and required trailers, adds
  only this run's `opening.md`, and records the supplied branch, base, trigger,
  phase, operation, ownership, and protocol coordinates consistently.
- A fetched pre-validation `origin/bedrock/v132-backport` resolved to the
  authoritative records SHA. Its ancestry from the opening contains the
  disclosed immutable records receipt, the agents-index stage, the README
  stage, and the replacement records receipt in that order.
- The replacement records commit has the exact records subject and complete
  `Bedrock-Run`, `Bedrock-Event`, `Bedrock-Opening`, and
  `Bedrock-Operation: BACKPORT` trailers. It changes only `closure-report.md`.
- The predecessor `db5e33f3697f74e73eac0b5b0f8df95f1484cc72` is not treated as
  the authoritative records receipt. Its missing operation trailer and its
  immutable supersession are accurately disclosed by the replacement receipt;
  its original records-only scope and ancestry agree with that disclosure.
- The agents-index commit has the exact subject and trailers and adds only root
  `AGENTS.md`. The README commit has the exact subject and trailers and changes
  only `README.md` and `README.zh.md`. Both are ancestors of the fetched remote
  receipt.

## Records and evidence validation

- The context, decisions, invariants, promise, oracle, active plan, and run
  report satisfy their installed schemas and consistently state
  `IMPLEMENTATION`, `BACKPORT`, and `UPSTREAM_FORK` where applicable.
- All in-repository links inspected in the changed records resolve. Historical
  donor citations resolve in the opening tree, including both root README
  orientations, the server entrypoint, the server manifest, the example
  configuration, and the retained Complement result artifact. Automation
  citations resolve in the trigger tree.
- The historical Complement claim was independently re-derived from
  `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:tests/results/test_all.result.jsonl`:
  the source contains 686 JSON records, comprising 672 `pass`, 14 `skip`, and
  0 `fail` actions. The records correctly limit those values to historical
  artifact contents rather than a current run or assurance witness.
- The protocol release tag peels to the recorded protocol commit. The opening
  lock agrees with that commit's manifest, and every installed protocol file
  inspected matches its locked digest.
- The accepted decisions retain the bounded donor choices and record the fork
  topology and introduced automation boundary, including alternatives and
  revisit conditions. Critical decision consequences are surfaced as the two
  critical invariants and in root `AGENTS.md`.
- The configured-server promise is correctly `implemented`, not `assured`, and
  cites implementation evidence. Its designed oracle maps each pass and fail
  leg to honest manual coverage. No witness or PASS claim exists, the residual
  does not overstate assurance, and the active plan describes the future target
  condition rather than present completion.
- The introduced write-privileged closure automation is not omitted: its write
  authority, same-repository/open-request admission guard, approved non-bot
  actor boundary, fork default-branch restriction, immutable protocol input,
  synchronizer, lock, and residual secret/permission risk are represented in
  the decision, invariant, context, and agent orientation.

## Orientation validation

- Root `AGENTS.md` is a concise agent index: it identifies the repository,
  phase, operation, ownership, fork topology, critical invariants, active
  delivery records, risk boundary, and authoritative protocol entrypoint
  without duplicating the nested contracts.
- `README.md` and `README.zh.md` agree on purpose, implementation-without-
  assurance status, upstream-mirror/operational-trunk topology, and routing to
  authoritative situation records. They remain human setup/orientation
  documents and do not compete with those records.
- Every changed record that relies on README content removed or reworded by the
  README stage uses the opening-tree `<commit>:<path>` form. Both final README
  files likewise point readers to their opening-tree donor orientation.

## Findings

None.
