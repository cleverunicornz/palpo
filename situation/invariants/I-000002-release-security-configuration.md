# I-000002 Release security configuration

## Priority

critical

## Invariant

Release configuration keeps outbound TLS certificate validation and enabled JWT
signature validation active unless the corresponding named break-glass
environment variable is exactly `1`.

## Basis

- [D-000003](situation/decisions/D-000003-release-security-guard.md)
