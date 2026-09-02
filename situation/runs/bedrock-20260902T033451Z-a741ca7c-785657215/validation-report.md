# Bedrock validation report

## Verdict

`CORRECT`

The bounded closure receipts, record claims, lifecycle states, orientation files,
and opening-tree provenance are valid. Approval is withheld because the judgment
rules in `situation/oracles/O-000002-postgresql-data-layer.md` and
`situation/oracles/O-000004-health-check-endpoints.md` permit PASS without direct
evidence for behavior expressly included in their judged promises.

## Validated interval

- Run: `bedrock-20260902T033451Z-a741ca7c-785657215`.
- Opening checkpoint: `a9cd4ae32d3dfed74396e6f81625a880e7e111d9`.
- Classification: phase `IMPLEMENTATION`, operation `BACKPORT`, ownership
  `UPSTREAM_FORK`.
- Protocol: `cleverunicornz/yeetz-bedrock-protocol` at
  `5a2c02441ba6aa21482dd64cec2a75330fcc84d4`.
- Records stage: `5245e1a8b2e0c4ef896c73b7033156656c06c7db`.
- Agents-index stage: `614d9877f3c5f28c792b93de205797ff6c69a6c3`.
- README stage: `f54db847e2d93e7f0cbb617d9eb0359e33cc9962`.

The opening checkpoint descends directly from trigger
`a741ca7cd8a57674f5b98cc61e69b1ea34ddc2af`. Each named closer stage descends
directly from the preceding named checkpoint in the order above. Their subjects
and required trailers match their events. The opening adds only this run's
`opening.md`; records adds only the bounded `situation/` records and
`closure-report.md`; agents-index adds only root `AGENTS.md`; README changes only
`README.md`. A fetch of `origin bedrock/v130-backport` resolved to the exact
README-stage SHA, so the complete named chain is remote.

The applicable protocol contract files match every digest recorded in
`situation/protocol-lock.json`.

## Provenance and claim checks

- The BACKPORT implementation citations resolve in the opening tree. The cited
  donor commits for multi-format configuration, KDL, database coordination,
  release security guards, and health routes are ancestors of the opening
  checkpoint, and their cited behavior remains present in the opening blobs.
- The opening-tree `tests/results/test_all.result.jsonl` has only `Action` and
  `Test` fields and carries no tested-head field. Parsing its `Action` field
  directly re-derived `672` `pass` entries and `14` `skip` entries, matching the
  closure report. The file remains historical data rather than a witness.
- Opening-tree `crates/server/src/config/server.rs` directly supports the exact
  `=1` break-glass claims, and opening-tree
  `crates/server/src/routing.rs` directly supports the `200 OK`, plain-text, and
  `ok` health-response claims.
- Record headings, identifiers, links, phases, operation, ownership, and current
  lifecycle states conform to the applicable contracts. The promises remain
  `implemented`; the linked oracles remain `designed` with manual coverage; no
  witness or circular assurance claim was introduced.
- The BACKPORT Decisions preserve the selected PostgreSQL and Salvo providers,
  the release-security policy, and the upstream-fork topology, including the
  corresponding rejected alternatives and revisit conditions.
- Root `AGENTS.md` is concise agent orientation and includes every critical
  invariant. `README.md` is concise human orientation, retains safe startup and
  deployment guidance, and points to authoritative `situation/` records without
  overriding them.

## Correction docket

### V-001 — PostgreSQL URL-source behavior is not decided

**Records target:**
`situation/oracles/O-000002-postgresql-data-layer.md`, judging
`situation/promises/P-000002-postgresql-data-layer.md`.

The Promise expressly includes selection of the primary connection URL from
`db.url` or `PALPO_DB_URL`. Oracle leg P1 instead requires only that "the
configured primary database URL" be used, and its coverage decision inspects the
connections created by a launch. A PASS can therefore evidence either source
without deciding the other named source. No Pass or Fail leg requires direct
evidence that each source selects the URL used for migration and pool
initialization.

**Required target state:** keep the oracle `designed` and its coverage manual,
but make the stated inputs, Pass/Fail conditions, and coverage rows require
direct evidence for the `db.url` path and the `PALPO_DB_URL` path, as well as use
of the selected URL by the PostgreSQL migration connection and pools. The rule
must fail when either named source does not select the intended URL.

### V-002 — Unauthenticated health access is not decided

**Records target:**
`situation/oracles/O-000004-health-check-endpoints.md`, judging
`situation/promises/P-000004-health-check-endpoints.md`.

The Promise expressly says that both health endpoints are unauthenticated. The
oracle inputs name only HTTP responses, and P1/P2 decide status, content type,
and body without requiring the requests to omit authentication credentials. A
credentialed request can therefore satisfy every current Pass leg while leaving
the unauthenticated behavior unobserved.

**Required target state:** keep the oracle `designed` and its coverage manual,
but make the stated inputs, Pass/Fail conditions, and coverage rows require
credential-free requests to each endpoint and fail if either endpoint requires
authentication. Retain direct response evidence for status, content type, and
body.

## Reconciled target state

The docket does not refute either implementation claim and does not justify a
witness or an `assured` lifecycle transition. Correct only the named oracle
rules so a future PASS must evidence the whole judged Promise text. Keep the
promises `implemented`, the plan active, all oracle coverage manual, and the
existing root `AGENTS.md` and `README.md` unchanged; their statements that the
behavior is not runtime-assured remain correct.

No formatter, linter, build, project test, label, comment, closer file, or
terminal checkpoint was run or changed by this validation.
