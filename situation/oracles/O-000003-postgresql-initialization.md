# O-000003: PostgreSQL initialization

## State

designed

## Judges

`situation/promises/P-000003-postgresql-initialization.md`

## Inputs

- A Palpo build from the head under observation and a disposable reachable
  PostgreSQL database with migration permissions and at least one pending
  embedded migration.
- Initialization observations that identify the one-off migration connection,
  both pool-construction events, and the configured query and coordination pool
  capacities.
- Separate invalid `db.pool_size` inputs of `0` and `1`.
- Valid allocation boundary cases with independently calculated
  `(query, coordination)` capacities: `(2, None) -> (1, 1)`,
  `(2, Some(1)) -> (1, 1)`, `(4, Some(1)) -> (3, 1)`,
  `(4, Some(3)) -> (1, 3)`, `(20, Some(2)) -> (18, 2)`,
  `(64, None) -> (48, 16)`, and `(64, Some(32)) -> (32, 32)`.
- A capacity property check over each valid total `T >= 2` with an omitted
  coordination value and with explicit values `1 <= C < T`: query capacity and
  coordination capacity are both positive and sum exactly to `T`.

## Pass

- **P1:** Each of the `db.pool_size` values `0` and `1` is rejected before a
  usable data layer, migration connection, or pool is created.
- **P2:** A pending embedded migration runs on an identified one-off PostgreSQL
  connection and completes before construction or use of either query or
  coordination pool.
- **P3:** Every listed allocation boundary case has its independently expected
  capacities, and the stated valid-total property shows that the two capacities
  consume, and do not exceed, the configured connection budget.

## Fail

- **F1:** Either `db.pool_size` value below two creates a usable data layer,
  migration connection, or pool.
- **F2:** A pool is constructed or used before the one-off migration completes,
  the migration is skipped, or the migration connection is one of the pools.
- **F3:** A listed boundary case or valid-total property case has a zero
  capacity, capacities that do not sum to its configured budget, or capacities
  different from its independently expected explicit allocation.

## Implementation coverage

| Leg | Decision method | Coverage |
|---|---|---|
| P1 | Invoke initialization separately with `db.pool_size` `0` and `1`; inspect rejection and all connection/pool observations. | manual |
| P2 | Run pending migration while recording the migration connection identity and ordered pool-construction/use events. | manual |
| P3 | Compare every listed boundary allocation and the valid-total capacity property to their independently calculated values. | manual |
| F1 | Treat a usable layer, migration connection, or pool for either below-two input as failure. | manual |
| F2 | Treat any migration omission, pool activity before migration completion, or shared migration/pool connection as failure. | manual |
| F3 | Treat a nonpositive, nonpartitioning, over-budget, or explicitly mismatched capacity result as failure. | manual |