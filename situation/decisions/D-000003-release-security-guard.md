# D-000003 Release security guard

## Status

accepted

## Date

2026-09-02

## Context

Release configuration can disable outbound TLS certificate validation or JWT
signature validation, both of which would weaken authentication or transport
security if silently accepted.

## Evidence

- [O-000003](situation/oracles/O-000003-release-security-configuration.md)
- `crates/server/src/config/server.rs` describes the TLS setting as exposing
  outbound HTTPS to silent MITM and the JWT setting as accepting any token as a
  valid login.
- `crates/server/src/main.rs` invokes configuration validation before startup
  initializes data, storage, or request serving.

## Decision

Reject those two unsafe settings in release builds unless their corresponding
break-glass environment variable is exactly `1`.

## Why

The donor explicitly marks both settings as unsuitable for production and
makes an override deliberate and visible in the process environment.

## Rejected alternatives

Do not silently accept disabled TLS certificate validation or disabled JWT
signature validation in release builds. Do not treat a value other than exact
`1` as a break-glass override.

## Consequences

Release configuration changes must retain these rejection paths and their
exact override names, or introduce a superseding security decision and oracle.

## Revisit when

The security threat model, configuration mechanism, or break-glass policy is
changed through a reviewed replacement decision with new runtime evidence.
