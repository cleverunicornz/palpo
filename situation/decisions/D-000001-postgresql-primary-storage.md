# D-000001 PostgreSQL primary storage

## Status

accepted

## Date

2026-09-02

## Context

Palpo needs one primary persistent data backend for homeserver state and must
preserve the operating model already present in the opening tree.

## Evidence

- [O-000002](situation/oracles/O-000002-postgresql-data-layer.md)
- `README.md` identifies PostgreSQL as Palpo's primary backend and contrasts it
  with the embedded RocksDB backend used by the Tuwunel lineage.
- `crates/server/Cargo.toml` enables Diesel's `postgres` support.
- `crates/data/src/lib.rs` establishes `PgConnection` and runs embedded
  migrations.

## Decision

Use PostgreSQL as Palpo's primary persistent data backend.

## Why

The donor describes this choice as providing ACID guarantees, mature
replication and backup tooling, standard SQL inspection, operational
familiarity, and independently scalable storage.

## Rejected alternatives

The embedded RocksDB backend described for the Tuwunel/Conduit lineage was not
selected because the donor's stated operating model favors PostgreSQL's
operational tooling and independently scalable storage.

## Consequences

Primary-data changes must preserve PostgreSQL migrations, connection management,
and recovery considerations. A different primary backend is an architectural
change rather than a local substitution.

## Revisit when

A proposed primary-backend change includes an explicit data migration,
durability, backup, and operational-support decision with new oracle evidence.
