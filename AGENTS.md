# Palpo

Palpo is a Rust implementation of a Matrix homeserver backed by PostgreSQL and
served through Salvo.

## Phase, operation, and ownership

- Phase: `IMPLEMENTATION`.
- Current closure operation: `BACKPORT`.
- Ownership: `UPSTREAM_FORK`; `main` is the upstream mirror for
  https://github.com/palpo-im/palpo, while `internal/main` is the
  Bedrock-owned operational trunk.
- Normal work branches from `internal/main`; selected upstream-safe contribution
  branches target `main` rather than integrating the operational trunk into the
  mirror.

## Critical invariants

- [I-000001](situation/invariants/I-000001-postgresql-primary-storage.md): the
  primary persistent data backend is PostgreSQL.
- [I-000002](situation/invariants/I-000002-release-security-configuration.md):
  release configuration retains TLS certificate and JWT signature validation
  unless the corresponding exact break-glass override is present.
- [I-000003](situation/invariants/I-000003-upstream-fork-trunk-separation.md):
  the upstream-mirror and operational-trunk roles remain separate.

## Active promises and plan

- [PLAN-000001](situation/plans/active/PLAN-000001-core-homeserver-assurance.md)
  groups the implemented, not-yet-assured configuration, PostgreSQL,
  release-security, and health-check promises.
- Apply the linked oracle and retain a new witness before changing a promise to
  `assured`.

## Risk interpretation

The recorded behavior is source-backed but not runtime-assured. Treat startup,
database availability, break-glass paths, and externally reachable health checks
as unassured until their manual oracle legs have passing witnesses. The
historical Complement result artifact is not a current witness.

## Record protocol

`situation/context.md` is the authoritative current/intended/transition
orientation. Follow `situation/AGENTS.md` and the relevant nested
`situation/**/AGENTS.md` for identifiers, record relationships, witness
provenance, and reference rules; do not duplicate those rules here.
