# ADR-002: Database and migrations

**Status:** Proposed  
**Date:** 2026-08-12

## Context

Grants, versions, jobs, audit history, and deletion workflows require transactions and durable relationships.

## Decision

Use PostgreSQL with Prisma ORM. Commit generated SQL migrations and review them before application. Store metadata and state in PostgreSQL, not asset bytes.

## Rationale

PostgreSQL provides the required consistency and concurrency controls. Prisma gives TypeScript integration while editable SQL preserves access to native database features.

## Consequences

Schema changes require migrations and compatibility review. Database constraints remain authoritative even when duplicated in application validation.

## Reversal conditions

Revisit the ORM if it blocks required PostgreSQL behavior. Replace PostgreSQL only if the domain or operational evidence changes materially.
