# D-000006: Directory-backed appservice registrations

## Status

accepted

## Date

2026-09-02

## Context

The repository ships example appservice registration files, and the server has
a configurable registration-directory setting. Startup distinguishes admission
to its single-load in-memory collection from persistence and data-layer lookup:
only a successfully persisted enabled row supports later appservice operations
through that layer.

## Evidence

- `crates/server/src/main.rs` force-loads appservice registrations after data
  and storage initialization.
- `crates/server/src/global.rs` reads direct YAML, YML, and TOML registration
  files, skips extension-selection and `Registration` deserialization failures,
  de-duplicates IDs only among files encountered in that directory load, adds
  accepted entries to its in-memory vector before attempting their upserts, and
  logs upsert errors.
- The same loader ensures a sender user exists and inserts the hidden `_`
  device only when that user has no existing device row.
- `crates/server/src/appservice.rs` reads enabled persisted registrations from
  the data layer and performs constant-time appservice-token comparisons.
- The opening donor bridge guides reference registration files under
  `e3a831572a0ad857e775fec464354916eda738be:examples/`.

## Decision

Use the configured local registration directory as the startup input for
appservice registrations. Keep accepted entries scoped to that directory load,
attempt their persistence, and treat data-layer appservice availability as a
property of a successfully persisted enabled row rather than in-memory
acceptance. Insert the hidden `_` device only for a sender user with no existing
device.

## Why

This is the current implementation that connects shipped registration examples
to the server's appservice behavior without adopting claims about third-party
bridge services.

## Rejected alternatives

- Loading arbitrary file extensions is not selected; the current loader accepts
  YAML, YML, and TOML registrations.
- Treating in-memory acceptance or a default device as unconditional data-layer
  availability is not selected; the current lookup requires a successfully
  persisted enabled row, and `_` is inserted only when the sender has no
  existing device.

## Consequences

- `P-000006` records the precise loader behavior.
- `I-000006` records the current registration-source rule.
- External Telegram, Feishu, Discord, and DingTalk bridge behavior remains
  outside Palpo's native promise scope.

## Revisit when

Revisit when registration discovery or persistence moves away from the
configured local directory and data-layer representation.