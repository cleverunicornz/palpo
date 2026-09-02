# Bedrock validation report

## Run

- Run ID: `bedrock-20260902T085609Z-e3a831572a0a-0001`
- Validated interval: `ab9521c9c8f935faaaad519e88d8f40ab48c7c6d..b4bebc3af4c39139724768941d98e6c17b6a726c`
- Branch: `bedrock/v160-backport`
- Operation: `BACKPORT`
- Repository phase: `IMPLEMENTATION`
- Ownership: `UPSTREAM_FORK`

## Verdict

`CORRECT`

The interval has a valid linear Git lineage and the fork documentation boundary
is substantially correct, but the following record and closure claims must be
corrected before approval.

## Correction docket

1. **Use the actual opening checkpoint in the closure report.**
   `situation/runs/bedrock-20260902T085609Z-e3a831572a0a-0001/closure-report.md`
   names `ab9521c9724239950f79a36f43b9a93b6fd32e98`, which is not a repository
   object. Replace it with the opening commit
   `ab9521c9c8f935faaaad519e88d8f40ab48c7c6d`. Git shows that commit with
   subject `bedrock: open closure bedrock-20260902T085609Z-e3a831572a0a-0001`,
   parent `e3a831572a0ad857e775fec464354916eda738be`, and all three supplied
   interior commits descending from it.

2. **Restore the required Oracle heading in every new Oracle.**
   `situation/oracles/AGENTS.md` requires `## Implementation coverage`, but
   O-000001 through O-000006 each use `## Coverage`. Rename that heading in all
   six files. Their existing tables represent manual coverage; no executable
   implementation or PASS result should be invented.

3. **Make each designed Oracle decide the complete Promise it judges.** The
   following asserted behaviors have no corresponding input and independently
   decidable leg. Preserve the current Promise scopes and expand the designed
   Oracles and their coverage tables as follows:

   - O-000001 must exercise `PALPO_CONFIG` selection when `--config` is absent,
     default-path selection when both are absent, more than one configured
     listener, and direct evidence that logging, data, storage, and configured
     appservice initialization occur before serving. Its current P1 covers only
     explicit-CLI precedence and its current P2 uses one listener and an
     undifferentiated “initialization completion” observation.
   - O-000003 must cover both values below two (`0` and `1`), decide that query
     plus coordination allocations remain within and consume the configured
     connection budget, and decide that migration uses the separate one-off
     connection before either pool. “Every tested valid budget” over an
     unspecified sample does not decide the Promise's allocation invariant;
     use explicit boundary/property cases, including explicit coordination
     values.
   - O-000005 must decide the public input contract and the distinct rule-driven
     resolution branches it claims, not infer generic rule application from one
     conflicting fixture. Add independently expected cases that make changes in
     `AuthorizationRules` and `StateResolutionV2Rules` observably affect the
     result, exercise the conflicted-state-subgraph input, and exercise each
     claimed required-input error class. Keep Matrix conformance outside the
     Promise unless an authoritative conformance corpus is added.

4. **Replace P-000003's incorrect historical implementation coordinate.**
   `situation/promises/P-000003-postgresql-initialization.md` says the complete
   claimed implementation is retained at
   `2749d190386324a957930cad2e4bd0b4f70bd4e8:crates/data/src/lib.rs`. A direct
   comparison shows that historical file predates the pool-size guard, split
   query/coordination pools, `COORDINATION_POOL`, and
   `coordination_pool_capacity` on which the Promise depends. Cite
   `e3a831572a0ad857e775fec464354916eda738be:crates/data/src/lib.rs` instead;
   that trigger-head file is byte-identical to the validated implementation for
   this path.

5. **Make the appservice record set describe one truthful implementation
   contract.** P-000006 and O-000006 currently claim that every accepted
   registration is persisted with a default hidden device and becomes available
   through the data layer. In `crates/server/src/global.rs`, the registration is
   added to the accepted in-memory vector before the database upsert; an upsert
   error is logged and execution continues; and the device existence query
   matches any device for the sender user, inserting the hidden `_` device only
   when that user has no device row. “Invalid” files are skipped only when
   extension selection or `Registration` deserialization rejects them; the
   deserialized string fields receive no additional semantic validation. Keep
   the donor implementation unchanged for this BACKPORT and align the records
   to those existing semantics:

   - revise P-000006 so data-layer availability is conditional on successful
     persistence and enabled state, so duplicate scope is explicitly the files
     encountered in that directory load, and so the `_` hidden device is
     inserted only when the sender user has no existing device;
   - revise O-000006 Inputs, P2-P4, F2-F4, and coverage rows to decide those
     conditions, including deserialization failure, same-load duplicate IDs,
     persistence success, and a pre-existing non-default device case rather
     than treating a default device as unconditional;
   - revise the corresponding implementation assertions in D-000006 and the
     unconditional availability wording in I-000006 so the Decision, Invariant,
     Promise, and Oracle preserve the same target state. Do not mark the Oracle
     implemented or create a Witness without a real observation.

These corrections interact only through record truthfulness: the target state
is an unchanged donor implementation described exactly by its BACKPORT records,
with complete designed/manual judgment rules and no invented witness.

## Confirmed controls and evidence

- The supplied interval is exactly three linear commits: implementation
  records, fork documentation boundary, and closure report. No implementation,
  build configuration, functional test asset, or protocol-owned text changed in
  it.
- The root `<bedrock-protocol>` block is byte-preserved. The repository block
  identifies the fork, public upstream, phase, critical ownership boundary, and
  designated fork-operations-skill pointer without embedding fork procedure.
- The operational tree has exactly one root README, `README.md`; it is a minimal
  English orientation to root `AGENTS.md` and `situation/`. All surviving
  `AGENTS.md` files are at the root or allowed situation namespace roots.
- The removed operational Markdown paths have no live references outside their
  historical situation coordinates. Cargo-published package READMEs, compiled
  Markdown inputs, issue-template inputs, changelog, and legal material remain.
- P-000001 through P-000006 remain `implemented`; no Witness exists and no
  Promise is represented as `assured`. O-000002 covers its named router and
  health legs, and O-000004 compares the complete ordered fixed version list;
  the other coverage deficiencies are bounded in the docket.
- G-000001 is a bounded evidence-provenance absence. Its count claims were
  re-derived from `tests/results/test_all.result.jsonl`: 686 records, with 672
  `pass`, 14 `skip`, no `fail`, and exactly the keys `Action` and `Test`.
  C-000001 remains explicitly proposed and non-committing. PLAN-000001 uses a
  future completion condition and performs no Candidate promotion.
- The records stage contains no Candidate promotion, so no promotion
  transaction is incomplete. The backported Decisions, Promises, Oracles, and
  resulting Invariants were introduced together; both critical Invariants are
  projected into root `AGENTS.md`.

No formatter, linter, build, project-wide test suite, or runtime behavior test
was run during validation. The validation used the complete Git interval,
record contracts, targeted source inspection, historical-object comparisons,
documentation inventory, removed-path reference checks, and direct JSONL
aggregation.
