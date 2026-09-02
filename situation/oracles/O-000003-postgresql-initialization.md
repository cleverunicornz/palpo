# O-000003: PostgreSQL initialization

## State

designed

## Judges

`situation/promises/P-000003-postgresql-initialization.md`

## Inputs

- A Palpo build from the head under observation.
- A disposable reachable PostgreSQL database with migration permissions.
- Configurations with database pool sizes of one, two, and larger values,
  including explicit coordination-pool settings.
- Database migration state and pool-status observation.

## Pass

- **P1:** A pool size below two is rejected before a usable data layer is
  created.
- **P2:** A valid configuration runs pending embedded migrations through a
  PostgreSQL connection before pools are used.
- **P3:** For every tested valid budget, query and coordination pools are both
  created, with at least one coordination connection and at least one query
  connection.

## Fail

- **F1:** A pool size below two creates a usable data layer.
- **F2:** A pending migration is skipped and startup nevertheless reports a
  usable initialized data layer.
- **F3:** A tested valid budget allocates zero coordination connections or zero
  query connections.

## Coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Invoke initialization with pool size one and observe rejection. | manual |
| P2 | Start against a disposable database with pending migrations and inspect migration state before pool use. | manual |
| P3 | Observe each pool's status for the tested valid budgets. | manual |
| F1 | Treat successful pool creation from size one as failure. | manual |
| F2 | Treat a usable layer with pending migrations as failure. | manual |
| F3 | Treat either zero-sized effective allocation as failure. | manual |