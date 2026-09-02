# O-000006: Appservice registration loading

## State

designed

## Judges

`situation/promises/P-000006-appservice-registration-loading.md`

## Inputs

- A Palpo service built from the head under observation, with a fresh process
  for each one-time loader scenario, a disposable PostgreSQL database, and a
  configured registration directory.
- One valid direct YAML, YML, and TOML registration file; an unsupported
  extension; a supported-extension file that fails `Registration`
  deserialization; and a registration with unusual but successfully
  deserialized string fields.
- Two successfully deserialized supported-extension files with the same
  registration ID encountered during one directory load.
- Database cases for a fresh ID whose upsert succeeds, a fresh ID whose upsert
  is forced to fail without a pre-existing registration row, an enabled row,
  and a disabled row.
- Sender-user cases with no device row and with a pre-existing non-default
  device row, plus inspection of the loader's accepted collection, database
  rows, and enabled-registration lookup.

## Pass

- **P1:** One valid direct file of each accepted extension is added to the
  loader's accepted collection.
- **P2:** A deserialization failure and an unsupported extension are excluded;
  successfully deserialized unusual string fields are not rejected by an
  additional semantic check; and exactly one of two same-load duplicate IDs is
  accepted.
- **P3:** After a successful registration upsert, the registration row and its
  sender user exist; a hidden `_` device is inserted when that sender had no
  device, and it is not inserted when that sender already has a non-default
  device.
- **P4:** A successfully persisted enabled registration is returned through the
  appservice data lookup, while a fresh registration whose upsert failed and a
  successfully persisted disabled registration are not returned.

## Fail

- **F1:** A valid direct file with an accepted extension is ignored without a
  deserialization failure.
- **F2:** A deserialization failure, unsupported extension, or same-load
  duplicate becomes accepted, or a successfully deserialized unusual string
  field is rejected by an extra semantic rule.
- **F3:** A successfully persisted registration lacks its registration row or
  sender user, the hidden `_` device is absent for a sender with no device, or
  that device is inserted for a sender with a pre-existing non-default device.
- **F4:** The lookup omits a successfully persisted enabled registration or
  returns a fresh unpersisted registration after its failed upsert or a
  successfully persisted disabled registration.

## Implementation coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Start a fresh loader with one valid direct YAML, YML, and TOML file; inspect its accepted collection. | manual |
| P2 | In one directory load, inspect extension selection, `Registration` deserialization failure, unusual deserialized strings, and the two same-ID files. | manual |
| P3 | For successful upserts, inspect registration and sender rows with a no-device sender and a sender with a pre-existing non-default device. | manual |
| P4 | Compare lookup results for a fresh forced-upsert failure, a successfully persisted enabled row, and a successfully persisted disabled row. | manual |
| F1 | Treat a silently ignored valid direct accepted-extension file as failure. | manual |
| F2 | Treat acceptance of a rejected file or same-load duplicate, or extra semantic rejection of deserialized strings, as failure. | manual |
| F3 | Treat missing successful-persistence rows or an unconditional/absent hidden-device outcome as failure. | manual |
| F4 | Treat incorrect availability for failed-persistence, enabled, or disabled cases as failure. | manual |