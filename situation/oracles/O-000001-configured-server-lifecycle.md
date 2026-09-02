# O-000001 — Configured server lifecycle

## State

designed

## Judges

- `situation/promises/P-000001-configured-server-lifecycle.md`

## Inputs

- A configuration that the server accepts, with reachable configured PostgreSQL
  and object-storage dependencies and each listener address available.
- A configuration that fails server validation.
- The process exit status, listener reachability, and an HTTP response through
  every configured listener.

## Pass

- P1: a configuration that fails validation terminates without the process
  serving requests.
- P2: an accepted configuration with reachable dependencies initializes and
  serves a routing response through every configured listener.

## Fail

- F1: a configuration that fails validation reaches a serving state.
- F2: an accepted configuration with reachable dependencies fails to serve a
  routing response through any configured listener.

## Implementation coverage

| Leg | Decision | Coverage |
|---|---|---|
| P1 | Observe validation failure and absence of a serving listener. | manual |
| P2 | Observe startup and a routing response through each configured listener. | manual |
| F1 | Detect a serving listener after validation failure. | manual |
| F2 | Detect missing service through a configured listener after accepted startup. | manual |
