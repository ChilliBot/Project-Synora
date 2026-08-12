# ADR-003: Object storage

**Status:** Proposed  
**Date:** 2026-08-12

## Context

Captures and representations are large, sensitive objects whose physical location must not become a public contract.

## Decision

Use a storage interface with MinIO locally and an S3-compatible service later. Buckets remain private. Public APIs return opaque signed downloads targeting a maximum lifetime of five minutes and never expose bucket names, keys, providers, or internal references. New URLs require a fresh authorization check.

## Rationale

The abstraction keeps local development simple and avoids binding domain logic to one cloud.

## Consequences

Checksums, sizes, formats, ownership, and lifecycle metadata live in PostgreSQL. Access issuance always rechecks authorization.

Revocation prevents issuance of new URLs immediately. Assets already downloaded by an application are outside Synora's technical revocation boundary.

## Reversal conditions

Revisit when deployment, residency, or partner requirements demand a different storage protocol.
