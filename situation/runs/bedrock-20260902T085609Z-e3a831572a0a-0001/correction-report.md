# Bedrock correction report

## Run

- Run ID: `bedrock-20260902T085609Z-e3a831572a0a-0001`
- Branch: `bedrock/v160-backport`
- Validator docket: `situation/runs/bedrock-20260902T085609Z-e3a831572a0a-0001/validation-report.md`
- Record-correction commits:
  - `2f6d2981e3eda5df92278e77b2b19bf8d7b2199d`
  - `c8c042da8f1aa6316448e09061980ec1a3fa51b2`
  - `93b4231801316a37c8ac6573a13ed51839be463a`
  - `ed0b2a5b4b02babe3ec68a0499fc8b1b16692c85`

## Applied corrections

1. Replaced the nonexistent opening checkpoint in `closure-report.md` with
   `ab9521c9c8f935faaaad519e88d8f40ab48c7c6d`.
2. Renamed `## Coverage` to `## Implementation coverage` in O-000001 through
   O-000006. Every coverage row remains `manual`; the Oracles remain
   `designed`, and no PASS observation or Witness was created.
3. Expanded the designed judgment rules without changing their Promise scopes:
   - O-000001 now separately decides explicit CLI, `PALPO_CONFIG`, and default
     configuration selection; a two-listener serving case; and direct ordered
     evidence that logging, data, storage, and configured-appservice
     initialization finish before serving.
   - O-000003 now decides both below-two inputs (`0` and `1`), explicit
     allocation boundary cases and the full budget-partition property, and the
     separate one-off migration connection before either pool.
   - O-000005 now decides the public resolver input contract, independently
     expected `AuthorizationRules` and `StateResolutionV2Rules` divergence
     cases, conflicted-state-subgraph use, and its named required-input error
     cases. Its fixtures are explicitly not a Matrix conformance corpus.
4. Replaced P-000003's historical data-layer coordinate with
   `e3a831572a0ad857e775fec464354916eda738be:crates/data/src/lib.rs`.
5. Aligned the appservice records with the existing loader behavior:
   P-000006, O-000006, D-000006, and I-000006 distinguish in-memory acceptance
   from successful persisted enabled data-layer availability, limit duplicate
   handling to files encountered during one directory load, and make hidden
   `_` device insertion conditional on the sender having no existing device.
   O-000006 now includes deserialization-failure, same-load-duplicate,
   persistence-success, enabled/disabled, and pre-existing-non-default-device
   judgment cases.

## Boundary and verification

- No donor implementation, build configuration, test asset, checkpoint commit
  or checkpoint file, protocol-owned text, Oracle state, or Witness changed.
  The closure report's incorrect opening-SHA reference is the documented
  correction.
- Direct record inspection and targeted searches confirmed all six required
  Oracle headings, the corrected P-000003 coordinate, and the conditional
  appservice record wording.
- No formatter, linter, build, or project-wide test suite was run, as required
  for this correction assignment.
