# Repository context

## Identity

Palpo is a Rust Cargo workspace that implements a Matrix homeserver. The workspace
manifest is `Cargo.toml`; the server package is `crates/server/Cargo.toml`, and
its executable entrypoint is `crates/server/src/main.rs`. Shared Matrix protocol
types live in `crates/core/`, and the PostgreSQL-backed data layer lives in
`crates/data/`.

## Ownership

`cleverunicornz/palpo` is an `UPSTREAM_FORK`. Its public upstream authority is
`https://github.com/palpo-im/palpo`, as recorded in
`situation/runs/bedrock-20260902T085609Z-e3a831572a0a-0001/opening.md`.
Synchronization and contribution use the designated fork-operations skill
outside Bedrock.

## Phase

The repository is in `IMPLEMENTATION`: the current tree contains the server,
core-library, data-layer, identifier-validation, and procedural-macro source
under `crates/`. This classification and the BACKPORT operation are recorded in
`situation/runs/bedrock-20260902T085609Z-e3a831572a0a-0001/opening.md`.

## Backport baseline

This adoption reads the substantive donor tree named by trigger head
`e3a831572a0ad857e775fec464354916eda738be` in the opening record. Current
behavioral records cite live repository paths; donor documentation that this
closure removes is cited as historical bytes at that commit.