# O-000003 Release security configuration

## State

designed

## Judges

[P-000003](situation/promises/P-000003-release-security-configuration.md)

## Inputs

- `crates/server/src/config/server.rs` and `crates/server/src/main.rs` from the
  tested head.
- A release-built `palpo` process with controlled unsafe configuration values
  and controlled break-glass environment variables.

## Pass

- P1: A release configuration with `allow_invalid_tls_certificates=true` is
  rejected unless `PALPO_ALLOW_INSECURE_TLS=1`.
- P2: A release configuration with enabled JWT and
  `jwt.validate_signature=false` is rejected unless
  `PALPO_ALLOW_UNSIGNED_JWT=1`.
- P3: Each corresponding exact `=1` override passes these configuration guards.

## Fail

- F1: A release configuration accepts either unsafe setting without its
  corresponding exact `=1` override.
- F2: A release configuration rejects either unsafe setting at this guard when
  its corresponding exact `=1` override is supplied.

## Implementation coverage

| Leg | Decision | Coverage |
|---|---|---|
| P1 | Launch a release binary with the TLS setting and each override state. | manual |
| P2 | Launch a release binary with the JWT setting and each override state. | manual |
| P3 | Capture the configuration-check result for both exact overrides. | manual |
| F1 | Retain any unsafe acceptance without the required exact override. | manual |
| F2 | Retain any guard rejection despite the required exact override. | manual |
