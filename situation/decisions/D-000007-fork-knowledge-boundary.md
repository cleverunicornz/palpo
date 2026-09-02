# D-000007: Fork knowledge boundary

## Status

accepted

## Date

2026-09-02

## Context

This repository is an upstream fork whose opening record identifies
`https://github.com/palpo-im/palpo` as the external public authority. The donor
tree also contains dense root guides, alternate-language root guides,
contributor and testing procedures, bridge setup prose, and stale core
architecture notes outside the canonical situation namespace.

## Evidence

- `situation/runs/bedrock-20260902T085609Z-e3a831572a0a-0001/opening.md`
  records the `UPSTREAM_FORK` classification and public upstream coordinate.
- `situation/AGENTS.md` defines the fork README lifecycle, documentation
  classification, and operational-authority boundary.
- The donor copies of operational prose are available at
  `e3a831572a0ad857e775fec464354916eda738be:README.md`,
  `e3a831572a0ad857e775fec464354916eda738be:README.zh.md`,
  `e3a831572a0ad857e775fec464354916eda738be:CONTRIBUTING.md`,
  `e3a831572a0ad857e775fec464354916eda738be:TESTING_GUIDE.md`, and
  `e3a831572a0ad857e775fec464354916eda738be:TESTING_GUIDE_zh.md`.

## Decision

Make `situation/` the canonical repository-knowledge surface, keep root
`AGENTS.md` as its concise repository orientation, and reduce the sole root
English README to a human pointer to both. Remove non-functional operational
prose and alternate root READMEs; retain documentation that compilation,
package publication, issue UI, tests, release material, or legal behavior
consumes.

## Why

The protocol assigns authority to root `AGENTS.md` and `situation/`, while this
fork's upstream synchronization and contribution work occurs outside Bedrock.
Keeping duplicate operational guides would leave conflicting authority and
would preserve donor claims without current evidence.

## Rejected alternatives

- Keeping the dense root README or the Chinese root README as canonical setup,
  status, or contributor guidance is rejected.
- Keeping contributor, testing, bridge-operations, or stale architecture prose
  outside `situation/` is rejected.
- Deleting product-functional documentation is rejected: compiled documentation
  inputs, package READMEs, release notes, issue templates, test assets, and
  license material remain in their native paths.

## Consequences

- `I-000007` and `I-000008` make the fork-authority and documentation-boundary
  rules explicit.
- The current README becomes a minimal English projection.
- Removed donor documentation remains retrievable by its historical commit
  coordinates and relevant behavior is represented by the backported records.

## Revisit when

Revisit when repository ownership changes, the Bedrock documentation policy is
superseded, or a currently removed document becomes a verified functional input
or delivered product artifact.