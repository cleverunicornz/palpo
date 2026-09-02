# I-000001 — Upstream-fork topology

## Priority

critical

## Invariant

Palpo keeps `main` as the upstream mirror and `internal/main` as the
Bedrock-owned operational trunk; normal operational work targets
`internal/main`, selected upstream-safe contributions target `main`, and
`internal/main` does not merge into `main`.

## Basis

- `situation/decisions/D-000002-upstream-fork-topology.md`
