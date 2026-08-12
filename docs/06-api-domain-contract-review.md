# API and Domain Contract Review v0.1

**Status:** Proposed for Milestone 0.5 review

## Ownership rules

- A user owns identities and grants.
- A developer application owns representation profiles.
- A representation belongs to one identity, application, and profile version.
- An application may access a representation only through an active grant with sufficient scope.
- Storage references are internal and never appear in the public API.

## Core entities

### User

`id`, `status`, `created_at`, `updated_at`

### Identity

`id`, `user_id`, `status`, `canonical_version`, `created_at`, `updated_at`, `deleted_at?`

### CanonicalManifest

`identity_id`, `version`, `capture_set_id`, `provenance`, `quality`, `derivative_refs`, `created_at`

### DeveloperApplication

`id`, `owner_id`, `name`, `environment`, `client_type`, `status`, `created_at`

### AuthorizationGrant

`id`, `user_id`, `application_id`, `scopes`, `status`, `granted_at`, `revoked_at?`

### RepresentationProfile

`id`, `application_id`, `version`, `representation_type`, `constraints`, `status`

### Representation

`id`, `identity_id`, `application_id`, `profile_id`, `profile_version`, `canonical_version`, `status`, `generator_version`, `asset_set_id?`, `created_at`

### ProcessingJob

`id`, `job_type`, `subject_id`, `idempotency_key`, `status`, `attempt`, `available_at`, `lease_owner?`, `lease_expires_at?`, `error_code?`, timestamps

### Asset

`id`, `asset_set_id`, `kind`, `format`, `storage_reference`, `checksum`, `size_bytes`, `metadata`, `expires_at?`

### AuditEvent

`id`, `actor_type`, `actor_id`, `action`, `subject_type`, `subject_id`, `application_id?`, `timestamp`, `metadata_safe`

## State models

- Identity: `pending`, `ready`, `failed`, `deleted`
- Representation: `requested`, `queued`, `processing`, `validating`, `ready`, `failed`, `invalidated`, `deleted`
- Grant: `active`, `revoked`, `expired`
- Job: `queued`, `leased`, `running`, `retry_wait`, `succeeded`, `failed`, `cancelled`

## Public API

All routes use `/api/v1` and opaque IDs.

### Player and portal

```text
GET    /identities
GET    /identities/{identity_id}
GET    /authorizations
POST   /authorizations/{application_id}
DELETE /authorizations/{application_id}
```

Identity creation and capture submission remain unavailable during the synthetic-only MVP.

### Application backend

```text
GET  /applications/{application_id}/profiles
POST /representations
GET  /representations/{representation_id}
GET  /representations/{representation_id}/assets
```

### Jobs

```text
GET /jobs/{job_id}
```

## Representation request

```json
{
  "identity_id": "idn_...",
  "profile_id": "style_a",
  "profile_version": 1
}
```

Requires an authenticated application and an active grant with `representation:request`.

## Queued response

```json
{
  "representation_id": "rep_...",
  "status": "queued",
  "job_id": "job_..."
}
```

## Ready asset response

Public responses return an opaque download URL with a short expiration. Bucket names, keys, providers, and internal storage references are never returned.

## Errors

```json
{
  "error": {
    "code": "AUTHORIZATION_REVOKED",
    "message": "Player authorization is no longer active.",
    "request_id": "req_..."
  }
}
```

Initial stable codes:

- `AUTHENTICATION_REQUIRED`
- `AUTHORIZATION_REQUIRED`
- `AUTHORIZATION_REVOKED`
- `SCOPE_INSUFFICIENT`
- `IDENTITY_NOT_READY`
- `IDENTITY_NOT_FOUND`
- `PROFILE_NOT_FOUND`
- `PROFILE_VERSION_UNSUPPORTED`
- `REPRESENTATION_NOT_FOUND`
- `REPRESENTATION_PROCESSING_FAILED`
- `RATE_LIMITED`
- `INTERNAL_ERROR`

Not-found responses should be used where forbidden responses would reveal another user's or application's resources.

## Idempotency

`POST /representations` requires an idempotency key scoped to the authenticated application. Reuse with the same request returns the original result. Reuse with different input returns `IDEMPOTENCY_CONFLICT`.

## Review questions

1. Should players select a specific identity when granting access, or may one grant cover all current identities?
2. Should revocation invalidate existing signed URLs immediately or only prevent new URLs?
3. How long should ready representations remain available during the synthetic MVP?
4. Which audit events may be visible to players and developers?
