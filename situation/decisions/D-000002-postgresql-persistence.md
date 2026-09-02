# D-000002: PostgreSQL persistence

## Status

accepted

## Date

2026-09-02

## Context

The implemented homeserver needs durable relational storage for its server
state. The current server and data crates already use a PostgreSQL-specific
Diesel configuration and startup path.

## Evidence

- `crates/server/Cargo.toml` enables Diesel's `postgres` feature.
- `crates/data/src/lib.rs` imports `PgConnection`, runs embedded migrations,
  and constructs data pools from `DbConfig`.
- The opening donor's comparison of Palpo with Tuwunel describes Palpo's
  PostgreSQL backend and distinguishes it from an embedded RocksDB approach at
  `e3a831572a0ad857e775fec464354916eda738be:README.md`.

## Decision

Use PostgreSQL through `palpo-data` as the server's persistent data layer.

## Why

The current startup path initializes `palpo-data` before serving requests, and
that layer runs PostgreSQL migrations before constructing its pools. This is an
existing implemented choice, not a new storage evaluation.

## Rejected alternatives

- An embedded RocksDB-style primary store is not selected for Palpo; the donor
  documentation identifies that as Tuwunel's contrasting architecture.
- A second primary persistence authority is not selected by the current
  `crates/data/` initialization path.

## Consequences

- `P-000003` records the implemented initialization and pool behavior.
- `I-000003` records the resulting repository rule.
- A deployment that cannot reach its configured PostgreSQL database is outside
  the successful-startup path; this decision does not claim operational
  availability.

## Revisit when

Revisit when a committed implementation replaces PostgreSQL as the primary
`palpo-data` persistence authority and supplies a new decision, promise,
oracle, and evidence.