# O-000001: Configured server startup

## State

designed

## Judges

`situation/promises/P-000001-configured-server-startup.md`

## Inputs

- A Palpo executable built from the head under observation.
- A valid configuration with a unique listener, reachable PostgreSQL database,
  and configured storage backend.
- A conflicting `PALPO_CONFIG` path for precedence observation, invalid or
  missing configuration cases, and an unavailable required-dependency case.
- A local HTTP client and listener inspection for the chosen port.

## Pass

- **P1:** An explicit `--config` selects and validates the supplied valid
  configuration even when `PALPO_CONFIG` names a different file.
- **P2:** With valid reachable dependencies and server mode enabled, startup
  completes initialization and the configured listener serves the composed HTTP
  service.
- **P3:** With server mode disabled, the process completes its permitted admin
  work without binding the configured listener.

## Fail

- **F1:** A missing or invalid configuration reaches a network-serving state.
- **F2:** An unavailable required database or storage dependency reaches a
  successful network-serving state.
- **F3:** Disabled server mode binds the configured listener.

## Implementation coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Compare the selected configuration's observable listener with the conflicting environment path. | manual |
| P2 | Observe initialization completion and make one health request to the configured listener. | manual |
| P3 | Inspect listener state while the disabled-mode invocation completes. | manual |
| F1 | Invoke each invalid configuration case and verify absence of a listener. | manual |
| F2 | Invoke the unavailable-dependency case and verify absence of a listener. | manual |
| F3 | Invoke disabled mode and verify absence of a listener. | manual |