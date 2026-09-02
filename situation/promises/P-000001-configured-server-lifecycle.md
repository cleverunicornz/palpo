# P-000001 — Configured server lifecycle

## State

implemented

## Promise

Given a valid Palpo configuration and reachable configured dependencies, the
`palpo` process initializes its data and object-storage services and serves its
routing service through every configured network listener. An invalid
configuration is rejected before the process serves requests.

## Scope

This covers configuration selection, validation, startup dependency
initialization, and HTTP or TLS listener service in the server process. It does
not claim Matrix endpoint coverage, federation interoperability, security
hardening, durable recovery, performance, test-suite currency, or production
readiness.

## Oracle

- `situation/oracles/O-000001-configured-server-lifecycle.md`

## State evidence

- The entrypoint was introduced by implementation commit
  `f2179df8adac188bc758e7a5689e19ead0dcdb73`; the implementation present for
  this BACKPORT is
  `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:crates/server/src/main.rs`.
- The opening server crate declares the PostgreSQL-backed data dependency at
  `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:crates/server/Cargo.toml`.

## Residual

No witness has applied the oracle at the opening or records-stage head. This
promise is not assured; the historical Complement artifact does not exercise
this lifecycle oracle, and nothing here assures live deployment behavior.

## References

- `5cbe3e5fa8b0ff6913c91b1e37c3ed7015a2cd7d:palpo-example.toml`
- `situation/decisions/D-000001-postgresql-primary-store.md`
- `situation/plans/active/PLAN-000001-configured-server-assurance.md`
