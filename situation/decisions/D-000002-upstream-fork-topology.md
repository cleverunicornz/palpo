# D-000002 — Upstream-fork operational topology

## Status

accepted

## Date

2026-09-02

## Context

Palpo is an upstream fork whose public parent is
https://github.com/palpo-im/palpo. The closure opening classifies this
repository as `UPSTREAM_FORK`; the installed situation protocol defines
separate upstream-mirror and operational-trunk roles for that ownership.

## Evidence

- `situation/runs/bedrock-20260902T061059Z-10dd77d0-482591941/opening.md`
- `situation/AGENTS.md`
- https://github.com/cleverunicornz/palpo

## Decision

`main` is the upstream mirror and `internal/main` is the Bedrock-owned
operational trunk. Normal operational work branches from and targets
`internal/main`; only selected upstream-safe contribution branches target
`main`; `internal/main` does not merge into `main`.

## Why

Separating the mirror from operational work preserves a comprehensible upstream
lineage while allowing the operational trunk to retain repository knowledge and
closure history.

## Rejected alternatives

- Using `main` as the operational trunk was rejected because it would mix
  Bedrock-owned operational history with the upstream mirror.
- Merging `internal/main` into `main` was rejected because it would turn the
  mirror into an operational integration branch.

## Consequences

- `situation/invariants/I-000001-upstream-fork-topology.md` is critical and
  must remain visible in root `AGENTS.md`.
- Root README orientations explain the two branch roles before contribution
  guidance.

## Revisit when

Revisit only if the repository is no longer an upstream fork or a separately
reviewed topology transition identifies a new upstream mirror and operational
trunk.
