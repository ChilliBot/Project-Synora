# Design Review Response v0.1

**Status:** Proposed for human review  
**Scope:** PRD v0.1, Architecture v0.2, and Technical Specification v0.3

## 1. MVP restatement

The MVP must prove that one player identity can be created once, separately authorized for two controlled applications, and transformed into two recognizably related but game-native representations. Revoking one application's authorization must block its future access without affecting the other application.

The MVP does not need universal game compatibility, a production-grade 3D avatar, or an unauthorized path into existing games.

## 2. Conflicts and ambiguities

- “Canonical identity” is required but its initial content and portability guarantees are undefined.
- “Recognizable” is central to acceptance but has no measurement method or threshold.
- Revocation blocks future access, but downstream retention and deletion obligations remain unresolved.
- The API assumes a player authorization reference without selecting the game-linking authorization flow.
- The specification anticipates an engine SDK while the simplest useful first representation may not require a full 3D engine pipeline.
- Account eligibility, minors, identity ownership verification, impersonation handling, and launch jurisdiction are not decided.
- Raw capture retention is described as minimal and configurable but needs a concrete default and deletion SLA.

## 3. Decisions blocking implementation

1. Backend stack and monorepo tooling.
2. Database and migration approach.
3. Object storage and local-development substitute.
4. Queue/job mechanism and delivery guarantees.
5. Player/developer authentication and game authorization flow.
6. Initial capture method and canonical identity representation.
7. First engine/demo runtime and representation format.
8. Provider abstraction and deterministic prototype behavior.
9. Raw capture retention, deletion, and downstream obligations.
10. Objective MVP quality and performance criteria.

## 4. Canonical identity approaches

### A. Provider-neutral identity manifest with controlled source captures

Store capture metadata, consent/provenance, quality results, versioning, and provider-generated derivative references behind stable platform interfaces.

**Advantages:** fastest responsible prototype; avoids premature universal-format claims; supports provider experimentation.  
**Costs:** source data remains sensitive; portability initially exists at the platform-contract level rather than the geometry level.  
**Reconsider when:** validated providers converge on a stable parameter or geometry representation.

### B. Structured facial parameters plus identity embedding

Use normalized landmarks/parameters and a protected similarity representation.

**Advantages:** compact and potentially adaptable across engines.  
**Costs:** mapping quality varies; embeddings are sensitive and poorly suited as an interchange promise.  
**Reconsider when:** two engine mappings demonstrate repeatable likeness quality.

### C. Neutral canonical 3D head and material set

Maintain a platform-neutral mesh, landmarks, textures, and metadata.

**Advantages:** closest to the long-term game integration concept.  
**Costs:** topology, rigging, hair, materials, expression, quality, and privacy make this the highest-risk opening path.  
**Reconsider when:** the orchestration MVP is complete and a studio-quality target contract exists.

**Recommendation:** Approach A for the prototype, with versioned interfaces that permit migration toward B or C.

## 5. First engine recommendation

Use Unity for the first engine-facing demonstration because it supports rapid controlled demos, broad developer familiarity, and straightforward SDK packaging. Do not make the engine SDK the first implementation artifact: prove the web/API/job/authorization flow with a minimal renderer first.

Reconsider Unreal as the first engine if the initial partner, required visual-fidelity target, or available technical-art expertise is Unreal-specific.

## 6. Backend recommendation

- TypeScript monorepo.
- Next.js for player/developer web surfaces.
- Fastify or NestJS for an independently deployable API.
- PostgreSQL with Prisma.
- S3-compatible object storage, using MinIO locally.
- PostgreSQL-backed jobs for the first slice; introduce Redis or a managed queue only after throughput or delivery requirements justify it.
- OpenAPI as the source of public API contract generation.
- Docker Compose for local dependencies.

This keeps the early system a modular monolith, reduces language fragmentation, and leaves processing providers isolated behind worker interfaces.

## 7. Prototype processing strategy

Start with a deterministic provider operating only on synthetic fixtures. It should create two versioned outputs from one test identity, validate output manifests and checksums, and exercise asynchronous state transitions, retries, idempotency, caching, and signed delivery.

Integrate a real likeness provider only after the authorization and asset lifecycle is demonstrably correct.

## 8. Threat and privacy decisions

- Determine whether captured and derived data is regulated biometric data in intended jurisdictions.
- Establish age eligibility before accepting real captures.
- Define identity ownership verification and impersonation response.
- Classify source captures, embeddings, parameters, representations, previews, logs, and audit records.
- Define processor access, geographic handling, retention, and deletion propagation.
- Decide what a game may retain after revocation and how compliance is verified.
- Ensure game clients cannot hold credentials capable of retrieving arbitrary player identities.
- Threat-model broken object authorization, cross-application access, replay, malicious uploads, asset URL leakage, and model supply-chain risks.

## 9. Proposed ADR sequence

1. ADR-001: Backend stack and repository tooling.
2. ADR-002: Database and migrations.
3. ADR-005: Authentication and authorization approach.
4. ADR-010: Raw capture retention and deletion policy.
5. ADR-006: Canonical identity representation.
6. ADR-009: Processing provider strategy.
7. ADR-003: Object storage.
8. ADR-004: Queue/job system.
9. ADR-007: First engine SDK.
10. ADR-008: Initial representation format.

Security and privacy decisions move earlier than their original numbering because they constrain the data model and provider design.

## 10. First thin vertical slice

1. Seed one synthetic player identity and two developer applications.
2. Grant each application separate, scoped authorization.
3. Submit an idempotent representation request for each application.
4. Process both through a deterministic asynchronous provider.
5. Validate, version, checksum, and deliver outputs using expiring URLs.
6. Display Style A and Style B in minimal controlled demos.
7. Revoke Demo A and reject its subsequent requests and new downloads.
8. Confirm Demo B remains operational.
9. Verify audit history and tracked deletion workflow behavior.

## 11. Human approvals required

- Approve the proposed backend baseline.
- Approve Unity as the first engine target.
- Approve a 2D or constrained texture-based first representation before 3D geometry.
- Choose initial launch jurisdiction and age policy.
- Decide whether raw real-user captures are prohibited until after the synthetic MVP.
- Define the initial recognizability evaluation method.
- Define revocation and downstream deletion obligations.

## Review recommendation

Approve repository and contract work after ADR-001, ADR-002, and ADR-005. Do not accept real facial captures or integrate a paid generation provider until the retention policy, threat model, data classification, and canonical identity decision are approved.

