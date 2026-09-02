# I-000004: Explicit advertised-version boundary

## Priority

standard

## Invariant

The Matrix client `/versions` response advertises only versions explicitly
reviewed in its dedicated literal set; it does not derive support from the
broader `MatrixVersion` type.

## Basis

- `situation/decisions/D-000004-explicit-version-advertising.md`