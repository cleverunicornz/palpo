# O-000001 Configuration loading

## State

designed

## Judges

[P-000001](situation/promises/P-000001-configuration-loading.md)

## Inputs

- `crates/server/src/main.rs` and `crates/server/src/config.rs` from the tested
  head.
- A real `palpo` launch using valid minimal configuration files and controlled
  `PALPO_` environment values.

## Pass

- P1: `--config`, `PALPO_CONFIG`, and the default path each select the intended
  valid configuration file.
- P2: Valid TOML, YAML, JSON, and KDL files load successfully and a supplied
  `PALPO_` value overlays the file value.

## Fail

- F1: Any selection source fails to resolve its intended valid configuration
  file.
- F2: Any listed valid format is rejected, or a supplied `PALPO_` value is not
  applied as an overlay.

## Implementation coverage

| Leg | Decision | Coverage |
|---|---|---|
| P1 | Exercise each configuration selection source against a valid file. | manual |
| P2 | Exercise each supported format and inspect the overlaid effective value. | manual |
| F1 | Record a failed selection of an otherwise valid file. | manual |
| F2 | Record a rejected valid format or missing environment overlay. | manual |
