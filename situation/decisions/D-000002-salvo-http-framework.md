# D-000002 Salvo HTTP framework

## Status

accepted

## Date

2026-09-02

## Context

Palpo needs the HTTP framework that hosts its Matrix routing surface to remain
explicit rather than being inferred from individual route modules.

## Evidence

- `README.md` identifies Salvo as Palpo's web framework.
- `crates/server/Cargo.toml` declares the `salvo` dependency and its server,
  routing, middleware, and TLS-related features.
- `crates/server/src/main.rs` constructs the Salvo `Service` and server.
- `crates/server/src/routing.rs` constructs the request router.

## Decision

Use Salvo as Palpo's HTTP server and routing framework.

## Why

The donor identifies Salvo as the framework supporting Palpo's asynchronous
HTTP service and Matrix Client-Server API routing.

## Rejected alternatives

The donor material names no alternative HTTP framework that was explicitly
rejected. Do not infer a substitute framework from the comparison with other
homeservers.

## Consequences

HTTP routing, middleware, listener integration, and associated test surfaces
continue to use Salvo interfaces until this decision is superseded.

## Revisit when

A concrete replacement framework is proposed with a migration decision and
oracle evidence for the affected routing and operational behavior.
