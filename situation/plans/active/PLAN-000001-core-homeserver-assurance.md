# PLAN-000001 Core homeserver assurance

## Promises

- [P-000001](situation/promises/P-000001-configuration-loading.md)
- [P-000002](situation/promises/P-000002-postgresql-data-layer.md)
- [P-000003](situation/promises/P-000003-release-security-configuration.md)
- [P-000004](situation/promises/P-000004-health-check-endpoints.md)

## Dependencies

- P-000001 precedes P-000002, P-000003, and P-000004 because configuration is
  selected before validation, data initialization, and listener service.
- P-000002 and P-000003 precede P-000004 because data initialization and
  configuration validation occur before request serving.

## Completion

P-000001, P-000002, P-000003, and P-000004 are `assured`.
