# P-000001 Configuration loading

## State

implemented

## Promise

Palpo loads server configuration from a file selected by `--config`,
`PALPO_CONFIG`, or its default configuration-path selection; it accepts TOML,
YAML, JSON, and KDL file extensions and overlays `PALPO_` environment values.

## Scope

This covers startup-time selection and parsing of the server configuration
file, including the environment overlay. It does not assure that a chosen
configuration is operationally sufficient for a deployment.

## Oracle

[O-000001](situation/oracles/O-000001-configuration-loading.md)

## State evidence

- The multi-format loader is present at the opening checkpoint in
  `crates/server/src/config.rs`; TOML, YAML, and JSON support was introduced by
  [c369b5ff951e18b0c174ebbe80b18163d6a063a5](https://github.com/palpo-im/palpo/commit/c369b5ff951e18b0c174ebbe80b18163d6a063a5),
  and KDL support by
  [2c66678b9a03c2deb7b86aa224087375447c86b5](https://github.com/palpo-im/palpo/commit/2c66678b9a03c2deb7b86aa224087375447c86b5).
- `crates/server/src/main.rs` selects `--config`, `PALPO_CONFIG`, or the
  default path before calling the loader.
- No PASS witness has been retained for this promise, so it is not assured.

## Residual

No runtime witness proves every selection path, every supported format, or the
behavior of a configuration against external dependencies.

## References

- `crates/server/src/config.rs`
- `crates/server/src/main.rs`
- `palpo-example.toml`
- `palpo-example.kdl`
