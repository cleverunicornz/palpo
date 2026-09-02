# O-000002: Matrix HTTP route surface

## State

designed

## Judges

`situation/promises/P-000002-matrix-http-route-surface.md`

## Inputs

- A Palpo service started from the head under observation with a valid local
  configuration.
- HTTP requests and route-resolution inspection for the named `_matrix`,
  discovery, health, and healthz paths.

## Pass

- **P1:** The client, media, federation, federation-key, policy, and
  appservice route groups resolve below `/_matrix`.
- **P2:** The client, policy-server, support, and server discovery routes
  resolve below `/.well-known/matrix`.
- **P3:** `GET /health` and `GET /healthz` both return HTTP 200 with
  `text/plain; charset=utf-8` and body `ok`.

## Fail

- **F1:** Any named `_matrix` route group is absent from the root router.
- **F2:** Any named discovery route is absent from the root router.
- **F3:** Either health route has a different status, content type, or body.

## Implementation coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Resolve one representative path for each named `_matrix` subtree against the root router or a running service. | manual |
| P2 | Request or resolve each named discovery path against the root router. | manual |
| P3 | Issue GET requests to both health paths and compare all three response fields. | manual |
| F1 | Treat a missing representative subtree route as failure. | manual |
| F2 | Treat a missing discovery route as failure. | manual |
| F3 | Treat any status, content-type, or body mismatch as failure. | manual |