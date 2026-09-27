<bedrock-repository>
## Palpo

- Identity: Palpo is a Rust Cargo workspace that produces a Matrix homeserver with shared protocol types and a PostgreSQL-backed data layer.
- Ownership: `UPSTREAM_FORK` of public upstream `palpo-im/palpo` (`https://github.com/palpo-im/palpo`); synchronization and contribution follow the organization's fork rules in the organization layer (`git-etiquette` skill).
- Phase and implementation map: `situation/context.md`.
- Critical invariants:
  - [I-000009: Current upstream-fork authority](situation/invariants/I-000009-current-upstream-fork-authority.md): Palpo is an `UPSTREAM_FORK` whose public upstream authority is `https://github.com/palpo-im/palpo`; upstream synchronization and contribution follow the organization's fork rules in the root `<bedrock-organization>` block.
  - [I-000010: Fork knowledge-projection boundary](situation/invariants/I-000010-fork-knowledge-projection.md): For this `UPSTREAM_FORK`, `situation/` is the canonical repository-knowledge surface and the `<bedrock-repository>` block in root `AGENTS.md` is its concise repository orientation; Bedrock preserves upstream-owned files during knowledge projection.
- Verification: No assured, organization-compliant gate is presently recorded. [G-000001: Compliance-result provenance](situation/gaps/G-000001-compliance-result-provenance.md) remains open; [C-000001: Provenanced Complement witness](situation/candidates/C-000001-provenanced-complement-witness.md) remains a proposed evidence-capture response, not a commitment.
- Tool priority: organization defaults.
- Donor boundary: `e3a831572a0ad857e775fec464354916eda738be`.
</bedrock-repository>
