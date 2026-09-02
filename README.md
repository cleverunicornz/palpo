# Palpo

Palpo is a Rust implementation of a Matrix homeserver.

## Status

The repository is in `IMPLEMENTATION`. Its configured-server lifecycle is
implemented but not assured: this repository does not currently make an
assurance claim for Matrix compatibility, federation behavior, security,
performance, durable operations, or production readiness. Treat deployments as
development or evaluation work until an assurance record says otherwise.

## Quick local setup

1. Install the Rust toolchain required by `Cargo.toml` and provide a reachable
   PostgreSQL database.
2. Copy a configuration template and edit every setting marked as requiring
   local input:

   ```bash
   cp palpo-example.toml palpo.toml
   ```

3. Set the server identity, listener, database, and storage values appropriate
   for the environment.
4. Build and run with the explicit configuration path:

   ```bash
   cargo build --release
   ./target/release/palpo --config palpo.toml
   ```

For a containerized starting point, review `deploy/docker/compose.yml` and set
`PALPO_POSTGRES_PASSWORD` in `deploy/docker/.env` before starting its Compose
services.

## Fork topology

This repository is an upstream fork of https://github.com/palpo-im/palpo.

- `main` mirrors upstream.
- `internal/main` is the operational trunk and the base for normal work.
- Only selected upstream-safe contribution branches target `main`;
  `internal/main` does not merge into it.

## Authoritative project records

README files are orientation, not canonical architecture or assurance records.

- `situation/context.md` — current, intended, and transition state.
- `situation/promises/P-000001-configured-server-lifecycle.md` — the active
  configured-server promise and its residual.
- `situation/oracles/O-000001-configured-server-lifecycle.md` — how that
  promise is judged.
- `situation/plans/active/PLAN-000001-configured-server-assurance.md` — the
  evidence path to assurance.
- `situation/decisions/` and `situation/invariants/` — durable choices and
  binding repository rules.

## Contributing

Read `CONTRIBUTING.md` before proposing changes. Normal operational work starts
from `internal/main`; follow the fork topology above when preparing any
upstream-safe contribution.

## License

Palpo is licensed under the Apache License 2.0. See `LICENSE`.

## Historical donor orientation

The detailed opening orientation preserved during this BACKPORT remains in Git
at `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:README.md`. The records under
`situation/` state the current repository knowledge.
