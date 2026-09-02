# Bedrock correction report

## Run

- Run: `bedrock-20260902T033451Z-a741ca7c-785657215`
- Opening checkpoint: `a9cd4ae32d3dfed74396e6f81625a880e7e111d9`
- Validation checkpoint: `1009f99d5d5cfaaf666361c22ca356d887823e5f`
- Correction stage: `records`

## Applied reconciled docket

- `V-001` updates [O-000002](situation/oracles/O-000002-postgresql-data-layer.md)
  so `db.url` and `PALPO_DB_URL` each require direct evidence that their
  intended PostgreSQL URL is selected for the migration connection and query and
  coordination pools; either source selecting a different URL is a failure.
- `V-002` updates
  [O-000004](situation/oracles/O-000004-health-check-endpoints.md) so each
  health endpoint requires a credential-free request and direct response
  evidence for status, content type, and body; either endpoint requiring
  authentication is a failure.

## Preserved disposition

The promises remain `implemented`; the plan remains active; both corrected
oracles remain `designed` with manual coverage; and no witness or `assured`
state was introduced. Root `AGENTS.md` and `README.md` remain unchanged.

## Execution boundary

This records-only correction changes only the two reconciled oracle rules and
this report. No formatter, linter, build, or project test suite was run.
