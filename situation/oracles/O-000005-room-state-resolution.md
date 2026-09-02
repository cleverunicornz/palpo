# O-000005: Room state resolution

## State

designed

## Judges

`situation/promises/P-000005-room-state-resolution.md`

## Inputs

- A Palpo-core build from the head under observation.
- A deterministic in-memory event fixture with one unconflicted state case, one
  Matrix room-v2 conflicting-state case with an independently expected result,
  and one case whose required fetched event is unavailable.
- Explicit `AuthorizationRules` and `StateResolutionV2Rules` inputs for each
  case.

## Pass

- **P1:** The unconflicted fixture resolves to the common input state map.
- **P2:** The conflicting fixture resolves to the independently specified
  Matrix room-v2 expected state under the supplied rules.
- **P3:** The unavailable-event fixture returns a state-resolution error rather
  than a resolved state.

## Fail

- **F1:** The unconflicted fixture changes or omits a common state entry.
- **F2:** The conflicting fixture differs from its independently specified
  expected state or behaves as though the supplied rules were ignored.
- **F3:** The unavailable-event fixture returns a resolved state.

## Coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Run the resolver against the simple common-state fixture and compare maps. | manual |
| P2 | Run the resolver against a fixed Matrix room-v2 conflict fixture and compare to separately maintained expected state. | manual |
| P3 | Run the unavailable-event fixture and inspect the error result. | manual |
| F1 | Treat any common-entry mismatch as failure. | manual |
| F2 | Treat any expected-state mismatch or rule-insensitive result as failure. | manual |
| F3 | Treat a successful resolved state with unavailable required input as failure. | manual |