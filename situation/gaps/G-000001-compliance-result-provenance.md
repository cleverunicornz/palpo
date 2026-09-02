# G-000001: Compliance-result provenance

## State

open

## Gap

The retained Complement-style result file has no execution provenance sufficient
to serve as a Bedrock witness for a current Matrix HTTP behavior promise.

## Relevance

`P-000002` and `P-000004` describe the Matrix HTTP surface. The opening donor
README claimed a Complement result, but a reusable PASS witness must identify a
head, oracle, and independently evidenced legs.

## Evidence

- `tests/results/test_all.result.jsonl` has 686 JSON Lines records. Re-deriving
  `Action` values from that named file yields 672 `pass` records and 14 `skip`
  records; no `fail` value is present.
- Re-deriving the JSON key set from the same file yields only `Action` and
  `Test`. It contains no head, date, command, environment, artifact digest, or
  oracle-leg evidence.
- The historical claim that points to this file is at
  `e3a831572a0ad857e775fec464354916eda738be:README.md`.

## Impact

The result file may provide historical context, but it cannot move a current
promise to `assured` or evidence the complete HTTP route and version-advertising
contracts. The backported promises therefore remain `implemented`.

## Resolution

None. `C-000001` is a possible evidence-capture response; it is not a
commitment to run the suite.

## References

- `situation/candidates/C-000001-provenanced-complement-witness.md`
- `situation/plans/draft/PLAN-000001-matrix-client-surface-assurance.md`