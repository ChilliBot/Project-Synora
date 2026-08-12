# MVP Milestone Plan

No milestone begins until the previous milestone builds, tests, meets its acceptance criteria, updates its documentation, and receives human approval.

If an MVP shortcut would block the long-term goal of portable player identity, work pauses until the trade-offs are reviewed.

## Milestone 0 — Architecture baseline

- Review ADR-001 through ADR-010.
- Review system boundaries and synthetic-data flows.
- Confirm deferred decisions and non-goals.

**Done when:** The ADRs and diagrams agree with the product foundation, document their reversal conditions, and are approved.

## Milestone 0.5 — API and domain contracts

- Review core entities, ownership rules, state models, endpoints, schemas, errors, idempotency, and authorization checks.
- Confirm which contracts are public and which remain internal.

**Done when:** Contract examples validate, authorization boundaries are explicit, errors are stable and safe, docs are current, and the contract set is approved.

## Milestone 1 — Repository skeleton

- Create the pnpm workspace, web, API, packages, worker, local dependencies, migrations, CI, and basic checks.

**Done when:** A clean checkout installs, builds, tests, starts locally, matches the approved contracts, and is approved.

## Milestone 2 — Identity and representation core

- Seed synthetic identities and applications.
- Implement manifests, profiles, jobs, deterministic processing, storage, validation, checksums, and idempotency.

**Done when:** One synthetic identity produces two repeatable representations, failure paths are tested, docs are current, and the milestone is approved.

## Milestone 3 — Authorization and revocation

- Add managed OIDC, application identity, scoped grants, isolation, revocation, and audit history.

**Done when:** Revoking Demo A blocks its new requests and downloads without affecting Demo B, security tests pass, docs are current, and the milestone is approved.

## Milestone 4 — Thin end-to-end demo

- Connect the portal, API, worker, storage, two applications, and audit trail.

**Done when:** The synthetic MVP acceptance test passes from a clean environment, failure states are visible, docs are current, and the result is approved.

## Deferred

- Real facial captures
- Paid generation providers
- Canonical 3D geometry
- Unity or Unreal SDK implementation
- Production cloud selection
- Redis or another queue
- Microservices
- Partner or compatibility claims
