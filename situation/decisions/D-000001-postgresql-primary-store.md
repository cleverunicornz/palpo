# D-000001 — PostgreSQL primary store

## Status

accepted

## Date

2026-09-02

## Context

The opening donor describes Palpo as a PostgreSQL-backed Matrix homeserver and
contrasts that choice with Tuwunel's embedded RocksDB-oriented storage model.
The opening server crate enables Diesel's PostgreSQL support.

## Evidence

- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:README.md`
- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:crates/server/Cargo.toml`

## Decision

Palpo uses PostgreSQL as its primary operational data store.

## Why

The donor selected PostgreSQL for transactional persistence, familiar
replication and backup tooling, SQL inspection, and storage that can scale
independently of the application process.

## Rejected alternatives

- An embedded RocksDB-style store, exemplified by the donor's Tuwunel
  comparison, was not selected because it carries a different operational
  model and does not preserve the donor's stated PostgreSQL trade-offs.

## Consequences

- Startup assurance for the configured server must include a reachable
  PostgreSQL dependency; see
  `situation/promises/P-000001-configured-server-lifecycle.md`.
- A storage-provider change requires an explicit successor decision and
  migration/operations evidence rather than silently changing the deployment
  model.

## Revisit when

Revisit when a proposed primary-store replacement has a reviewed data
migration, rollback, backup, and operational evidence set sufficient to judge
the replacement.
