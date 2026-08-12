# Project Synora Working Rules

## Product boundaries

- Treat Project Synora as an authorized integration platform, never as a mod loader, injector, cheat layer, or game-restriction bypass.
- Preserve developer control over supported modes, assets, rendering, performance budgets, and artistic direction.
- Never claim an integration or capability that has not been built and tested.
- Keep the MVP narrow and surface product or architectural conflicts instead of silently resolving them.

## Privacy and security

- Treat facial captures, likeness data, embeddings, canonical identities, and derived representations as sensitive data.
- Never expose raw player identity data to a game unless explicitly required, reviewed, and approved.
- Never write sensitive identity content, credentials, signed URLs, or biometric-like data to ordinary logs.
- Require explicit, scoped authorization for application access.
- Design revocation, retention, auditability, and deletion as end-to-end workflows.

## Engineering

- Prefer a modular monolith over premature distributed services.
- Keep expensive representation processing outside the gameplay hot path.
- Use provider interfaces to avoid locking core domain logic to one model or vendor.
- Begin with synthetic identities and a deterministic provider.
- Add tests with each behavior and update documentation when contracts change.
- Record meaningful technical choices in ADRs before implementation.

## Code review rules

- Flag authorization paths that could allow cross-player or cross-application access.
- Flag changes that weaken consent, revocation, retention, deletion, or audit guarantees.
- Flag client-side secrets and unrestricted asset URLs.
- Flag unsupported product claims or scope that turns the platform into unauthorized game modification.

