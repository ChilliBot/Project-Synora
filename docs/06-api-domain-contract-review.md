# API and Domain Contract Review v0.1

**Status:** Approved MVP baseline

**Approval scope:** Identity-specific grants, immediate revocation of new asset access, short-lived signed URLs, MVP representation retention, and limited audit visibility. These defaults may be revisited through a later decision record without silently changing the MVP contract.

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

`id`, `user_id`, `identity_id`, `application_id`, `scopes`, `status`, `granted_at`, `revoked_at?`

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

## Approved authorization behavior

- A grant applies to one explicitly selected identity and one application.
- Creating another identity never adds it to an existing grant.
- Every representation request must match the identity and application on the active grant.
- Revocation prevents new representation requests and new signed asset URLs immediately.
- Existing signed URLs target a maximum lifetime of five minutes.
- Synora does not attempt to revoke assets already downloaded by an application.

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

The MVP target for signed URL lifetime is five minutes. Asset access must be authorized again before each new URL is issued.

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

## Approved retention behavior

- Synthetic MVP representations may be retained for up to 30 days after creation or last authorized use.
- Authorized use may extend the retention window, but never beyond 30 days from that use.
- Representations associated with a revoked application may enter deletion immediately.
- This is an MVP default, not a permanent production retention promise.
- Deletion is tracked as a workflow rather than treated as complete when a single database row changes.

## Approved audit visibility

Players may view safe events tied to their identity for:

- grants;
- revocations;
- representation requests;
- asset access.

Developers may view the same event categories for applications they own, using safe metadata only.

The following remain internal:

- processing internals;
- security telemetry;
- provider diagnostics;
- infrastructure and operational details;
- sensitive identifiers or storage references.

## Closed review questions

1. Grants are identity-specific and application-specific.
2. Revocation immediately blocks new URLs; existing URLs target five-minute expiry.
3. Synthetic representations use a rolling retention period of up to 30 days.
4. Players and developers receive limited, ownership-scoped audit visibility.
