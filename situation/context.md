# Repository context

## Identity

Palpo is a Rust implementation of a Matrix homeserver. This repository is an
`UPSTREAM_FORK` of https://github.com/palpo-im/palpo.

## Current state

- Repository phase: `IMPLEMENTATION`, as recorded by
  `situation/runs/bedrock-20260902T061059Z-10dd77d0-482591941/opening.md`.
- The opening tree contains the server entrypoint at
  `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:crates/server/src/main.rs` and
  PostgreSQL-enabled server dependencies at
  `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:crates/server/Cargo.toml`.
- The opening-tree historical Complement artifact
  `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:tests/results/test_all.result.jsonl`
  contains 686 JSON records: 672 `pass`, 14 `skip`, and 0 `fail`. The counts
  were re-derived from that file during this BACKPORT; they are historical
  artifact contents, not evidence of a current run or production readiness.
- The opening English orientation labels the public test server as evaluation
  only and permits data deletion or reset:
  `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:README.md`.

## Intended state

- `main` remains the mirror of the upstream repository;
  `internal/main` is the Bedrock-owned operational trunk. Normal operational
  work branches from and targets `internal/main`; only selected upstream-safe
  contributions target `main`.
- The repository keeps implementation behavior in source and concise human
  orientation in root README files. Falsifiable behavior, decisions, and
  assurance evidence live under `situation/`.
- The configured-server lifecycle is tracked by
  `situation/promises/P-000001-configured-server-lifecycle.md` and its
  companion oracle and plan. It is implemented but not assured.

## Transition

This is BACKPORT run `bedrock-20260902T061059Z-10dd77d0-482591941`, opened at
`5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d` from trigger
`10dd77d029a3064b3d0b3b3d69382755f5ffd4b5`. It turns the opening-tree
implementation and retained closure automation into bounded records without
claiming a new implementation, current protocol compliance, performance, or
production assurance.

## Authority boundary

The retained closure workflow is write-privileged automation. Its admission
and protocol-integrity boundary is recorded in
`situation/decisions/D-000003-bedrock-automation-boundary.md`; the resulting
critical invariant is
`situation/invariants/I-000002-verified-protocol-inputs.md`. Treat changes to
`.github/workflows/bedrock-closure.yml`, `scripts/bedrock-protocol-sync.sh`,
or `situation/protocol-lock.json` as authority-boundary changes.

## Donor set

This BACKPORT read the following substantive opening-tree donors once:

- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:README.md`
- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:README.zh.md`
- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:crates/server/src/main.rs`
- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:crates/server/Cargo.toml`
- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:palpo-example.toml`
- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:tests/results/test_all.result.jsonl`

The triggering PR also retained the write-privileged automation added at
`10dd77d029a3064b3d0b3b3d69382755f5ffd4b5:.github/workflows/bedrock-closure.yml`
and
`10dd77d029a3064b3d0b3b3d69382755f5ffd4b5:scripts/bedrock-protocol-sync.sh`.
Git retains donor bytes; no donor snapshot or registry is copied into
`situation/references/`.
