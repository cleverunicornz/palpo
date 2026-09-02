# P-000006: Appservice registration loading

## State

implemented

## Promise

When `appservice_registration_dir` is configured and readable, Palpo startup
reads direct YAML, YML, and TOML registration files. It skips files with
unselected extensions or contents that fail `Registration` deserialization, and
it applies no additional semantic validation to successfully deserialized
string fields. It skips an ID only when it duplicates an ID from a prior
accepted file encountered during that one directory load. The loader adds each
accepted registration to its in-memory collection before attempting a database
upsert; an upsert error is logged and does not itself make that entry available
through the data layer. A registration is available to appservice operations
through the data layer only if it has a successfully persisted, enabled row.
For each accepted registration, the loader ensures its sender user exists and
inserts a hidden `_` device only when that sender user has no existing device.

## Scope

This covers the one-time direct-directory loader in
`crates/server/src/global.rs`, its startup invocation in
`crates/server/src/main.rs`, and enabled-registration retrieval in
`crates/server/src/appservice.rs`. Its duplicate-ID behavior is limited to
files encountered during that one directory load; it makes no cross-reload,
cross-process, or global uniqueness claim. It does not promise a third-party
bridge's availability, message-delivery result, configuration correctness, or
runtime reload after the one-time loader has initialized.

## Oracle

`situation/oracles/O-000006-appservice-registration-loading.md`

## State evidence

- `crates/server/src/global.rs` selects direct YAML, YML, and TOML files,
  rejects files that fail `Registration` deserialization, limits duplicate IDs
  to one directory load, adds accepted registrations to the in-memory vector,
  then attempts their database upserts and logs upsert errors.
- The same loader ensures each sender user exists and inserts the hidden `_`
  device only after finding that the sender user has no device row.
- `crates/server/src/main.rs` invokes `appservices()` during startup.
- `crates/server/src/appservice.rs` retrieves only enabled registrations from
  the data layer.
- The current donor implementation is retained at
  `e3a831572a0ad857e775fec464354916eda738be:crates/server/src/global.rs`.

## Residual

No configured registration directory or PostgreSQL observation was collected in
this closure. This state does not assure any external bridge behavior or
appservice delivery outcome.

## References

- `situation/decisions/D-000006-appservice-registration-loading.md`
- `situation/invariants/I-000006-registration-directory-source.md`