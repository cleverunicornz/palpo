# I-000002 — Verified protocol inputs

## Priority

critical

## Invariant

The protocol-owned files listed by `situation/protocol-lock.json` are immutable
inputs to closure lanes and change only as a complete release set whose
resolved commit and file digests are verified by
`scripts/bedrock-protocol-sync.sh`.

## Basis

- `situation/decisions/D-000003-bedrock-automation-boundary.md`
