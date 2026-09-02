# I-000003 Upstream-fork trunk separation

## Priority

critical

## Invariant

`main` is the upstream mirror and `internal/main` is the operational trunk.
Routine work branches from `internal/main`; upstream-safe exports use selected
contribution branches targeting `main`, without integrating the operational
trunk into the mirror.

## Basis

- [D-000004](situation/decisions/D-000004-upstream-fork-topology.md)
