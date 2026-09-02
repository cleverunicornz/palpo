# P-000004 Health-check endpoints

## State

implemented

## Promise

A running Palpo server exposes unauthenticated `GET /health` and `GET /healthz`
endpoints that return HTTP `200 OK`, a plain-text content type, and the body
`ok`.

## Scope

This covers only the two route handlers after the process has successfully
started and bound a listener. It does not assure dependency health, Matrix
protocol readiness, authorization, or load-balancer integration.

## Oracle

[O-000004](situation/oracles/O-000004-health-check-endpoints.md)

## State evidence

- The routes and handler are present at the opening checkpoint in
  `crates/server/src/routing.rs` and were introduced by
  [cf6aee6fabed031269520854e7d6de4e5324a2fe](https://github.com/palpo-im/palpo/commit/cf6aee6fabed031269520854e7d6de4e5324a2fe).
- `crates/server/src/main.rs` serves the routing root after startup
  initialization.
- No PASS witness has been retained for this promise, so it is not assured.

## Residual

No runtime witness proves that either endpoint is reachable from a real listener
or behaves correctly through a proxy.

## References

- `crates/server/src/routing.rs`
- `crates/server/src/main.rs`
