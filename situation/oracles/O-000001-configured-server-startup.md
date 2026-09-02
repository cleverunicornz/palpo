# O-000001: Configured server startup

## State

designed

## Judges

`situation/promises/P-000001-configured-server-startup.md`

## Inputs

- A Palpo executable built from the head under observation.
- Three distinguishable valid configuration-source fixtures with reachable
  PostgreSQL, configured storage, and a configured registration directory:
  an explicit `--config` fixture with two unique listener addresses, a
  `PALPO_CONFIG` fixture with a different listener address, and a fixture at
  the path selected when both sources are absent.
- Invocations with `--config` and a conflicting `PALPO_CONFIG`, with no
  `--config` and `PALPO_CONFIG` set, and with neither source set.
- An order-preserving startup observation with separate completion markers for
  logging, data, storage, and configured-appservice initialization, plus
  listener-bind and first-service markers. It must directly establish order
  rather than infer initialization from a successful request.
- Missing or invalid configuration cases, unavailable required database or
  storage cases, a local HTTP client for every configured listener, and a
  configured registration directory containing one deserializable direct
  registration, plus a disabled-server invocation.

## Pass

- **P1:** An explicit `--config` selects and validates its configuration even
  when `PALPO_CONFIG` names a different file.
- **P2:** With no `--config`, `PALPO_CONFIG` selects and validates its
  distinguishable configuration.
- **P3:** With neither `--config` nor `PALPO_CONFIG`, the selected default path
  supplies and validates its distinguishable configuration.
- **P4:** With server mode enabled, each listener in the two-listener fixture
  serves the composed HTTP service.
- **P5:** The ordered observation shows logging, PostgreSQL data, storage, and
  configured-appservice initialization completing before the first listener
  bind or serving event.
- **P6:** With server mode disabled, the process completes its permitted admin
  work without binding either configured listener.

## Fail

- **F1:** The explicit-configuration invocation selects the conflicting
  environment configuration or any other configuration.
- **F2:** The no-`--config` environment invocation does not select its
  `PALPO_CONFIG` configuration.
- **F3:** The invocation with both sources absent does not select its default
  path configuration.
- **F4:** A missing or invalid configuration reaches a network-serving state.
- **F5:** An unavailable required database or storage dependency reaches a
  successful network-serving state.
- **F6:** A listener bind or serving event precedes completion of any required
  logging, data, storage, or configured-appservice initialization.
- **F7:** Any listener in the two-listener fixture fails to serve the composed
  HTTP service.
- **F8:** Disabled server mode binds a configured listener.

## Implementation coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Invoke with conflicting CLI and environment fixtures; compare the selected listener to the CLI fixture. | manual |
| P2 | Omit `--config`, set `PALPO_CONFIG`, and compare the selected listener to the environment fixture. | manual |
| P3 | Omit `--config`, unset `PALPO_CONFIG`, and compare the selected listener to the default-path fixture. | manual |
| P4 | Issue the same health request to each configured listener in the two-listener fixture. | manual |
| P5 | Inspect the direct ordered startup markers for all four initialization completions before bind or serve. | manual |
| P6 | Inspect both listener addresses while the disabled-mode invocation completes. | manual |
| F1 | Treat any selected configuration other than the explicit CLI fixture as failure. | manual |
| F2 | Treat any selected configuration other than the environment fixture as failure. | manual |
| F3 | Treat any selected configuration other than the default-path fixture as failure. | manual |
| F4 | Invoke each missing or invalid configuration case and verify absence of serving. | manual |
| F5 | Invoke each unavailable-dependency case and verify absence of serving. | manual |
| F6 | Treat any bind or serve marker before a required initialization-completion marker as failure. | manual |
| F7 | Treat a failed health request on either configured listener as failure. | manual |
| F8 | Treat any disabled-mode listener bind as failure. | manual |