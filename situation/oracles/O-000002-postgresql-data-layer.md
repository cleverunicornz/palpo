# O-000002 PostgreSQL data layer

## State

designed

## Judges

[P-000002](situation/promises/P-000002-postgresql-data-layer.md)

## Inputs

- `crates/server/src/config/db.rs`, `crates/data/src/lib.rs`, and
  `crates/server/src/main.rs` from the tested head.
- A real server launch against an isolated PostgreSQL database.

## Pass

- P1: The configured primary database URL is used to establish a PostgreSQL
  migration connection and PostgreSQL query and coordination pools.
- P2: Migrations and pool initialization complete before the router begins
  serving a listener.

## Fail

- F1: A non-PostgreSQL primary backend can satisfy the primary database path.
- F2: The server begins serving before primary-database migration or pool
  initialization completes.

## Implementation coverage

| Leg | Decision | Coverage |
|---|---|---|
| P1 | Inspect the database connections and pools created by a launch. | manual |
| P2 | Correlate startup ordering with listener readiness. | manual |
| F1 | Record a successful non-PostgreSQL primary-backend launch. | manual |
| F2 | Record listener readiness before primary-database initialization. | manual |
