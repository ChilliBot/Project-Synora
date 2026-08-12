# ADR-001: Backend stack and repository tooling

**Status:** Proposed  
**Date:** 2026-08-12

## Context

The MVP needs a portal, stable API boundary, shared contracts, worker, and room for later SDKs without premature services.

## Decision

Use a TypeScript monorepo with pnpm workspaces. Use Next.js for the portal and Fastify for the independent API. Organize the system as a modular monolith with shared packages and a separately runnable worker. Use OpenAPI/JSON Schema for public contracts and Docker Compose for local dependencies.

## Rationale

One language reduces early friction. A separate API keeps web concerns out of game-facing contracts. Modules preserve boundaries without distributed operations.

## Consequences

The portal must not become an alternative authority. Cross-module calls stay in process until measured needs justify separation.

## Reversal conditions

Revisit if partner tooling requires another language, independent scaling becomes measured, or the selected stack cannot meet SDK/API contract needs.
