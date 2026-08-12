# ADR-003: Object storage

**Status:** Proposed  
**Date:** 2026-08-12

## Context

Captures and representations are large, sensitive objects whose physical location must not become a public contract.

## Decision

Use a storage interface with MinIO locally and an S3-compatible service later. Buckets remain private. Public APIs return opaque, short-lived downloads and never expose bucket names, keys, providers, or internal references.

## Rationale

The abstraction keeps local development simple and avoids binding domain logic to one cloud.

## Consequences

Checksums, sizes, formats, ownership, and lifecycle metadata live in PostgreSQL. Access issuance always rechecks authorization.

## Reversal conditions

Revisit when deployment, residency, or partner requirements demand a different storage protocol.
