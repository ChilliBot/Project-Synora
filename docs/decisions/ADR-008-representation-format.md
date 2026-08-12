# ADR-008: Initial representation format

**Status:** Proposed  
**Date:** 2026-08-12

## Context

The MVP must prove one identity can produce two authorized, distinct representations without solving production 3D assets.

## Decision

Use constrained 2D PNG representations for Style A and Style B, accompanied by a versioned JSON manifest containing provenance, dimensions, checksums, profile version, generator version, and expiration metadata.

## Rationale

This is enough to prove orchestration, portability, authorization, validation, and delivery.

## Consequences

The output is a lifecycle proof, not a final game-asset standard or likeness-quality claim.

## Reversal conditions

Adopt a 3D or engine-specific format only after the synthetic platform flow is approved and target constraints are defined.
