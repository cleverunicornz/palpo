# P-000001: Configured server startup

## State

implemented

## Promise

Given a valid Palpo configuration and reachable required dependencies, the
`palpo` executable selects its configuration from `--config` or the
`PALPO_CONFIG`/default path, validates it, initializes logging, PostgreSQL data,
storage, and configured appservice registrations, and—when server mode is
enabled—serves the composed HTTP service on every configured listener. When
server mode is disabled, it returns before starting the network service.

## Scope

This covers the startup sequencing in `crates/server/src/main.rs` and the
configuration loading path in `crates/server/src/config.rs`. It includes the
observable distinction between enabled and disabled server mode. It does not
claim that arbitrary configuration values, database credentials, storage
backends, TLS materials, or listeners are valid or reachable.

## Oracle

`situation/oracles/O-000001-configured-server-startup.md`

## State evidence

- The current implementation is in `crates/server/src/main.rs` and
  `crates/server/src/config.rs`; the same donor bytes are available at
  `b1f8bb1d334a06add36f6bad3a4a1f3304d907ad:crates/server/src/main.rs` and
  `e3a831572a0ad857e775fec464354916eda738be:crates/server/src/config.rs`.
- `crates/server/src/main.rs` calls data, storage, and appservice initialization
  before creating and serving the Salvo service.

## Residual

No runtime startup witness was collected during this documentation closure.
This state does not assure dependency availability, successful binding in a
particular deployment, graceful shutdown behavior, or operational performance.

## References

- `situation/decisions/D-000003-salvo-http-service.md`
- `situation/decisions/D-000006-appservice-registration-loading.md`
- `situation/invariants/I-000003-postgresql-data-authority.md`