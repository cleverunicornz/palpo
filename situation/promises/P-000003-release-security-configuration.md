# P-000003 Release security configuration

## State

implemented

## Promise

In a release build, Palpo's configuration check refuses disabled outbound TLS
certificate validation unless `PALPO_ALLOW_INSECURE_TLS` is exactly `1`, and
refuses an enabled JWT configuration with signature validation disabled unless
`PALPO_ALLOW_UNSIGNED_JWT` is exactly `1`.

## Scope

This covers the two release-build checks executed by `ServerConfig::check()`.
It does not assure TLS or JWT security after an operator deliberately uses a
break-glass override, and it does not cover debug builds.

## Oracle

[O-000003](situation/oracles/O-000003-release-security-configuration.md)

## State evidence

- The release checks and exact override values are present at the opening
  checkpoint in `crates/server/src/config/server.rs` and were introduced by
  [fa5884a6516a024c0680510c2f255e8b823733ac](https://github.com/palpo-im/palpo/commit/fa5884a6516a024c0680510c2f255e8b823733ac).
- `crates/server/src/main.rs` calls `ServerConfig::check()` before logging,
  data initialization, storage initialization, and request serving.
- No PASS witness has been retained for this promise, so it is not assured.

## Residual

No runtime witness proves the release binary's behavior for either rejection or
break-glass path. The explicit overrides remain outside any security assurance.

## References

- `crates/server/src/config/server.rs`
- `crates/server/src/main.rs`
- `palpo-example.toml`
