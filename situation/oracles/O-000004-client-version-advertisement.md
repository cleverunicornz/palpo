# O-000004: Client version advertisement

## State

designed

## Judges

`situation/promises/P-000004-client-version-advertisement.md`

## Inputs

- A Palpo service started from the head under observation.
- The JSON body of `GET /_matrix/client/versions`.
- The fixed expected list from
  `crates/server/src/routing/client.rs`: `r0.5.0`, `r0.6.0`, and `v1.1` through
  `v1.12`.

## Pass

- **P1:** The response's `versions` field is an ordered array exactly equal to
  the fixed fourteen-value expected list.

## Fail

- **F1:** The response omits, adds, reorders, or changes any expected version,
  or does not provide a `versions` array.

## Coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Fetch the endpoint and compare the parsed array to a separately written fixed expected list. | manual |
| F1 | Treat any parsed-array mismatch or missing field as failure. | manual |