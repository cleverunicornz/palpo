# P-000006: Appservice registration loading

## State

implemented

## Promise

When `appservice_registration_dir` is configured and readable, Palpo startup
reads direct YAML, YML, and TOML registration files; skips invalid files and
duplicate registration IDs; and for each accepted registration upserts its data
and ensures its sender user and default hidden device exist in PostgreSQL.
Enabled registrations are then available to appservice operations through the
data layer.

## Scope

This covers the one-time loader in `crates/server/src/global.rs`, its startup
invocation in `crates/server/src/main.rs`, and enabled-registration retrieval in
`crates/server/src/appservice.rs`. It does not promise a third-party bridge's
availability, message-delivery result, configuration correctness, or runtime
reload after the one-time loader has initialized.

## Oracle

`situation/oracles/O-000006-appservice-registration-loading.md`

## State evidence

- `crates/server/src/global.rs` filters the accepted extensions, invalid
  registrations, and duplicate IDs before writing registration, user, and
  device records.
- `crates/server/src/main.rs` invokes `appservices()` during startup.
- `crates/server/src/appservice.rs` retrieves enabled registrations from the
  data layer.
- The current donor implementation is retained at
  `e3a831572a0ad857e775fec464354916eda738be:crates/server/src/global.rs`.

## Residual

No configured registration directory or PostgreSQL observation was collected in
this closure. This state does not assure any external bridge behavior or
appservice delivery outcome.

## References

- `situation/decisions/D-000006-appservice-registration-loading.md`
- `situation/invariants/I-000006-registration-directory-source.md`