# O-000004 Health-check endpoints

## State

designed

## Judges

[P-000004](situation/promises/P-000004-health-check-endpoints.md)

## Inputs

- `crates/server/src/routing.rs` and `crates/server/src/main.rs` from the
  tested head.
- HTTP responses from a successfully started Palpo listener.

## Pass

- P1: `GET /health` returns HTTP `200 OK`, a plain-text content type, and `ok`.
- P2: `GET /healthz` returns HTTP `200 OK`, a plain-text content type, and `ok`.

## Fail

- F1: `GET /health` returns any other status, content type, or body.
- F2: `GET /healthz` returns any other status, content type, or body.

## Implementation coverage

| Leg | Decision | Coverage |
|---|---|---|
| P1 | Capture an HTTP response for `/health`. | manual |
| P2 | Capture an HTTP response for `/healthz`. | manual |
| F1 | Retain a nonconforming `/health` response. | manual |
| F2 | Retain a nonconforming `/healthz` response. | manual |
