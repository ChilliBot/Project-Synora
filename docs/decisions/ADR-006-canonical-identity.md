# ADR-006: Canonical identity representation

**Status:** Proposed  
**Date:** 2026-08-12

## Context

The platform needs a durable identity contract before there is evidence for a universal mesh, parameter set, or embedding.

## Decision

Represent canonical identity as a versioned manifest referencing controlled captures, provenance, quality results, and derived outputs. Keep the format extensible and do not claim geometry-level portability.

## Rationale

The manifest establishes identity lifecycle and provenance while allowing representation experiments behind stable interfaces.

## Consequences

Every representation records the canonical version used. Sensitive values stay behind internal references.

## Reversal conditions

Move toward structured parameters or geometry only after two different target representations demonstrate repeatable likeness and mapping quality.
