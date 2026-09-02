# D-000005: Async Matrix state resolution v2

## Status

accepted

## Date

2026-09-02

## Context

The core library resolves conflicting Matrix room state. The current exported
resolver takes explicit authorization and state-resolution rules and documents
itself as the algorithm introduced in room version 2.

## Evidence

- `crates/core/src/state.rs` exports `resolve`, accepts
  `AuthorizationRules` and `StateResolutionV2Rules`, and documents its inputs,
  error conditions, and Matrix specification reference.
- `crates/core/src/state/event_auth.rs` exports the authorization checks used
  by the state surface.
- The obsolete donor prose at
  `e3a831572a0ad857e775fec464354916eda738be:crates/core/src/state/README.md`
  describes a different standalone `StateResolution` shape that is not the
  current exported API.

## Decision

Treat the async `palpo_core::state::resolve` implementation and its explicit
rule inputs as the current state-resolution authority; do not retain the stale
standalone `StateResolution` documentation as an operational authority.

## Why

The live public API, not outdated explanatory prose, identifies the
implementation contract that callers currently use.

## Rejected alternatives

- The historical standalone `StateResolution` pseudocode is not retained as a
  current API description.
- Implicitly selecting rules from undocumented global state is not selected;
  the resolver receives authorization and V2 state-resolution rules as inputs.

## Consequences

- `P-000005` records the implemented state-resolution behavior.
- `I-000005` records the resulting repository rule.
- The removed donor state notes remain retrievable through their historical
  commit coordinates.

## Revisit when

Revisit when the exported resolver, its rule inputs, or its Matrix
state-resolution algorithm is replaced.