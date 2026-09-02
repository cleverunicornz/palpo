# C-000001: Provenanced Complement witness

## State

proposed

## Candidate

Run the existing Complement harness against a named Palpo commit and retain the
command, dependency/image identities, complete result artifact, and
oracle-leg-specific evidence as a witness for a precisely scoped Matrix HTTP
promise.

## Origin

`situation/gaps/G-000001-compliance-result-provenance.md`

## Why consider it

`tests/complement.sh` already provides a repository test-harness entrypoint,
and `tests/results/test_all.result.jsonl` demonstrates a historical result
format. Capturing missing provenance could qualify an assurance decision without
relying on a README claim or a result artifact as evidence of itself.

## Qualification questions

- Which finite client or federation behavior promise is narrow enough for the
  selected Complement cases to cover completely?
- Which exact Complement revision, container/image identities, command,
  configuration, and result artifacts must be retained?
- How will every Pass and Fail leg be independently evidenced rather than
  inferred from the result file under judgment?
- What output and retention path make the observation retrievable as an
  immutable witness?

## Candidate approaches

- Invoke `tests/complement.sh` with a pinned external Complement checkout and
  retain its result and run provenance.
- Use a separately defined, smaller HTTP oracle when the suite cannot cover the
  complete promise text.

## Disposition

None. This Candidate has not been promoted, rejected, merged, or superseded.