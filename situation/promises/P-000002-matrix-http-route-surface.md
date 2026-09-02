# P-000002: Matrix HTTP route surface

## State

implemented

## Promise

A started Palpo service mounts the client, media, federation, federation-key,
policy, and appservice route groups below `/_matrix`; mounts Matrix discovery
routes below `/.well-known/matrix`; and exposes both `/health` and `/healthz`.
The health handlers respond with HTTP 200, `text/plain; charset=utf-8`, and the
body `ok`.

## Scope

This promise is limited to the root-router mounts and the health response
constructed in `crates/server/src/routing.rs`. It does not claim that every
endpoint in every mounted subtree is implemented, authorized correctly, or
Matrix-spec compliant.

## Oracle

`situation/oracles/O-000002-matrix-http-route-surface.md`

## State evidence

- `crates/server/src/routing.rs` constructs the root router, mounts the named
  subtrees, and defines the health handler.
- The current donor implementation is retained at
  `e3a831572a0ad857e775fec464354916eda738be:crates/server/src/routing.rs`.

## Residual

No end-to-end route observation was collected in this closure. The retained
Complement result file lacks the execution provenance required to assure this
surface; see `situation/gaps/G-000001-compliance-result-provenance.md`.

## References

- `situation/decisions/D-000003-salvo-http-service.md`
- `situation/plans/draft/PLAN-000001-matrix-client-surface-assurance.md`