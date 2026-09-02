# O-000006: Appservice registration loading

## State

designed

## Judges

`situation/promises/P-000006-appservice-registration-loading.md`

## Inputs

- A Palpo service built from the head under observation.
- A disposable PostgreSQL database and a configured registration directory.
- Valid direct YAML, YML, and TOML registration files; an invalid registration;
  and two files with the same registration ID.
- Database queries or administrative inspection for accepted registrations,
  sender users, default devices, and enabled-registration lookup.

## Pass

- **P1:** One valid direct file of each accepted extension is loaded.
- **P2:** Invalid files and duplicate registration IDs are skipped without
  becoming accepted registrations.
- **P3:** Each accepted registration is upserted with its sender user and
  default hidden device.
- **P4:** An enabled accepted registration is returned by the appservice data
  lookup.

## Fail

- **F1:** A valid accepted extension is ignored without a parse error.
- **F2:** An invalid or duplicate registration becomes an accepted registration.
- **F3:** An accepted registration lacks its persisted registration data,
  sender user, or default hidden device.
- **F4:** An enabled accepted registration cannot be retrieved through the
  appservice data lookup.

## Implementation coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Start with one valid YAML, YML, and TOML file and inspect accepted records. | manual |
| P2 | Add invalid and duplicate-ID files and inspect that neither is accepted. | manual |
| P3 | Inspect registration, user, and device rows for each accepted ID. | manual |
| P4 | Query enabled registrations through the server appservice surface. | manual |
| F1 | Treat a silently ignored valid file as failure. | manual |
| F2 | Treat any accepted invalid or duplicate file as failure. | manual |
| F3 | Treat a missing required persisted row as failure. | manual |
| F4 | Treat absent enabled-registration lookup as failure. | manual |