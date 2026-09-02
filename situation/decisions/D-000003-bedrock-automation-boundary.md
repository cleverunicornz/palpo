# D-000003 — Bedrock automation boundary

## Status

accepted

## Date

2026-09-02

## Context

The triggering PR retained a closure workflow with `contents`, `issues`, and
`pull-requests` write permissions. It invokes a protocol synchronizer that can
replace protocol-owned files and push a sync commit before the closure lanes
run. This is operational automation, not invisible setup.

## Evidence

- `10dd77d029a3064b3d0b3b3d69382755f5ffd4b5:.github/workflows/bedrock-closure.yml`
- `10dd77d029a3064b3d0b3b3d69382755f5ffd4b5:scripts/bedrock-protocol-sync.sh`
- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:situation/protocol-lock.json`

## Decision

Retain the Bedrock workflow as admission-gated, write-privileged closure
automation. It acts only for an open, same-repository pull request labeled
`bedrock:requested`, initiated by an approved non-bot actor, and, for this
fork, targeting the default branch. The synchronizer resolves the selected
protocol release to a commit and changes protocol-owned files only as the
manifest-declared, digest-verified release set plus its lock.

## Why

The admission guard narrows who can cause a write-capable closure run. Resolving
the release to a commit and verifying every manifest digest preserves an
immutable, reviewable protocol input rather than accepting an ad hoc partial
copy.

## Rejected alternatives

- Unrestricted label-triggered or cross-repository pull-request execution was
  rejected because it would let an unapproved actor reach write-capable
  automation.
- Editing individual protocol-owned files or accepting an unchecked release
  archive was rejected because it would sever the lock from the installed
  bytes.

## Consequences

- `situation/invariants/I-000002-verified-protocol-inputs.md` is critical and
  is surfaced in root `AGENTS.md`.
- Changes to the workflow, synchronizer, or protocol lock require authority,
  admission, and immutable-input review in addition to ordinary code review.
- The workflow's broad GitHub write permissions and supplied automation secrets
  remain a material risk even when the admission guard passes.

## Revisit when

Revisit when the closure workflow, its permissions, its admission criteria, or
the protocol distribution and verification mechanism is intentionally changed
with replacement evidence.
