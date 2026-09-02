# O-000002 PostgreSQL data layer

## State

designed

## Judges

[P-000002](situation/promises/P-000002-postgresql-data-layer.md)

## Inputs

- `crates/server/src/config/db.rs`, `crates/data/src/lib.rs`, and
  `crates/server/src/main.rs` from the tested head.
- A real server launch against an isolated PostgreSQL database with an intended
  primary URL supplied through `db.url`, including direct evidence of the URL
  used by the migration connection and PostgreSQL query and coordination pools.
- A real server launch against an isolated PostgreSQL database with an intended
  primary URL supplied through `PALPO_DB_URL`, including direct evidence of the
  URL used by the migration connection and PostgreSQL query and coordination
  pools.

## Pass

- P1: Direct evidence from a `db.url` launch shows that its intended primary
  PostgreSQL URL is selected and used by the PostgreSQL migration connection and
  PostgreSQL query and coordination pools.
- P2: Direct evidence from a `PALPO_DB_URL` launch shows that its intended
  primary PostgreSQL URL is selected and used by the PostgreSQL migration
  connection and PostgreSQL query and coordination pools.
- P3: Migrations and pool initialization complete before the router begins
  serving a listener.

## Fail

- F1: A `db.url` launch does not select its intended primary PostgreSQL URL, or
  its PostgreSQL migration connection or query and coordination pools use a
  different URL.
- F2: A `PALPO_DB_URL` launch does not select its intended primary PostgreSQL
  URL, or its PostgreSQL migration connection or query and coordination pools use
  a different URL.
- F3: A non-PostgreSQL primary backend can satisfy the primary database path.
- F4: The server begins serving before primary-database migration or pool
  initialization completes.

## Implementation coverage

| Leg | Decision | Coverage |
|---|---|---|
| P1 | Directly inspect `db.url` selection and the URL used by its PostgreSQL migration connection and query and coordination pools. | manual |
| P2 | Directly inspect `PALPO_DB_URL` selection and the URL used by its PostgreSQL migration connection and query and coordination pools. | manual |
| P3 | Correlate startup ordering with listener readiness. | manual |
| F1 | Retain direct evidence that `db.url` does not select its intended URL or that its migration connection or pools use a different URL. | manual |
| F2 | Retain direct evidence that `PALPO_DB_URL` does not select its intended URL or that its migration connection or pools use a different URL. | manual |
| F3 | Record a successful non-PostgreSQL primary-backend launch. | manual |
| F4 | Record listener readiness before primary-database initialization. | manual |
