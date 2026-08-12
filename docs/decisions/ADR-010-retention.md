# ADR-010: Raw capture retention and deletion

**Status:** Proposed  
**Date:** 2026-08-12

## Context

Real facial captures create privacy, biometric, age, ownership, processor, and deletion obligations that are not yet resolved.

## Decision

Prohibit real-user facial captures during the MVP. Use synthetic or explicitly licensed project fixtures marked non-production. Build tracked deletion behavior for synthetic assets without claiming production compliance.

Synthetic representations may be retained for up to 30 days after creation or last authorized use. Representations tied to a revoked application may enter deletion immediately. This is an MVP default policy, not a permanent production commitment.

## Rationale

The first milestone can prove the product architecture without exposing real people to unresolved risk.

## Consequences

No biometric identity, real-user likeness, or production deletion claim is permitted. Logs exclude raw identity content.

## Reversal conditions

Allow real captures only after jurisdiction, age, ownership, classification, processor, retention, deletion, backup, security, and incident-response decisions are approved.
