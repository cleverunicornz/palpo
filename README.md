# Palpo

Palpo is a Rust implementation of a Matrix homeserver using PostgreSQL for its
primary persistent data and Salvo for HTTP service and routing.

Palpo is under active implementation. Use a staging deployment before relying
on it for production communication, and maintain database backups appropriate
to your operation.

## Quick start

This fork keeps ordinary operational work on `internal/main`; `main` mirrors
upstream. Start from an `internal/main` checkout:

```bash
git clone https://github.com/cleverunicornz/palpo.git
cd palpo
git switch internal/main
cargo build --release
cp palpo-example.toml palpo.toml
```

Edit `palpo.toml` for the deployment, including `server_name`, listeners, and
the PostgreSQL `db.url`. Then start the server with the selected configuration:

```bash
./target/release/palpo --config palpo.toml
```

A started server provides basic process checks at `GET /health` and
`GET /healthz`. These endpoints do not establish database or Matrix-protocol
readiness; see the recorded scope before using them as deployment gates.

## Configuration and deployment

- Start with `palpo-example.toml` or `palpo-example.kdl`. The server also
  accepts YAML and JSON configuration files selected with `--config`.
- Container deployment materials are in `deploy/docker/`.
- The workspace's required Rust version is declared in `Cargo.toml`.
- PostgreSQL is the primary persistent backend; plan migrations, backups, and
  operational monitoring before deployment.

## Project records

The repository's current behavior, assurance status, and branch roles are
recorded under `situation/`:

- `situation/context.md` — repository identity, phase, current state, and
  upstream-fork topology.
- `situation/promises/` — bounded behavior claims, their residuals, and
  assurance state.
- `situation/oracles/` — the pass and fail rules used to assess each promise.
- `situation/plans/active/PLAN-000001-core-homeserver-assurance.md` — the
  active assurance plan for configuration, storage, release security, and
  health checks.

The listed behavior is source-backed but not yet runtime-assured unless its
record names a passing witness. Consult the relevant promise before treating a
capability as an operational guarantee.

## Contributing and testing

Read `CONTRIBUTING.md` for contribution workflow and `TESTING_GUIDE.md` for
test guidance. Historical Complement output is retained in
`tests/results/test_all.result.jsonl`; it is not a current assurance witness.

## License

Palpo is licensed under Apache-2.0. See `LICENSE`.
