# P-000003: PostgreSQL initialization

## State

implemented

## Promise

Before Palpo serves requests, its data layer rejects a configured database pool
smaller than two connections, runs pending embedded migrations over a dedicated
PostgreSQL connection, and creates separate query and coordination pools from
the configured connection budget. The coordination allocation is at least one
connection and leaves at least one connection for ordinary queries.

## Scope

This covers `palpo_data::init`, `migrate`, and
`coordination_pool_capacity` in `crates/data/src/lib.rs`, plus the server's call
to `data::init`. It does not claim that PostgreSQL is reachable in every
deployment, that a migration is reversible, or that every higher-level data
operation is durable.

## Oracle

`situation/oracles/O-000003-postgresql-initialization.md`

## State evidence

- `crates/data/src/lib.rs` implements the minimum pool assertion, migration,
  query-pool construction, coordination-pool construction, and capacity bounds.
- `crates/server/src/main.rs` invokes `data::init` before serving.
- The data-layer donor history retains this implementation at
  `2749d190386324a957930cad2e4bd0b4f70bd4e8:crates/data/src/lib.rs`.

## Residual

No database-backed startup observation was collected during this closure. This
state does not assure schema compatibility with an operator's existing database,
connection recovery, replication, backup, or production availability.

## References

- `situation/decisions/D-000002-postgresql-persistence.md`
- `situation/invariants/I-000003-postgresql-data-authority.md`