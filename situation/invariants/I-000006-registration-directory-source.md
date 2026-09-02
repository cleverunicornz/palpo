# I-000006: Registration-directory source

## Priority

standard

## Invariant

When configured, the local appservice registration directory is the startup
source for accepted appservice registrations. The data layer exposes only
successfully persisted enabled registrations, and the loader inserts the hidden
`_` device only for a sender user with no existing device.

## Basis

- `situation/decisions/D-000006-appservice-registration-loading.md`