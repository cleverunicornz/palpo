# P-000002 PostgreSQL data layer

## State

implemented

## Promise

Palpo uses PostgreSQL as its primary persistent data backend, taking its primary
connection URL from `db.url` or `PALPO_DB_URL` and initializing migrations and
pools before the request router is served.

## Scope

This covers the primary data backend selected by the server and its startup
ordering. It does not assure database availability, migration success, backup
policy, replication behavior, or application-level durability under failure.

## Oracle

[O-000002](situation/oracles/O-000002-postgresql-data-layer.md)

## State evidence

- The primary database configuration and PostgreSQL connection budget are
  present at the opening checkpoint in `crates/server/src/config/db.rs`; its
  current coordination behavior was introduced by
  [29aadc5c9fa7863a8f09f6ca1543ef3d9a8b8fde](https://github.com/palpo-im/palpo/commit/29aadc5c9fa7863a8f09f6ca1543ef3d9a8b8fde).
- `crates/data/src/lib.rs` establishes a `PgConnection`, runs embedded
  migrations, and creates PostgreSQL pools before the server routing step in
  `crates/server/src/main.rs`.
- No PASS witness has been retained for this promise, so it is not assured.

## Residual

No runtime witness proves that a real PostgreSQL instance can be reached,
migrated, or recovered in an operator deployment.

## References

- `crates/server/src/config/db.rs`
- `crates/data/src/lib.rs`
- `crates/data/src/pool.rs`
- `crates/server/src/main.rs`
- `palpo-example.toml`
