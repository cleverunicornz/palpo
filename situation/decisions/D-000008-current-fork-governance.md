# D-000008: Current fork governance

## Status

accepted

## Date

2026-09-06

## Context

The DELTA interval `1ea6cc66e1a51fa88ad151f010444e733a987732..b8bb8410d468b1391911e7f8523b8e62b4135b19` installs the current protocol and organization blocks, removes the legacy closure automation and run-report surface, and changes the fork knowledge boundary. The inherited fork projections in `D-000007`, `I-000007`, and `I-000008` direct synchronization and contribution to a designated skill and prescribe a sole minimal English README. Those directions conflict with the current protocol and organization blocks, which place fork procedure in the organization block and preserve upstream-owned files during a Bedrock knowledge projection.

## Evidence

- `AGENTS.md` assigns upstream synchronization and contribution to the organization fork rules and limits Bedrock to recording ownership and the upstream coordinate.
- `AGENTS.md` requires that upstream-owned files are not edited, removed, or rewritten merely to impose fork orientation.
- `situation/AGENTS.md` requires the same fork boundary and makes `situation/` the canonical knowledge surface.
- `situation/decisions/D-000007-fork-knowledge-boundary.md`, `situation/invariants/I-000007-upstream-fork-authority.md`, and `situation/invariants/I-000008-canonical-knowledge-boundary.md` contain the inherited contradictory projections.
- `b8bb8410d468b1391911e7f8523b8e62b4135b19:situation/protocol-lock.json` records protocol `1.9.1` at `74f728f0ee0d2f490fc819c5b5c01dce6f7c4d70` and organization version `1.1.1`.

## Decision

Supersede `D-000007` for the current fork-governance and knowledge-projection boundary. Record Palpo's `UPSTREAM_FORK` ownership and public upstream coordinate, leave synchronization and contribution to the root organization block, retain `situation/` as canonical repository knowledge, and preserve upstream-owned files during Bedrock knowledge projection. `I-000009` and `I-000010` replace `I-000007` and `I-000008` as the current critical projections.

## Why

The installed protocol and organization rules are the current authority. Keeping inherited instructions that name a replaced procedure or require rewriting upstream-owned documentation would present contradictory behavior as current and would breach the fork boundary.

## Rejected alternatives

- Retaining `I-000007` and `I-000008` as current critical projections is rejected because their procedure and README requirements contradict the current root blocks.
- Rewriting or removing `README.md` or other upstream-owned documentation to impose the former fork orientation is rejected because the current organization rule preserves those files during Bedrock knowledge projection.
- Restating the organization’s synchronization or contribution procedure in `situation/` or the repository block is rejected because the current protocol assigns it to the root organization block.

## Consequences

- `I-000009` and `I-000010` state the current critical fork authority and knowledge-projection invariants.
- The root `<bedrock-repository>` block projects only those current critical invariants in the protocol template.
- `situation/context.md` uses a historical Git coordinate for the retired opening record and names the organization block as the fork-procedure authority.
- `README.md` remains unchanged: this DELTA changes no human-facing purpose, usage, setup, or capability, and Bedrock does not rewrite an upstream-owned README for orientation.
- `D-000007`, `I-000007`, and `I-000008` remain historical evidence and are not presented as current rules.

## Revisit when

Revisit when the repository’s ownership or public upstream coordinate changes, or when a later protocol or organization block changes the fork-governance or knowledge-projection boundary.

## Supersedes

- `situation/decisions/D-000007-fork-knowledge-boundary.md` for the current fork-governance and knowledge-projection boundary.
