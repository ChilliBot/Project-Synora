# ADR-005: Authentication and authorization

**Status:** Proposed  
**Date:** 2026-08-12

## Context

Human login is not the product's core differentiator, but player consent, application scopes, isolation, and revocation are.

## Decision

Use managed OpenID Connect for player and developer authentication. Synora owns developer applications, scopes, grants, consent, revocation, and audit history. Public game clients hold no long-lived secrets; confidential backends authenticate separately.

## Rationale

Delegating human authentication avoids building password security while preserving Synora's core authorization model.

## Consequences

Every representation and asset operation must check actor, application, identity ownership, grant status, and scope. Provider selection remains deferred.

## Reversal conditions

Revisit the authentication provider for residency, federation, pricing, availability, or portability concerns—not the internal grant model.
