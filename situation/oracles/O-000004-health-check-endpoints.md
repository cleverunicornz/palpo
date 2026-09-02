# O-000004 Health-check endpoints

## State

designed

## Judges

[P-000004](situation/promises/P-000004-health-check-endpoints.md)

## Inputs

- `crates/server/src/routing.rs` and `crates/server/src/main.rs` from the
  tested head.
- Credential-free HTTP requests and their direct responses from a successfully
  started Palpo listener for `/health` and `/healthz`.

## Pass

- P1: A credential-free `GET /health` request returns HTTP `200 OK`, a plain-text
  content type, and `ok`.
- P2: A credential-free `GET /healthz` request returns HTTP `200 OK`, a plain-text
  content type, and `ok`.

## Fail

- F1: A credential-free `GET /health` request requires authentication or returns
  any other status, content type, or body.
- F2: A credential-free `GET /healthz` request requires authentication or returns
  any other status, content type, or body.

## Implementation coverage

| Leg | Decision | Coverage |
|---|---|---|
| P1 | Capture a credential-free HTTP request to `/health` and its direct response, including status, content type, and body. | manual |
| P2 | Capture a credential-free HTTP request to `/healthz` and its direct response, including status, content type, and body. | manual |
| F1 | Retain direct evidence that a credential-free `/health` request requires authentication or yields a nonconforming response. | manual |
| F2 | Retain direct evidence that a credential-free `/healthz` request requires authentication or yields a nonconforming response. | manual |
