# ADR-009: Processing provider strategy

**Status:** Proposed  
**Date:** 2026-08-12

## Context

Provider cost and quality should not hide failures in authorization, jobs, validation, or asset lifecycle.

## Decision

Define provider interfaces for generation and validation. Implement only a deterministic local provider for the MVP, using synthetic fixtures and predictable Style A/Style B outputs.

## Rationale

Deterministic output makes orchestration and failure behavior testable without network access, API keys, or vendor lock-in.

## Consequences

Provider and generator versions are recorded on every output. No AI quality claim is made.

## Reversal conditions

Evaluate external providers only after the synthetic acceptance test passes and privacy, retention, cost, and evaluation criteria are approved.
