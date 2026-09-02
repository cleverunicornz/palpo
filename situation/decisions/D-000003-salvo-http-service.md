# D-000003: Salvo HTTP service

## Status

accepted

## Date

2026-09-02

## Context

The homeserver must expose its Matrix-facing HTTP surface through one service
and route tree. The current server package depends on Salvo and builds its
service and router with Salvo types.

## Evidence

- `crates/server/Cargo.toml` declares the `salvo` dependency and its server
  features.
- `crates/server/src/main.rs` constructs `Service::new(router)` and serves it
  through configured TCP acceptors.
- `crates/server/src/routing.rs` builds the root `Router` and mounts the
  Matrix, discovery, health, administrative, and static route groups.
- `e3a831572a0ad857e775fec464354916eda738be:README.md` names Salvo as the
  web framework used by Palpo.

## Decision

Use Salvo's router and service types as the HTTP entrypoint for the Palpo
homeserver.

## Why

The current implementation already composes request guards, Matrix route
subtrees, response handling, and configured acceptors through Salvo. Recording
that existing composition avoids treating a removed README description as the
architecture authority.

## Rejected alternatives

- A different HTTP framework is not selected by the current server
  implementation.
- A separate router per externally exposed surface is not selected; the root
  router composes those surfaces before the service is served.

## Consequences

- `P-000001` covers configured startup and `P-000002` covers the mounted route
  surface.
- A framework migration must supersede this decision and update the affected
  promise and oracle records.

## Revisit when

Revisit when the committed server entrypoint no longer constructs and serves a
Salvo `Service` from the root router.