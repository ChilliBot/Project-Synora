# ADR-004: Queue and job system

**Status:** Proposed  
**Date:** 2026-08-12

## Context

Representation work must be asynchronous, retryable, idempotent, and recoverable without adding infrastructure too early.

## Decision

Use a PostgreSQL-backed job table with atomic claims, leases, bounded retries, retry scheduling, cancellation, and terminal failure states. Run workers separately from the API process.

## Rationale

This proves lifecycle behavior using infrastructure already required by the MVP.

## Consequences

Handlers must be idempotent. Lease and retry behavior require concurrency tests and operational metrics.

## Reversal conditions

Adopt a dedicated queue when measured throughput, latency, isolation, or delivery requirements exceed the PostgreSQL design.
