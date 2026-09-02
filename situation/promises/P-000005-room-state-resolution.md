# P-000005: Room state resolution

## State

implemented

## Promise

`palpo_core::state::resolve` accepts caller-supplied room state maps,
authorization chains, event fetch functions, `AuthorizationRules`, and
`StateResolutionV2Rules`; it computes a resolved room state by separating
unconflicted and conflicted state and applying the supplied rules, or returns a
state-resolution error when required state-resolution input cannot be obtained
or processed.

## Scope

This covers the public asynchronous resolver in `crates/core/src/state.rs` and
its documented inputs and error result. It does not assure every Matrix room
version, all caller-provided event implementations, performance on large event
graphs, or compatibility with the stale standalone documentation removed by
this closure.

## Oracle

`situation/oracles/O-000005-room-state-resolution.md`

## State evidence

- `crates/core/src/state.rs` exports `resolve`, documents the Matrix room-v2
  state-resolution algorithm, and implements conflict splitting and rule-driven
  ordering.
- `crates/core/src/state/event_auth.rs` supplies the public authorization
  checks used by this surface.
- The current donor implementation is retained at
  `e3a831572a0ad857e775fec464354916eda738be:crates/core/src/state.rs`.

## Residual

No current resolver test run was collected in this closure. The promise remains
an implementation claim rather than assurance of Matrix state-resolution
conformance.

## References

- `situation/decisions/D-000005-state-resolution-v2.md`
- `situation/invariants/I-000005-explicit-state-resolution-rules.md`