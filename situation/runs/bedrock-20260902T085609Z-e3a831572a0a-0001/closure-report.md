# Bedrock closure report

## Run

- Run ID: `bedrock-20260902T085609Z-e3a831572a0a-0001`
- Opening checkpoint: `ab9521c9c8f935faaaad519e88d8f40ab48c7c6d`
- Operation: `BACKPORT`
- Repository phase: `IMPLEMENTATION`
- Ownership: `UPSTREAM_FORK`
- Public upstream: `https://github.com/palpo-im/palpo`

## Considered

The substantive opening donor tree was read through its workspace manifest,
server startup and routing paths, PostgreSQL data initialization, core
state-resolution API, appservice loader, retained compliance result, and the
repository's Markdown documentation. Historical donor prose is available from
trigger head `e3a831572a0ad857e775fec464354916eda738be`.

## Changed

- Established `situation/context.md` and backported implemented promises for
  configured startup, HTTP routing, PostgreSQL initialization, client-version
  advertising, room state resolution, and appservice registration loading.
- Added a designed oracle for each promise. No oracle is represented as
  executable or passed without an observation.
- Recorded the implemented PostgreSQL, Salvo, explicit-version, state-
  resolution, appservice-loading, and fork-knowledge choices as Decisions and
  their binding rules as Invariants.
- Recorded `G-000001` for missing execution provenance in
  `tests/results/test_all.result.jsonl`, with a proposed evidence-capture
  Candidate and draft assurance Plan.
- Replaced only the repository-specific block in root `AGENTS.md` and reduced
  root `README.md` to the required minimal English human orientation.

## Documentation classification

The following non-functional operational donor documents were removed; their
historical bytes remain retrievable at the trigger head:

- `e3a831572a0ad857e775fec464354916eda738be:README.zh.md`
- `e3a831572a0ad857e775fec464354916eda738be:CONTRIBUTING.md`
- `e3a831572a0ad857e775fec464354916eda738be:TESTING_GUIDE.md`
- `e3a831572a0ad857e775fec464354916eda738be:TESTING_GUIDE_zh.md`
- `e3a831572a0ad857e775fec464354916eda738be:tests/README.md`
- `e3a831572a0ad857e775fec464354916eda738be:examples/with-telegram/README.md`
- `e3a831572a0ad857e775fec464354916eda738be:examples/with-feishu/README.md`
- `e3a831572a0ad857e775fec464354916eda738be:examples/with-discord/README.md`
- `e3a831572a0ad857e775fec464354916eda738be:examples/with-dingtalk/README.md`
- `e3a831572a0ad857e775fec464354916eda738be:crates/core/src/federation/README.md`
- `e3a831572a0ad857e775fec464354916eda738be:crates/core/src/state/README.md`
- `e3a831572a0ad857e775fec464354916eda738be:crates/core/src/state/architecture.md`

The closure retained current product-functional documentation inputs and
artifacts, including compiled Rust documentation inputs under
`crates/core/src/doc/` and `crates/core-macros/docs/`, package READMEs named by
`crates/core-macros/Cargo.toml` and `crates/server-macros/Cargo.toml`, release
material at `crates/identifiers-validation/CHANGELOG.md`, GitHub issue-template
UI inputs under `.github/workflows/ISSUE_TEMPLATE/`, test/configuration assets,
and legal material.

## Evidence state and non-actions

No new Witness was created and no Promise was marked `assured`. The retained
result file's 686 records and its 672 `pass` / 14 `skip` action split are
re-derived from `tests/results/test_all.result.jsonl` in
`situation/gaps/G-000001-compliance-result-provenance.md`; the file's two-field
format cannot prove run head, command, oracle, or independent leg evidence.

No formatter, linter, build, or project-wide test suite was run, as required by
this closer assignment. A targeted removed-path reference scan found no live
references outside the historical donor coordinates retained in situation
records. Upstream synchronization and contribution were not performed; they
remain outside Bedrock under the designated fork-operations skill.

## Left unchanged

The protocol-owned root `<bedrock-protocol>` block, protocol namespace
instructions, runtime source, build configuration, test/configuration assets,
issue-template UI inputs, and legal material were not modified by this closure.