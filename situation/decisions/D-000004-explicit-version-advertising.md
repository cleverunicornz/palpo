# D-000004: Explicit client-version advertising

## Status

accepted

## Date

2026-09-02

## Context

The Matrix client `/versions` response must state what the server advertises.
The current route keeps a literal reviewed version set separate from the
`MatrixVersion` type used for outgoing protocol work.

## Evidence

- `crates/server/src/routing/client.rs` defines
  `SUPPORTED_MATRIX_VERSIONS`, returns it from `supported_versions_body`, and
  states why it remains independent from `MatrixVersion`.
- `crates/server/src/routing/client.rs` contains focused tests for the response
  construction, although this closure did not run them.

## Decision

Advertise only the explicit `SUPPORTED_MATRIX_VERSIONS` literal from the client
versions endpoint; do not infer server support from the broader
`MatrixVersion` type.

## Why

The source comment identifies the relevant distinction: understanding a
protocol version for outgoing requests does not imply full server support.
The literal list is therefore the current declared support boundary.

## Rejected alternatives

- Deriving the advertised set from `MatrixVersion` is rejected by the source's
  explicit separation of those concepts.
- Advertising a version merely because the core library can parse or send it is
  not selected.

## Consequences

- `P-000004` states the exact observable version-list behavior.
- `I-000004` binds the separation as a repository rule.
- The result is an implementation claim, not an assurance of every Matrix
  capability associated with each advertised version.

## Revisit when

Revisit when the literal advertised set or the endpoint's derivation changes
and a replacement promise, oracle, and evidence are available.