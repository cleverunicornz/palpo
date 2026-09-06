# Repository context

## Identity

Palpo is a Rust Cargo workspace that implements a Matrix homeserver. The workspace
manifest is `Cargo.toml`; the server package is `crates/server/Cargo.toml`, and
its executable entrypoint is `crates/server/src/main.rs`. Shared Matrix protocol
types live in `crates/core/`, and the PostgreSQL-backed data layer lives in
`crates/data/`.

## Ownership

`cleverunicornz/palpo` is an `UPSTREAM_FORK` whose public upstream authority is
`https://github.com/palpo-im/palpo`. Upstream synchronization and contribution
follow the organization's fork rules in the root `<bedrock-organization>` block.
The historical BACKPORT opening record is available at
`1ea6cc66e1a51fa88ad151f010444e733a987732:situation/runs/bedrock-20260902T085609Z-e3a831572a0a-0001/opening.md`.

## Phase

The repository is in `IMPLEMENTATION`: the current tree contains the server,
core-library, data-layer, identifier-validation, and procedural-macro source
under `crates/`. The BACKPORT operation and initial phase classification are
retained at
`1ea6cc66e1a51fa88ad151f010444e733a987732:situation/runs/bedrock-20260902T085609Z-e3a831572a0a-0001/opening.md`.

## Backport baseline

This adoption reads the substantive donor tree named by trigger head
`e3a831572a0ad857e775fec464354916eda738be`, as recorded at
`1ea6cc66e1a51fa88ad151f010444e733a987732:situation/runs/bedrock-20260902T085609Z-e3a831572a0a-0001/opening.md`.
Current behavioral records cite live repository paths; donor documentation that
this closure removes is cited as historical bytes at that commit.

## Closure state

- Current run: `20260906T110056Z-b8bb8410d468b1391911e7f8523b8e62b4135b19` (open)
- Last completed closure: none
- Transcript: none
