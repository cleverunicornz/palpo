# D-000008: Upstream-owned fork boundary

## Status

accepted

## Date

2026-09-06

## Context

The `DELTA` interval
`1ea6cc66e1a51fa88ad151f010444e733a987732..82d6013c4ec5fab6b911c2f21a7d6e494903086e`
retires repository-local Bedrock workflow, agent, configuration, and run-report
material while installing the organization-owned fork boundary. `D-000007`
selected an earlier documentation policy that rewrote or removed material from
this upstream fork.

## Evidence

- `AGENTS.md` states in its organization-owned fork rules that upstream-owned
  files are never edited, removed, or rewritten and that fork orientation lives
  only in the root blocks and `situation/`.
- `situation/AGENTS.md` states that, for an `UPSTREAM_FORK`, README and every
  other upstream-owned file remain untouched.
- `1ea6cc66e1a51fa88ad151f010444e733a987732:situation/decisions/D-000007-fork-knowledge-boundary.md`
  records the earlier selection to remove or rewrite non-functional fork
  documentation.
- `1ea6cc66e1a51fa88ad151f010444e733a987732:.github/workflows/bedrock-closure.yml`
  and `1ea6cc66e1a51fa88ad151f010444e733a987732:.omp/agents/bedrock-closer.md`
  are repository-local Bedrock surfaces removed by the DELTA interval.

## Decision

For `cleverunicornz/palpo` as an `UPSTREAM_FORK` of
`https://github.com/palpo-im/palpo`, leave upstream-owned working-tree files
unchanged and keep fork-specific orientation only in the root `AGENTS.md`
blocks and `situation/`. This supersedes the fork-documentation rewrite and
removal policy in `D-000007`.

## Why

The organization-owned fork boundary makes preserving the upstream tree the
condition for clean upstream integration. Root blocks and `situation/` provide
a fork-owned knowledge surface without competing with upstream-owned files.

## Rejected alternatives

- Continuing `D-000007`'s rewrite or removal of upstream-owned documentation is
  rejected because it conflicts with the current fork boundary and makes
  upstream integration less clean.
- Recreating repository-local Bedrock workflow or agent surfaces is rejected
  because the current protocol places closure reports in pull-request comments
  and supplies Bedrock automation outside the target repository.

## Consequences

- `I-000009` states the resulting critical fork rule.
- Fork records use historical `<commit>:<path>` coordinates when they need
  retired run material.
- The root README is deliberately left unchanged in this DELTA closure.

## Revisit when

Revisit when repository ownership changes or the organization-owned fork rules
are superseded.
