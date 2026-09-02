# Palpo agent index

Palpo is a Rust implementation of a Matrix homeserver maintained as an upstream
fork of https://github.com/palpo-im/palpo.

## State and ownership

- Phase: `IMPLEMENTATION`.
- Bedrock operation: `BACKPORT` run
  `bedrock-20260902T061059Z-10dd77d0-482591941`.
- Ownership: `UPSTREAM_FORK`. `main` is the upstream mirror;
  `internal/main` is the Bedrock-owned operational trunk.

## Critical invariants

- `situation/invariants/I-000001-upstream-fork-topology.md` — normal
  operational work targets `internal/main`; only selected upstream-safe work
  targets `main`; the operational trunk does not merge into the mirror.
- `situation/invariants/I-000002-verified-protocol-inputs.md` —
  `situation/protocol-lock.json` defines immutable protocol inputs, updated
  only by the verified release synchronizer.

## Active delivery

- `situation/promises/P-000001-configured-server-lifecycle.md` is
  `implemented`, not assured. Its manual judgment rule is
  `situation/oracles/O-000001-configured-server-lifecycle.md`.
- `situation/plans/active/PLAN-000001-configured-server-assurance.md` tracks
  the evidence required before that promise can become assured.

## Risk interpretation

The configured-server implementation record is not evidence of current Matrix
compatibility, security, performance, federation behavior, or production
readiness. The closure workflow has GitHub write authority and receives
operational secrets; treat changes to `.github/workflows/bedrock-closure.yml`,
`scripts/bedrock-protocol-sync.sh`, and `situation/protocol-lock.json` as
authority-boundary changes.

## Record protocol

Start with `situation/context.md` for current, intended, and transition state.
Use `situation/AGENTS.md` for record lifecycle, evidence, and reference rules;
use the nested `AGENTS.md` file in a record namespace for its local discipline.
