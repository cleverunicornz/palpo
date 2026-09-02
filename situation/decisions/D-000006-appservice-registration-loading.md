# D-000006: Directory-backed appservice registrations

## Status

accepted

## Date

2026-09-02

## Context

The repository ships example appservice registration files, and the server has
a configurable registration-directory setting. Startup must make accepted
registrations available to later event-forwarding and appservice operations.

## Evidence

- `crates/server/src/main.rs` force-loads appservice registrations after data
  and storage initialization.
- `crates/server/src/global.rs` reads YAML, YML, and TOML registration files,
  filters invalid and duplicate IDs, and upserts accepted registrations plus
  their sender user and default device.
- `crates/server/src/appservice.rs` reads enabled registrations from the data
  layer and performs constant-time appservice-token comparisons.
- The opening donor bridge guides reference registration files under
  `e3a831572a0ad857e775fec464354916eda738be:examples/`.

## Decision

Use the configured local registration directory as the startup input for
appservice registrations, then persist accepted registrations in the Palpo data
layer for server use.

## Why

This is the current implementation that connects shipped registration examples
to the server's appservice behavior without adopting claims about third-party
bridge services.

## Rejected alternatives

- Loading arbitrary file extensions is not selected; the current loader accepts
  YAML, YML, and TOML registrations.
- Keeping registration data only in the startup directory without making it
  available through the data layer is not selected.

## Consequences

- `P-000006` records the precise loader behavior.
- `I-000006` records the current registration-source rule.
- External Telegram, Feishu, Discord, and DingTalk bridge behavior remains
  outside Palpo's native promise scope.

## Revisit when

Revisit when registration discovery or persistence moves away from the
configured local directory and data-layer representation.