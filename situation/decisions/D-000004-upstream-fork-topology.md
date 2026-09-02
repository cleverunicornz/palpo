# D-000004 Upstream-fork topology

## Status

accepted

## Date

2026-09-02

## Context

This repository is classified as an `UPSTREAM_FORK`: it needs an upstream
mirror for selected contribution exports and a separate Bedrock-owned trunk for
ordinary operational work.

## Evidence

- `situation/runs/bedrock-20260902T033451Z-a741ca7c-785657215/opening.md`
  classifies the opening run as `UPSTREAM_FORK`.
- https://github.com/cleverunicornz/palpo/tree/main is the mirror branch.
- https://github.com/cleverunicornz/palpo/tree/internal/main is the operational
  trunk.
- https://github.com/palpo-im/palpo is the declared public upstream in
  `Cargo.toml` and `README.md`.

## Decision

Keep `main` as the upstream mirror and `internal/main` as the Bedrock-owned
operational trunk. Normal work branches from `internal/main`; selected
upstream-safe contribution branches target `main`.

## Why

The ownership classification separates ongoing operational changes from the
mirror used for upstream-facing contribution selection.

## Rejected alternatives

Do not use `main` as the routine operational trunk, and do not merge
`internal/main` into `main` as a synchronization mechanism.

## Consequences

Operational knowledge, including the README, remains owned on `internal/main`.
Upstream-safe exports are selected through Git rather than by collapsing the
trunk roles.

## Revisit when

Upstream governance or the repository's branch-ownership model changes and a
replacement topology decision records the migration and export path.
