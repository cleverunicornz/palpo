# Repository context

## Identity

Palpo is a Rust implementation of a Matrix homeserver. The workspace declares the
`palpo` server package in `crates/server/Cargo.toml`; its process entry point is
`crates/server/src/main.rs`.

## Phase

`IMPLEMENTATION`

## Ownership

- Classification: `UPSTREAM_FORK`.
- Public upstream: https://github.com/palpo-im/palpo.
- `main` is the upstream mirror.
- `internal/main` is the Bedrock-owned operational trunk. Normal work branches
  from `internal/main`; selected upstream-safe contribution branches target
  `main`; `internal/main` does not merge into `main`.

## Current state

The opening tree contains an implemented Rust homeserver, configuration loader,
PostgreSQL data layer, and HTTP routing surface. No completed Bedrock closure
predates this `BACKPORT` run, so these records establish the first bounded
repository knowledge set. The promises recorded here are `implemented`, not
`assured`: this closer did not execute an oracle or create a witness.

## Intended state

Repository knowledge separates the implemented homeserver behavior from the
assurance still needed to claim it. The operational trunk retains its
Bedrock-owned records and human orientation while `main` remains suitable for
selected upstream-safe exports.

## Transition

- Opening checkpoint: `a9cd4ae32d3dfed74396e6f81625a880e7e111d9`.
- Active run: `bedrock-20260902T033451Z-a741ca7c-785657215`.
- Operation: `BACKPORT`.
- The records stage derives bounded promises, oracles, decisions, invariants,
  and an active assurance plan from the opening tree only. Later stages author
  the root agents index and then consider the README.

## Evidence boundary

The substantive donor review is bounded to the opening tree above. Historical
Complement result data remains at `tests/results/test_all.result.jsonl`; it is
not a current witness because that artifact does not identify the tested head.
Current assurance requires new witnesses under `situation/witnesses/` that
apply the corresponding oracles.
