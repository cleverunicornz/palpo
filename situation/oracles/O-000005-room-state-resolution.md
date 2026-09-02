# O-000005: Room state resolution

## State

designed

## Judges

`situation/promises/P-000005-room-state-resolution.md`

## Inputs

- A Palpo-core build from the head under observation and a small harness that
  calls the public asynchronous `palpo_core::state::resolve` API with supplied
  state maps, authorization chains, event-fetch function,
  `AuthorizationRules`, `StateResolutionV2Rules`, and
  conflicted-state-subgraph function.
- Deterministic in-memory fixtures with independently written expected maps:
  an unconflicted common-state fixture; a fully populated conflicting fixture;
  an authorization-rules divergence fixture whose only changed input is
  `AuthorizationRules::V1` versus `AuthorizationRules::V12` and whose expected
  maps differ; and a state-resolution-rules divergence fixture whose only
  changed input is `StateResolutionV2Rules::V2_0` versus `V2_1` and whose
  expected maps differ.
- For the `V2_1` divergence fixture, a known conflicted-state subgraph and an
  observation of the exact conflicted set passed to its supplier; the `V2_0`
  companion must not call that supplier.
- Required-input error fixtures that reach a required fetch or processing path:
  a `StateError::NotFound` fetch result, a `StateError::Other` fetch result, a
  fetched required state event without a state key, and a `V2_1`
  conflicted-state-subgraph supplier that returns `None`.
- The expected maps and errors are fixture-specific judgment data, not a Matrix
  conformance corpus.

## Pass

- **P1:** The unconflicted fixture resolves exactly to its common input state
  map.
- **P2:** The fully populated conflicting fixture accepts the public input
  contract and resolves to its independently specified expected map.
- **P3:** The authorization-rules divergence fixture produces each of its two
  independently specified, different maps when only `AuthorizationRules`
  changes.
- **P4:** The state-resolution-rules divergence fixture produces each of its
  two independently specified, different maps when only
  `StateResolutionV2Rules` changes; its `V2_1` supplier receives the expected
  conflicted set and its `V2_0` companion does not invoke that supplier.
- **P5:** Each required-input error fixture returns its independently specified
  error without a resolved map: `NotFound`, the supplied `Other`,
  `MissingStateKey`, or `FetchConflictedStateSubgraphFailed`, respectively.

## Fail

- **F1:** The unconflicted fixture changes or omits a common state entry.
- **F2:** The fully populated conflicting fixture rejects a supplied public
  input or differs from its independently specified map.
- **F3:** Either authorization-rules result differs from its expected map or
  the two rule inputs produce the same result in the divergence fixture.
- **F4:** Either state-resolution-rules result differs from its expected map,
  the expected subgraph input is not consumed by `V2_1`, or `V2_0` consumes it.
- **F5:** A required-input error fixture resolves a map or returns an error
  other than its independently specified error class.

## Implementation coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Resolve the common-state fixture and compare its complete map to the common input map. | manual |
| P2 | Resolve the fully populated conflicting fixture and compare its map to the prewritten expected map while recording supplied-input use. | manual |
| P3 | Resolve the authorization divergence fixture once per `AuthorizationRules` value and compare both distinct maps to their prewritten expectations. | manual |
| P4 | Resolve the state-resolution divergence fixture once per V2 rule value; compare both maps and record the subgraph supplier's invocation contract. | manual |
| P5 | Run the four required-input error fixtures and compare the result type to `NotFound`, supplied `Other`, `MissingStateKey`, and `FetchConflictedStateSubgraphFailed`. | manual |
| F1 | Treat any common-map mismatch as failure. | manual |
| F2 | Treat public-input rejection or any conflicting-map mismatch as failure. | manual |
| F3 | Treat a rule-insensitive or expected-map-mismatched authorization result as failure. | manual |
| F4 | Treat an expected-map mismatch or incorrect V2 subgraph-supplier behavior as failure. | manual |
| F5 | Treat a resolved map or mismatched required-input error class as failure. | manual |