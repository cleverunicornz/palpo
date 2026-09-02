# P-000004: Client version advertisement

## State

implemented

## Promise

The `GET /_matrix/client/versions` handler returns a `versions` array equal, in
order, to the explicit fourteen-value `SUPPORTED_MATRIX_VERSIONS` literal in
`crates/server/src/routing/client.rs`: `r0.5.0`, `r0.6.0`, and `v1.1` through
`v1.12`.

## Scope

The count and values are re-derived from the literal in
`crates/server/src/routing/client.rs`: two `r0` entries plus twelve `v1` entries
produce fourteen values. This promise covers only the response's `versions`
array. It does not promise complete implementation of every Matrix feature
associated with an advertised version, nor does it cover the separate unstable
feature map or server metadata fields.

## Oracle

`situation/oracles/O-000004-client-version-advertisement.md`

## State evidence

- `crates/server/src/routing/client.rs` defines the literal and maps it into
  `VersionsResBody` in `supported_versions_body`.
- `crates/server/src/routing/client.rs` includes focused construction tests;
  they were not run in this closure.
- The current donor bytes are available at
  `e3a831572a0ad857e775fec464354916eda738be:crates/server/src/routing/client.rs`.

## Residual

No HTTP observation independently comparing a running response with this fixed
list was collected. The implementation is not assurance that the endpoint is
reachable or that other Matrix feature claims hold.

## References

- `situation/decisions/D-000004-explicit-version-advertising.md`
- `situation/invariants/I-000004-explicit-version-boundary.md`
- `situation/plans/draft/PLAN-000001-matrix-client-surface-assurance.md`