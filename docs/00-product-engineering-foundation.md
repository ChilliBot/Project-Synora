# Project Synora --- Universal Gaming Identity Platform

## Product & Engineering Foundation

**Status:** Working specification\
**Codename:** Project Synora (temporary; final product name TBD)\
**Document set:** PRD v0.1 → Architecture v0.2 → Technical Spec v0.3\
**Core principle:** **Players keep their identity. Games keep their
worlds. The platform connects the two.**

------------------------------------------------------------------------

# 01 --- Product Requirements Document (PRD) v0.1

## 1. Executive Summary

Project Synora is an opt-in developer platform for portable player
identity in video games.

The central idea began with a simple observation: some games already let
players scan or photograph their face and create a character resembling
themselves, but these systems are isolated inside individual games. A
player may create themselves in one sports game, then repeat the process
in another title, another engine, and another ecosystem.

Project Synora asks a larger question:

> What if a player could create or capture their gaming identity once,
> authorize a participating game to use it, and appear as themselves
> inside that game's existing character system, clothing, animation,
> lighting, art direction, and performance constraints?

The platform is not intended to replace game characters
indiscriminately, modify games without permission, inject assets into
unsupported titles, or flatten every game's visual style into a
universal avatar aesthetic.

Instead, it provides SDKs, APIs, identity data, transformation tooling,
permissions, and developer controls that allow a participating studio to
decide exactly **whether**, **where**, and **how** portable player
identity is supported.

A sports title could place the player's likeness onto its existing
athlete body and uniforms. A role-playing game could adapt the player's
recognizable facial identity to its own fantasy art direction and armor.
An online open-world game could use the identity for a custom online
character. A strongly authored narrative game could choose not to
support the system in its campaign at all, or could support it only in a
separate mode or custom-player experience.

The goal is not "one identical avatar everywhere."

The goal is **one persistent identity, interpreted appropriately by each
game.**

------------------------------------------------------------------------

## 2. Origin of the Idea

The concept was inspired by character-creation systems such as NBA 2K's
MyPLAYER experience, including the ability to create a player resembling
the real user.

The product insight is that this capability is currently game-specific.
The user must recreate identity repeatedly, while developers repeatedly
build overlapping identity-capture and character-customization
infrastructure.

Project Synora explores whether that process can become reusable
infrastructure.

Early examples discussed include:

-   **NBA 2K / MyPLAYER:** a natural reference case because the player's
    custom identity is central to the experience.
-   **EA Sports FC / Pro Clubs-style modes:** a player's identity could
    be represented on the footballer while the game retains its
    uniforms, body systems, animation, physics, and presentation.
-   **Call of Duty-style operator/custom-player modes:** where permitted
    by the developer, a player's likeness could become part of an
    operator or custom multiplayer identity without replacing the game's
    rendering pipeline.
-   **GTA-style online/open-world experiences:** a strong conceptual fit
    for player-created online characters and roleplay-oriented
    experiences.
-   **Elden Ring-style character creation:** a possible fit where the
    player's recognizable identity can be adapted into the game's visual
    language while armor, world, animation, and mechanics remain native.
-   **The Last of Us and Stranger Things-style authored narrative
    experiences:** examples of where replacing established characters
    could damage storytelling, performance, licensing, or artistic
    intent. These titles illustrate why integration must always be
    optional and developer-controlled.

These examples are illustrative only. They are not claims of
partnerships, compatibility, or planned integrations with those
franchises.

------------------------------------------------------------------------

## 3. Vision

Create a trusted identity layer for games in which a player can
establish a reusable digital representation of themselves and
participating games can consume that identity in a controlled,
game-native form.

### North Star

**Players keep their identity. Games keep their worlds. We connect the
two.**

### Long-Term Vision

A player has a persistent gaming identity that can travel across
supported experiences with explicit consent.

A developer does not receive an uncontrolled foreign character model.
Instead, the developer integrates a supported SDK/API and defines the
acceptable representation:

-   face only;
-   face plus hair;
-   a game-generated stylized likeness;
-   a full custom avatar;
-   specific cosmetics or identity attributes;
-   or no visual identity integration at all.

The game remains authoritative over its world.

------------------------------------------------------------------------

## 4. Mission

Make player identity portable across participating games without
compromising developer control, game performance, artistic direction,
intellectual property, or player privacy.

------------------------------------------------------------------------

## 5. Problem Statement

### Player Problem

Players repeatedly recreate themselves across games. Identity is
fragmented across titles and publishers. Face scans, character settings,
appearance preferences, and related customization are generally trapped
inside individual ecosystems.

### Developer Problem

Studios that want personalized characters may need to build and
maintain:

-   capture flows;
-   image processing;
-   face reconstruction;
-   avatar generation;
-   character mapping;
-   consent systems;
-   storage;
-   moderation;
-   asset processing;
-   engine integration;
-   and account-level identity management.

This creates duplicated effort.

### Platform Opportunity

Provide reusable infrastructure that separates **player identity** from
**game-specific rendering**.

The platform should answer:

1.  Who is this player choosing to represent?
2.  What identity data has the player authorized?
3.  What representation formats does this game accept?
4.  How should the identity be transformed into the game's supported
    character format?
5.  What does the game---not the platform---ultimately render?

------------------------------------------------------------------------

## 6. Product Philosophy

### 6.1 Identity, Not Asset Injection

Project Synora provides identity information and approved generated
assets through official integrations. It does not inject arbitrary
assets into running games.

### 6.2 Integrate, Never Modify

The system integrates with games that intentionally support it. It is
not a modding framework, cheat layer, binary patcher, memory injector,
or mechanism for bypassing game restrictions.

### 6.3 Developer Control Is Absolute

Studios determine:

-   whether integration exists;
-   supported game modes;
-   permitted identity attributes;
-   target art style;
-   polygon/texture/performance budgets;
-   moderation policies;
-   age restrictions;
-   fallback behavior;
-   asset lifetime;
-   and whether a player may use a custom likeness at all.

### 6.4 Preserve Artistic Direction

The player's identity should be recognizable, but the game should still
look like the game.

If the player enters a stylized fantasy game, Project Synora should not
force a photorealistic head into that world. The game can request a
representation compatible with its visual language.

### 6.5 Player Consent and Control

Players must understand:

-   what is captured;
-   what is stored;
-   which game requests access;
-   which data is shared;
-   what generated representations exist;
-   and how access can be revoked.

### 6.6 Portability Does Not Mean Visual Uniformity

The same person may appear differently across games. Identity persists;
rendering does not have to.

### 6.7 Performance Is a Game Constraint

Generated assets must fit the game's budgets and pipeline. Project
Synora should perform expensive processing outside the gameplay hot path
wherever possible.

### 6.8 SDK First, Consumer Magic Second

The consumer experience matters, but adoption depends on developer
integration being predictable, documented, secure, and useful.

------------------------------------------------------------------------

## 7. Product Boundaries

Project Synora **is**:

-   a portable gaming identity platform;
-   an identity/profile service;
-   an SDK/API product for game developers;
-   a player-consent and authorization layer;
-   a transformation pipeline for supported identity representations;
-   a developer-configurable integration system;
-   potentially a player-facing identity application/portal;
-   and eventually an ecosystem for reusable gaming identity.

Project Synora is **not**:

-   a universal mod loader;
-   an unauthorized skin injector;
-   a cheat system;
-   a replacement for Unity, Unreal Engine, or proprietary engines;
-   a promise that every game can or should support custom identity;
-   a system for replacing copyrighted story characters without
    developer authorization;
-   a requirement that all games render one universal avatar model;
-   or a platform that takes creative control away from studios.

------------------------------------------------------------------------

## 8. Integration Model

The platform should support multiple integration levels rather than
forcing one model.

### Level 0 --- Unsupported

The developer does not integrate Project Synora.

Nothing happens. The platform must not attempt to alter the game.

### Level 1 --- Identity Metadata

The game consumes limited non-model identity data, potentially including
a player identity ID, display preferences, or approved profile metadata.

### Level 2 --- Likeness / Face Integration

The game requests an approved representation of the player's facial
identity that can be mapped onto a game-native character.

The game owns:

-   body;
-   clothing;
-   equipment;
-   animation;
-   skeleton;
-   materials;
-   lighting;
-   shaders;
-   physics;
-   gameplay.

Project Synora supplies only the permitted identity component.

### Level 3 --- Stylized Identity

The game requests a transformed representation adapted to its art
direction and technical constraints.

Example: a player's likeness becomes a fantasy-compatible face while
remaining recognizably that player.

### Level 4 --- Full Custom Avatar Integration

Where a game's architecture allows it, the platform can provide a more
complete avatar representation conforming to an agreed specification.

This is a later-stage capability and should not be assumed for the MVP.

### Level 5 --- Custom Experience / Companion Mode

A narrative game could preserve its canonical campaign while optionally
offering a separate experience in which the player exists alongside
established characters rather than replacing them.

This is a future product possibility, not an MVP requirement.

------------------------------------------------------------------------

## 9. Narrative Games and Canonical Characters

The product must explicitly recognize that many games are authored
around specific characters.

For a game like The Last of Us, replacing a canonical protagonist with
the player's face could undermine:

-   storytelling;
-   motion/performance capture;
-   cinematography;
-   emotional continuity;
-   licensing;
-   character identity;
-   and developer intent.

Therefore, Project Synora must never assume that "portable identity"
means "replace the protagonist."

Possible developer-selected approaches include:

-   no integration;
-   multiplayer-only integration;
-   custom-character mode;
-   side/companion mode;
-   post-campaign mode;
-   photo/social mode;
-   or another developer-authored experience.

This limitation is a feature of the product philosophy, not a failure of
the concept.

------------------------------------------------------------------------

## 10. Relationship to Modding

Project Synora should not position itself as a system designed to
eliminate modding.

Some player demand for mods comes from personalization, roleplay, custom
skins, and self-representation. An official identity layer could satisfy
part of that demand in supported games.

However:

-   modding serves many purposes beyond identity;
-   studios have different policies toward mods;
-   Project Synora must not bypass those policies;
-   and "stopping mods" is not a product success criterion.

The stronger positioning is:

> Project Synora gives developers an official, controlled path to offer
> deeper player identity where they choose to support it.

------------------------------------------------------------------------

## 11. Primary Users

### 11.1 Players

Players who want to represent themselves consistently across supported
games.

### 11.2 Game Developers

Engineers and technical artists integrating identity functionality.

### 11.3 Game Designers / Creative Directors

Teams deciding where portable identity fits the experience and how it
should look.

### 11.4 Studio Platform / Security Teams

Teams responsible for privacy, permissions, authentication, safety,
moderation, performance, and compliance.

### 11.5 Internal Project Synora Operators

Teams administering integrations, developer accounts, asset pipelines,
incidents, and platform health.

------------------------------------------------------------------------

## 12. Core User Journeys

### Player: Create Identity

1.  Player creates a Project Synora account.
2.  Player enters the identity creation flow.
3.  Player provides permitted source material, initially likely
    photographs and/or guided capture.
4.  Platform validates capture quality and consent.
5.  Platform creates a canonical identity representation.
6.  Player previews available representations.
7.  Player confirms and saves identity.
8.  Player can review, update, or delete it.

### Player: Connect a Game

1.  Supported game requests Project Synora authorization.
2.  Player sees the requesting game/studio.
3.  Player sees the exact requested permissions.
4.  Player approves or rejects.
5.  Platform issues scoped authorization.
6.  Game requests only allowed representation(s).
7.  Game renders the result through its own systems.

### Player: Revoke a Game

1.  Player opens connected games.
2.  Player selects a game.
3.  Player revokes authorization.
4.  New access is denied.
5.  Retention/deletion behavior follows the agreed developer contract
    and applicable policy.

### Developer: Integrate

1.  Developer creates a project/application.
2.  Developer selects supported integration capabilities.
3.  Developer obtains development credentials.
4.  Developer installs SDK or calls API.
5.  Developer defines technical constraints.
6.  Developer tests against sandbox identities.
7.  Developer validates appearance and performance.
8.  Integration passes required checks.
9.  Developer deploys support.

------------------------------------------------------------------------

## 13. Functional Requirements --- MVP

### FR-001 --- Player Account

The platform shall support player accounts with stable internal
identifiers.

### FR-002 --- Identity Capture

The platform shall accept an initial supported capture method capable of
creating a reusable identity representation.

The MVP should prioritize the smallest viable input path. It does not
need every capture method.

### FR-003 --- Canonical Identity

The platform shall store a canonical, game-independent identity
representation from which supported game-specific representations can be
derived.

The exact format is an architecture decision and must not be prematurely
locked by the PRD.

### FR-004 --- Consent

The platform shall require explicit player authorization before a game
accesses protected identity data or generated representations.

### FR-005 --- Scoped Permissions

Authorization shall be scoped by game/application and capability.

### FR-006 --- Developer Application

A developer shall be able to register an application/integration and
receive sandbox credentials.

### FR-007 --- Representation Request

An authorized game shall be able to request a supported representation
of a player's identity.

### FR-008 --- Game-Specific Constraints

A developer shall be able to specify or configure constraints required
by its integration, such as supported representation type and technical
budget.

### FR-009 --- Asset/Representation Delivery

The platform shall return a representation or a job/result reference
through a documented interface.

### FR-010 --- Revocation

Players shall be able to revoke future access for an application.

### FR-011 --- Deletion

Players shall have a defined path to delete their identity/account data,
subject to clearly documented legal and operational requirements.

### FR-012 --- Auditability

Sensitive identity access and authorization events shall be auditable.

### FR-013 --- Sandbox

Developers shall be able to test without requiring real production
player identities.

### FR-014 --- Demo Integrations

The MVP shall include at least two controlled demo experiences showing
the same identity interpreted by two distinct visual/game contexts.

------------------------------------------------------------------------

## 14. Non-Functional Requirements

### Security

-   Least-privilege authorization.
-   Encryption in transit and at rest for sensitive data.
-   No secrets embedded in client builds where avoidable.
-   Credential rotation.
-   Audit logs for sensitive operations.
-   Threat modeling before production identity capture.

### Privacy

-   Data minimization.
-   Explicit consent.
-   Purpose limitation.
-   Clear retention rules.
-   Revocation and deletion workflows.
-   Separation between source captures and derived assets where
    practical.
-   Special care for biometric-like facial data.

### Performance

-   Expensive generation/transformation should normally happen
    asynchronously.
-   Runtime game integration should favor cached, validated, game-ready
    assets.
-   The platform must not introduce avoidable frame-time dependencies.
-   Failure of Project Synora should not make core gameplay unavailable
    unless the studio intentionally designs that dependency.

### Reliability

-   Idempotent processing where appropriate.
-   Retry-safe jobs.
-   Versioned asset outputs.
-   Backward-compatible APIs within defined support windows.
-   Graceful fallback when identity services are unavailable.

### Portability

The canonical identity model must not depend on a single engine.

### Observability

The system should support metrics, structured logs, traces, job state
visibility, and integration diagnostics.

------------------------------------------------------------------------

## 15. MVP Definition

The MVP is **not** "works in every game."

The MVP proves the central technical and product hypothesis:

> One player identity can be created once, authorized once per
> participating application, and represented convincingly in two
> different controlled game experiences without either experience
> surrendering control of its native art and character pipeline.

### MVP Components

1.  Player identity web application.
2.  Identity capture/import flow.
3.  Canonical identity record.
4.  Consent/authorization system.
5.  Developer application registration.
6.  Developer API.
7.  One initial SDK, selected during architecture work.
8.  Representation processing pipeline.
9.  Two intentionally different demo game experiences.
10. Developer documentation.
11. Basic operational/admin tooling.
12. Security/privacy baseline.

### Explicit MVP Exclusions

-   EA, Rockstar, Activision, 2K, FromSoftware, Naughty Dog, or other
    major-studio partnerships.
-   Production support for arbitrary commercial games.
-   Every engine.
-   Every art style.
-   Full-body photorealistic digital humans.
-   Voice cloning.
-   Cross-game inventory.
-   NFTs/blockchain.
-   user-generated arbitrary code.
-   unauthorized game modification.
-   a marketplace.
-   replacing canonical story characters.

------------------------------------------------------------------------

## 16. MVP Success Criteria

The MVP succeeds when:

1.  A player can create one identity.
2.  The player can authorize two demo applications separately.
3.  Both demos consume the same underlying identity.
4.  Each demo renders the player in a visibly different game-native
    style.
5.  The identity remains recognizably consistent across both.
6.  Neither demo needs to surrender its native skeleton, animation,
    clothing, world, or gameplay systems.
7.  Revocation prevents future authorized retrieval.
8.  Integration is documented well enough that a developer unfamiliar
    with the core implementation can reproduce the integration.
9.  The platform demonstrates acceptable processing latency for the
    chosen MVP workflow.
10. Sensitive identity operations are logged and governed by explicit
    privacy/security rules.

------------------------------------------------------------------------

## 17. Why Now

Several trends make the concept increasingly practical to investigate:

-   advances in image understanding and generative character tooling;
-   more capable automated 3D/2D transformation workflows;
-   mature commercial game engines and plugin ecosystems;
-   cloud asset-processing infrastructure;
-   growing player familiarity with persistent digital identity;
-   widespread character customization;
-   and increasing developer use of service-based infrastructure.

The opportunity is not that identity portability has suddenly become
trivial. It is that enough of the enabling technology exists to test
whether a standardized developer layer can reduce the cost of building
it repeatedly.

------------------------------------------------------------------------

## 18. Adoption Strategy

The initial target should not depend on convincing the largest
publishers in the world.

### Initial Wedge

Indie developers, experimental studios, prototypes, creator ecosystems,
and smaller multiplayer experiences are more realistic early adopters
because:

-   integration cycles can be shorter;
-   differentiation matters;
-   teams may benefit more from outsourced identity infrastructure;
-   and experimentation is easier.

### Expansion Path

1.  Prove the concept internally.
2.  Release excellent developer tooling.
3.  Validate with small external developers.
4.  Learn what integration actually costs.
5.  Improve engine support and tooling.
6.  Build security/privacy credibility.
7.  Accumulate supported experiences.
8.  Approach larger studios only with evidence.

The network effect, if achieved, is:

**more supported games → more value for players → more player identities
→ more reason for developers to integrate.**

This is a hypothesis to validate, not an assumption of guaranteed
growth.

------------------------------------------------------------------------

## 19. Major Risks

### Technical Fragmentation

Games differ in engines, rigs, topology, blendshapes, materials,
shaders, LOD systems, animation systems, art direction, and performance
budgets.

**Response:** Define adapters/contracts. Do not promise a single raw
model that magically works everywhere.

### Quality / Uncanny Results

A recognizable face that looks poor in a target style could damage
trust.

**Response:** Make quality measurable; allow developer previews and
rejection/fallback paths.

### Developer Adoption

A technically impressive platform has no value if integration is harder
than building a local solution.

**Response:** SDK ergonomics and documentation are first-class product
features.

### Privacy / Facial Data

Identity capture may involve highly sensitive data.

**Response:** privacy-by-design, minimization, consent, deletion,
security review, and legal review before production use.

### IP / Licensing

Games, costumes, characters, franchises, and celebrity likenesses can be
protected.

**Response:** game integration is developer-authorized; do not use the
platform to bypass rights or impersonate protected characters.

### Abuse / Impersonation

Users may attempt to create identities based on someone else.

**Response:** design verification, consent, reporting, moderation, and
provenance controls before broad release.

### Scope Creep

The idea naturally expands into voice, inventory, social identity,
cosmetics, animation, and metaverse-like concepts.

**Response:** MVP remains identity + authorization + two demo
integrations.

### Large-Studio Dependence

Designing around hypothetical adoption by major publishers can stall the
project.

**Response:** prove utility without them.

### Performance

Poorly designed runtime processing could hurt games.

**Response:** preprocess and cache assets; keep runtime SDK thin.

### Platform Lock-In

An identity format too closely tied to one engine defeats universality.

**Response:** canonical identity and game adapters must be separated.

------------------------------------------------------------------------

## 20. Critical Assumptions to Validate

1.  Players want persistent self-representation across multiple games.
2.  Developers see value in outsourcing at least part of identity
    capture/transformation.
3.  A canonical representation can be transformed reliably into multiple
    target styles.
4.  The integration can be made materially easier than building
    equivalent functionality from scratch.
5.  Players will trust a third party with identity data if privacy
    controls are strong.
6.  Studios will accept an external identity service if they retain
    rendering and creative control.
7.  Game-ready asset generation can be performed within acceptable
    latency and cost.
8.  A useful standard can exist without requiring every studio to use
    the same character rig.

------------------------------------------------------------------------

## 21. Open Product Questions

These are intentionally unresolved. Codex must not invent answers.

-   What exact source inputs should MVP accept: one photo, multiple
    photos, guided video, manual customization, or a subset?
-   Should the first representation be 2D texture/face parameters, a 3D
    head, blendshape coefficients, or another abstraction?
-   Which engine should receive the first SDK: Unity or Unreal?
-   What is the minimum target fidelity for "recognizably the same
    player"?
-   Which parts of identity are canonical versus game-specific?
-   How long should raw source imagery be retained?
-   What verification is needed to reduce impersonation?
-   What age restrictions are required?
-   Should player accounts be independent or support platform sign-in
    later?
-   What developer review process is required before production
    credentials?
-   Which transformations should be deterministic versus generative?
-   What moderation rules apply to generated representations?
-   How are model/version upgrades handled without unexpectedly changing
    a player's appearance?
-   What pricing/business model eventually makes sense? This is
    deliberately outside MVP implementation.

------------------------------------------------------------------------

## 22. Product Decision Record

### PDR-001 --- Universal Does Not Mean Every Game

**Decision:** The platform supports any game that chooses to integrate;
it does not attempt to force compatibility with every game.

**Reason:** Creative, technical, licensing, and narrative constraints
differ.

### PDR-002 --- Developer Opt-In

**Decision:** Integration is explicit and developer-controlled.

**Reason:** This avoids becoming an unauthorized modification layer.

### PDR-003 --- Preserve Game-Native Systems

**Decision:** Games retain control of bodies, costumes, animation,
physics, lighting, shaders, and gameplay.

**Reason:** The product should provide identity, not replace game
engines.

### PDR-004 --- Story Games May Say No

**Decision:** Canonical narrative games can choose no integration or
limited modes.

**Reason:** Player identity should not undermine authored storytelling.

### PDR-005 --- Same Identity, Different Appearance

**Decision:** Cross-game consistency means recognizable identity, not
pixel-identical avatars.

**Reason:** Each game's visual language must remain intact.

### PDR-006 --- Official Layer, Not Mod Replacement

**Decision:** The platform is positioned as official developer
infrastructure.

**Reason:** Modding is broader than identity and cannot be "eliminated"
by this product.

### PDR-007 --- Indie/Smaller Studio First

**Decision:** Early validation should not depend on major publishers.

**Reason:** Faster iteration and lower partnership barriers.

### PDR-008 --- Architecture Before Production Code

**Decision:** Codex must propose and review architecture after reading
the PRD before implementing the product.

**Reason:** The platform crosses identity, security, asset processing,
game engines, and developer tooling; premature implementation creates
expensive lock-in.

### PDR-009 --- Codename Is Temporary

**Decision:** "Project Synora" is a working codename, not an approved
final brand.

**Reason:** Earlier naming exploration showed that a final name should
be meaningful, understandable, brandable, and checked for conflicts
rather than being an arbitrary invented word.

------------------------------------------------------------------------

## 23. Naming Context

Earlier naming exploration included concepts such as PlayerForge,
AvatarBridge, VerseID, MorphID, PlayerPassport, AvatarLink, and
GameIdentity.

The desired naming direction became clearer:

-   meaningful rather than random syllables;
-   understandable enough to suggest the product's purpose;
-   distinctive enough to become a brand;
-   not unnecessarily narrow;
-   and checked for existing online/company/product use before adoption.

"Project Synora" is therefore only a codename.

Final naming is not a blocker for engineering discovery.

------------------------------------------------------------------------

## 24. Roadmap

### Phase 0 --- Product Definition

**Status:** This PRD.

-   Define vision.
-   Define boundaries.
-   Record decisions.
-   Define MVP.
-   Identify risks and open questions.

### Phase 1 --- Architecture

Deliver Architecture v0.2.

-   system context;
-   trust boundaries;
-   canonical identity abstraction;
-   services;
-   data stores;
-   processing pipeline;
-   auth model;
-   SDK boundaries;
-   engine strategy;
-   observability;
-   deployment;
-   security/privacy architecture;
-   failure modes.

### Phase 2 --- Technical Specification

Deliver Technical Spec v0.3.

-   API contracts;
-   schemas;
-   event/job models;
-   repository structure;
-   SDK interfaces;
-   storage lifecycle;
-   error model;
-   versioning;
-   testing strategy;
-   acceptance tests;
-   implementation sequence.

### Phase 3 --- Thin Vertical Prototype

Build the smallest end-to-end path:

capture → identity → authorization → representation request → processing
→ demo rendering.

### Phase 4 --- Second Demo

Use the same identity in a visually distinct second experience.

### Phase 5 --- Developer Experience

-   SDK hardening;
-   sample app;
-   documentation;
-   sandbox;
-   diagnostics;
-   developer dashboard.

### Phase 6 --- External Validation

Pilot with selected small developers before broadening scope.

------------------------------------------------------------------------

## 25. Instructions to Codex

This PRD is the source of truth for product intent.

When receiving this document:

1.  Read it completely before proposing implementation.
2.  Do not begin production coding immediately.
3.  Separate explicit requirements from assumptions.
4.  Produce a list of ambiguities and architecture questions.
5.  Do not invent product behavior where the PRD is silent.
6.  Prefer the smallest architecture capable of proving the MVP.
7.  Preserve developer control and player consent as hard constraints.
8.  Never design unauthorized game modification, injection, or bypass
    mechanisms.
9.  Keep the canonical identity layer engine-independent.
10. Keep runtime game integrations thin where possible.
11. Treat privacy/security as architecture, not post-MVP cleanup.
12. Explicitly identify build-vs-buy decisions for identity generation.
13. Design interfaces so identity-generation models can evolve without
    breaking game integrations.
14. Use versioned contracts.
15. Propose Architecture v0.2 for human review before implementation.
16. Record new product decisions rather than silently changing this PRD.
17. If a proposed technical shortcut violates a design principle, flag
    the conflict.
18. Keep future ideas out of MVP unless explicitly approved.

### Required First Codex Output

Before writing production code, Codex should return:

-   its understanding of the system in concise terms;
-   unresolved questions;
-   assumptions it believes are safe;
-   major technical risks;
-   proposed MVP architecture;
-   recommended first engine and rationale;
-   proposed canonical identity abstraction options;
-   security/privacy concerns;
-   build-vs-buy recommendations;
-   and an implementation sequence.

------------------------------------------------------------------------

## 26. PRD Definition of Done

PRD v0.1 is complete when:

-   the product can be explained without relying on the original
    conversation;
-   core principles are explicit;
-   examples are clearly illustrative;
-   MVP and non-goals are separated;
-   developer and player responsibilities are clear;
-   major risks are documented;
-   unresolved questions are visible;
-   Codex is instructed not to guess;
-   and architecture is identified as the next gate before
    implementation.

**PRD v0.1 status: COMPLETE FOR ARCHITECTURE DISCOVERY.**

------------------------------------------------------------------------

# 02 --- Architecture Specification v0.2

## 1. Purpose

This section defines a **proposed architecture for discussion**, not an
irreversible implementation mandate.

Where PRD v0.1 leaves product questions open, architecture must expose
choices rather than silently resolve them.

------------------------------------------------------------------------

## 2. Architectural Goals

1.  Engine-independent canonical identity.
2.  Explicit consent and scoped authorization.
3.  Asynchronous transformation of identity into game-ready
    representations.
4.  Thin game runtime SDK.
5.  Replaceable generation/transformation providers.
6.  Strong separation of raw captures, canonical identity, and derived
    game assets.
7.  Versioned developer contracts.
8.  Auditability.
9.  Safe failure behavior.
10. Ability to prove the MVP with two demo experiences.

------------------------------------------------------------------------

## 3. System Context

### External Actors

-   Player
-   Game Client
-   Game Backend
-   Developer
-   Project Synora Operator
-   Identity/representation processing provider(s)

### Core Platform Components

-   Player Web App
-   Developer Portal
-   API Gateway
-   Identity Service
-   Consent/Authorization Service
-   Developer Application Service
-   Representation Service
-   Processing/Job Orchestrator
-   Asset Store
-   Metadata Database
-   Audit Service
-   SDK(s)
-   Admin/Operations Surface
-   Observability Stack

------------------------------------------------------------------------

## 4. Proposed Logical Architecture

``` text
Player
  |
  v
Player Web App
  |
  v
API Gateway
  |-----------------------> Consent/Auth Service
  |-----------------------> Identity Service
  |-----------------------> Representation Service
                                  |
                                  v
                           Job Orchestrator
                                  |
                           Processing Workers
                                  |
                    +-------------+-------------+
                    |                           |
               Asset Store                Metadata DB
                    |
                    v
              Signed Delivery

Developer Portal ---> Developer App Service ---> Credentials/Config

Game Client/Backend ---> SDK/API ---> API Gateway
                              |
                              +--> Authorization Check
                              +--> Representation Request
                              +--> Game-ready result
```

------------------------------------------------------------------------

## 5. Trust Boundaries

### Boundary A --- Player Device

Untrusted client environment.

Never assume player-submitted metadata is trustworthy.

### Boundary B --- Game Client

Also an untrusted client environment.

Long-lived developer secrets must not be embedded in distributed game
binaries.

### Boundary C --- Game Backend

Preferred location for privileged developer-to-platform calls.

### Boundary D --- Project Synora Backend

Trusted platform boundary with internal service authorization.

### Boundary E --- Processing Providers

Treat external AI/graphics providers as separate processors with
explicit data-sharing rules.

### Boundary F --- Object Storage

Sensitive assets require access control, encryption, retention policy,
and short-lived delivery mechanisms.

------------------------------------------------------------------------

## 6. Identity Data Layers

### Layer 1 --- Source Capture

Original player-provided images/video/capture inputs.

Highest sensitivity.

### Layer 2 --- Canonical Identity

Engine-independent representation of the player's identity.

This should be designed as a logical contract, not assumed to be one
specific mesh.

Potential implementations may include combinations of:

-   normalized facial landmarks;
-   embeddings;
-   semantic appearance attributes;
-   neutral reference textures;
-   parametric face coefficients;
-   canonical geometry;
-   provenance and model-version metadata.

The architecture must compare these options before selecting one.

### Layer 3 --- Game Representation

A derived output created for a specific integration profile.

Examples:

-   face parameters;
-   texture set;
-   head mesh;
-   blendshape mapping;
-   stylized image/texture;
-   engine-native prefab/asset bundle;
-   or another studio-approved form.

### Layer 4 --- Runtime Instance

The representation as instantiated by the game.

Project Synora should not own the game's runtime character.

------------------------------------------------------------------------

## 7. Representation Profiles

Each developer application should eventually define one or more
representation profiles.

Example conceptual profile:

``` yaml
profile_id: fantasy_head_v1
representation_type: head
style_profile: stylized_fantasy
max_texture_resolution: 2048
lods: 3
target_coordinate_system: game_defined
supported_outputs:
  - mesh
  - textures
version: 1
```

The exact schema belongs in Technical Spec v0.3.

The important architectural principle is that the game declares what it
accepts.

------------------------------------------------------------------------

## 8. Processing Pipeline

Recommended high-level flow:

1.  Receive source capture.
2.  Validate format and capture quality.
3.  Run safety/consent/provenance checks as required.
4.  Produce/update canonical identity.
5.  Store canonical metadata.
6.  Receive authorized game representation request.
7.  Resolve representation profile.
8.  Check cache for compatible existing output.
9.  If absent, enqueue transformation job.
10. Worker produces candidate representation.
11. Validate technical constraints.
12. Run quality/safety checks.
13. Version and store output.
14. Return job completion/result metadata.
15. Deliver through controlled/signed access.
16. Record audit event.

------------------------------------------------------------------------

## 9. Authorization Architecture

Player authorization should be application-scoped and capability-scoped.

Conceptual scopes may include:

``` text
identity:read_basic
representation:request_face
representation:request_stylized
representation:read
```

Do not finalize scope names until v0.3.

For MVP, prefer a standard authorization pattern rather than inventing a
custom security protocol.

Game clients should not hold privileged application secrets.

------------------------------------------------------------------------

## 10. Runtime SDK Philosophy

The runtime SDK should do as little as practical:

-   establish player authorization state;
-   request representation metadata/results;
-   validate supported versions;
-   download/cache approved assets where appropriate;
-   expose predictable callbacks/errors;
-   provide integration diagnostics.

It should not:

-   run heavyweight generative models during gameplay by default;
-   patch game binaries;
-   bypass engine asset systems;
-   take control of rendering;
-   own gameplay state.

------------------------------------------------------------------------

## 11. Engine Strategy

Do **not** build Unity and Unreal SDKs simultaneously for the first
prototype.

Codex should evaluate:

-   team familiarity;
-   demo speed;
-   character pipeline accessibility;
-   plugin/tooling complexity;
-   sample project availability;
-   CI/testing feasibility.

Choose one engine for the first end-to-end integration.

The second demo may either use the same engine with a radically
different style or introduce a second engine later. The product
hypothesis is identity portability, not "two SDKs immediately."

------------------------------------------------------------------------

## 12. Data Storage Strategy

Separate storage concerns:

### Relational Metadata

Suitable for:

-   users;
-   identities;
-   applications;
-   grants;
-   representation profiles;
-   jobs;
-   asset metadata;
-   versions;
-   audit references.

### Object Storage

Suitable for:

-   source captures;
-   canonical binary artifacts;
-   generated meshes;
-   textures;
-   bundles;
-   preview assets.

### Cache

Useful for:

-   short-lived request acceleration;
-   job status;
-   representation metadata;
-   rate-limit state.

Do not put large binary assets directly in relational rows unless a
specific requirement justifies it.

------------------------------------------------------------------------

## 13. Service Boundaries

For MVP, avoid premature microservices.

Recommended starting approach:

**modular monolith + asynchronous workers**, with clear internal module
boundaries.

Suggested modules:

-   Accounts
-   Identity
-   Authorization
-   Developers
-   Representations
-   Jobs
-   Assets
-   Audit
-   Admin

This can later split where scaling, security, ownership, or deployment
needs justify it.

------------------------------------------------------------------------

## 14. Failure Modes

The architecture must explicitly handle:

-   capture upload failure;
-   invalid capture;
-   generation timeout;
-   provider failure;
-   unsupported representation profile;
-   revoked authorization;
-   expired asset URL;
-   SDK/API version mismatch;
-   malformed game request;
-   deleted player identity;
-   unavailable processing service;
-   corrupted output;
-   quality validation failure.

A game should be able to fall back to its normal character system.

------------------------------------------------------------------------

## 15. Security Architecture Requirements

Before production:

-   threat model identity capture;
-   threat model developer credentials;
-   define PII/biometric classification;
-   use short-lived tokens;
-   separate user and developer authorization;
-   encrypt sensitive objects;
-   maintain access logs;
-   rate-limit abuse-prone endpoints;
-   validate uploaded file types/content;
-   isolate processing workers;
-   scan generated/downloadable artifacts as appropriate;
-   define deletion propagation;
-   define incident response;
-   establish secret management.

------------------------------------------------------------------------

## 16. Privacy Architecture Requirements

The system must be capable of answering:

-   Why do we have this piece of data?
-   Who can access it?
-   Which game received or generated a derivative?
-   When does it expire?
-   Can the player revoke access?
-   Can the player delete it?
-   Which external processor saw it?
-   Which model/version generated a representation?

Raw capture retention should be minimized and configurable based on
actual product need.

------------------------------------------------------------------------

## 17. Observability

At minimum:

-   API request metrics;
-   authorization failures;
-   processing job duration;
-   job failure rate;
-   queue depth;
-   cache hit rate;
-   asset generation cost;
-   SDK version distribution;
-   representation-profile version distribution;
-   storage growth;
-   deletion workflow status.

Never place sensitive raw identity data into ordinary logs.

------------------------------------------------------------------------

## 18. Proposed Deployment Shape --- MVP

Conceptual:

``` text
Web App / Developer Portal
          |
      HTTPS API
          |
   Backend Application
     /      |       \
 DB      Queue     Object Store
           |
        Workers
           |
  Processing Provider(s)
```

Keep infrastructure portable and boring until scale proves otherwise.

------------------------------------------------------------------------

## 19. Architecture Decisions Still Required

Codex must propose options for:

1.  canonical identity representation;
2.  first engine;
3.  initial capture method;
4.  first transformation approach;
5.  backend language/framework;
6.  database;
7.  object storage;
8.  queue/job system;
9.  authentication provider/build-vs-buy;
10. authorization flow for game linking;
11. local development environment;
12. deployment platform;
13. model/provider abstraction;
14. asset format for demo 1;
15. measurable quality criteria.

Each recommendation should include rationale, tradeoffs, and what would
cause the decision to change.

------------------------------------------------------------------------

## 20. Architecture Review Gate

No production implementation should begin until the following are
reviewed:

-   system boundaries;
-   canonical identity approach;
-   authorization model;
-   data classification;
-   processing pipeline;
-   first SDK/engine;
-   asset contract;
-   MVP deployment shape;
-   major build-vs-buy choices.

**Architecture v0.2 status: PROPOSED BASELINE --- REQUIRES CODEX/HUMAN
DESIGN REVIEW.**

------------------------------------------------------------------------

# 03 --- Technical Specification v0.3

## 1. Purpose

This technical specification converts the approved product and
architectural direction into implementation contracts.

Because several architecture decisions remain intentionally open, v0.3
defines the stable interfaces and implementation sequence that can be
established now, while marking unresolved technology selections as
decisions to make before coding.

------------------------------------------------------------------------

## 2. Repository Strategy

Recommended initial repository:

``` text
project-synora/
├── README.md
├── docs/
│   ├── 01-PRD-v0.1.md
│   ├── 02-ARCHITECTURE-v0.2.md
│   ├── 03-TECHNICAL-SPEC-v0.3.md
│   ├── decisions/
│   ├── security/
│   └── diagrams/
├── apps/
│   ├── web/
│   └── api/
├── packages/
│   ├── contracts/
│   ├── sdk-core/
│   └── shared/
├── workers/
│   └── representation/
├── sdk/
│   └── <first-engine>/
├── demos/
│   ├── demo-a/
│   └── demo-b/
├── tests/
└── infra/
```

Exact structure may change after Codex architecture review.

------------------------------------------------------------------------

## 3. Core Domain Entities

### User

``` text
id
status
created_at
updated_at
```

### Identity

``` text
id
user_id
status
canonical_version
created_at
updated_at
deleted_at?
```

### Capture

``` text
id
identity_id
type
storage_reference
status
consent_record_id
created_at
retention_expires_at?
```

### DeveloperApplication

``` text
id
developer_owner_id
name
environment
status
created_at
```

### AuthorizationGrant

``` text
id
user_id
application_id
scopes
status
granted_at
revoked_at?
```

### RepresentationProfile

``` text
id
application_id
name
version
representation_type
constraints
status
```

### Representation

``` text
id
identity_id
application_id
profile_id
profile_version
canonical_version
status
asset_set_id?
generator_version
created_at
```

### ProcessingJob

``` text
id
job_type
subject_id
status
attempt
error_code?
created_at
started_at?
completed_at?
```

### Asset

``` text
id
asset_set_id
kind
format
storage_reference
checksum
size_bytes
metadata
created_at
expires_at?
```

### AuditEvent

``` text
id
actor_type
actor_id
action
subject_type
subject_id
application_id?
timestamp
metadata_safe
```

------------------------------------------------------------------------

## 4. State Models

### Identity

``` text
pending_capture
processing
ready
update_processing
failed
deleted
```

### Representation

``` text
requested
queued
processing
validating
ready
failed
invalidated
deleted
```

### Authorization Grant

``` text
active
revoked
expired
```

Do not overload states with error detail. Use structured error codes.

------------------------------------------------------------------------

## 5. API Style

Use versioned HTTPS APIs.

Conceptual prefix:

``` text
/api/v1/
```

Exact REST vs other interface choice should be confirmed during
architecture review. REST is a reasonable MVP default unless a concrete
requirement favors another approach.

------------------------------------------------------------------------

## 6. Conceptual API Surface

### Player

``` text
POST   /v1/identities
GET    /v1/identities/{identity_id}
DELETE /v1/identities/{identity_id}

POST   /v1/identities/{identity_id}/captures
GET    /v1/identities/{identity_id}/representations

GET    /v1/authorizations
POST   /v1/authorizations/{application_id}
DELETE /v1/authorizations/{application_id}
```

### Developer / Game Backend

``` text
GET  /v1/applications/{application_id}
GET  /v1/applications/{application_id}/profiles

POST /v1/representations
GET  /v1/representations/{representation_id}
GET  /v1/representations/{representation_id}/assets
```

### Job Status

``` text
GET /v1/jobs/{job_id}
```

These routes are conceptual and must be reconciled with the final
authorization model.

------------------------------------------------------------------------

## 7. Representation Request Contract

Conceptual request:

``` json
{
  "player_authorization": "<authorization reference>",
  "profile_id": "fantasy_head_v1",
  "profile_version": 1
}
```

Conceptual response for asynchronous work:

``` json
{
  "representation_id": "rep_...",
  "status": "queued",
  "job_id": "job_..."
}
```

Ready response:

``` json
{
  "representation_id": "rep_...",
  "status": "ready",
  "profile": {
    "id": "fantasy_head_v1",
    "version": 1
  },
  "canonical_version": 3,
  "assets": [
    {
      "kind": "game_asset",
      "format": "<approved-format>",
      "download_url": "<short-lived-signed-url>",
      "checksum": "<checksum>"
    }
  ]
}
```

Never treat the illustrative format names as finalized.

------------------------------------------------------------------------

## 8. Error Model

All public APIs should use stable machine-readable codes.

Conceptual:

``` json
{
  "error": {
    "code": "AUTHORIZATION_REVOKED",
    "message": "Player authorization is no longer active.",
    "request_id": "req_..."
  }
}
```

Initial error categories:

-   AUTHENTICATION_REQUIRED
-   AUTHORIZATION_REQUIRED
-   AUTHORIZATION_REVOKED
-   SCOPE_INSUFFICIENT
-   IDENTITY_NOT_READY
-   IDENTITY_NOT_FOUND
-   PROFILE_NOT_FOUND
-   PROFILE_VERSION_UNSUPPORTED
-   REPRESENTATION_PROCESSING_FAILED
-   CAPTURE_INVALID
-   RATE_LIMITED
-   INTERNAL_ERROR

Do not leak sensitive processing details to untrusted clients.

------------------------------------------------------------------------

## 9. Idempotency

Creation endpoints that can trigger costly work should support
idempotency.

Examples:

-   capture submission finalization;
-   representation request;
-   destructive/retry-sensitive workflows.

A retry should not accidentally create duplicate expensive jobs.

------------------------------------------------------------------------

## 10. Versioning

Version independently where needed:

-   public API;
-   SDK;
-   canonical identity schema;
-   representation profile;
-   generator/model;
-   generated asset;
-   consent policy.

A representation should be traceable to the versions that produced it.

------------------------------------------------------------------------

## 11. SDK Interface --- Conceptual

The engine SDK should expose a small abstraction.

Conceptual pseudocode:

``` text
initialize(config)

beginPlayerAuthorization()

getAuthorizationStatus()

requestRepresentation(profileId)

getRepresentationStatus(representationId)

loadRepresentation(representation)

clearPlayerSession()
```

Engine-specific loading/mapping belongs behind adapters.

The SDK must not pretend every engine has the same character system.

------------------------------------------------------------------------

## 12. Processing Provider Abstraction

Do not hard-code the platform to one AI model/vendor.

Conceptual internal interface:

``` text
CanonicalIdentityProvider
  createCanonicalIdentity(captureSet, options)
  updateCanonicalIdentity(identity, captureSet, options)

RepresentationProvider
  generate(canonicalIdentity, representationProfile)
  validate(output, representationProfile)
```

Provider adapters should record model/provider version and relevant
provenance metadata.

------------------------------------------------------------------------

## 13. Asset Validation

Before an asset becomes READY:

-   expected files exist;
-   checksums generated;
-   size limits satisfied;
-   declared formats match;
-   profile constraints pass;
-   required safety checks pass;
-   preview/quality checks pass as defined.

Invalid output must not silently become production-ready.

------------------------------------------------------------------------

## 14. Cache Strategy

Representation cache key should conceptually depend on:

``` text
identity_id
canonical_version
application_id
profile_id
profile_version
generator_version
```

Changing any identity/profile/generator input may require a new derived
representation.

------------------------------------------------------------------------

## 15. Deletion Semantics

Deletion must be designed explicitly.

Player identity deletion should trigger a tracked workflow covering:

-   canonical identity;
-   retained source captures;
-   generated representations;
-   caches;
-   queued work;
-   object storage;
-   database records that can legally be deleted;
-   tombstones/audit records that must be retained.

"DELETE returned 200" is not sufficient proof of completed data
deletion.

------------------------------------------------------------------------

## 16. Testing Strategy

### Unit Tests

-   permission evaluation;
-   state transitions;
-   cache key construction;
-   profile validation;
-   error mapping;
-   job retry logic.

### Integration Tests

-   database;
-   object storage;
-   queue;
-   provider adapter;
-   signed asset delivery;
-   auth flow.

### Contract Tests

-   API schemas;
-   SDK/API compatibility;
-   representation profile versions.

### End-to-End Tests

1.  create test player;
2.  create identity;
3.  submit synthetic/test capture;
4.  process identity;
5.  authorize demo A;
6.  request representation A;
7.  render/load in demo A;
8.  authorize demo B;
9.  request representation B;
10. render/load in demo B;
11. revoke demo A;
12. verify new access is denied.

### Security Tests

-   broken authorization;
-   cross-user access;
-   cross-application access;
-   expired/revoked tokens;
-   malicious uploads;
-   oversized payloads;
-   replay/idempotency behavior;
-   signed URL expiration.

------------------------------------------------------------------------

## 17. Development Environments

At minimum:

-   local;
-   test/CI;
-   development/sandbox;
-   production later.

MVP development should not require production player data.

Provide seeded synthetic identities for SDK development.

------------------------------------------------------------------------

## 18. CI Requirements

On each change:

-   format/lint;
-   type/static checks where applicable;
-   unit tests;
-   contract tests;
-   build;
-   dependency/security checks appropriate to stack;
-   SDK compile/test;
-   documentation validation where practical.

Do not merge generated binary identity assets into source control unless
intentionally small fixtures.

------------------------------------------------------------------------

## 19. Documentation Requirements

Before external pilot:

-   Quick Start
-   Authentication
-   Player Authorization
-   Representation Profiles
-   SDK Installation
-   Demo Integration
-   Error Handling
-   Versioning
-   Privacy/Data Flow
-   Troubleshooting
-   Changelog

Developer experience is part of the product.

------------------------------------------------------------------------

## 20. Implementation Order

### Milestone 1 --- Skeleton

-   repository;
-   docs;
-   local environment;
-   CI;
-   API skeleton;
-   database migrations;
-   basic web shell.

### Milestone 2 --- Identity Core

-   account;
-   identity entity;
-   capture metadata;
-   storage abstraction;
-   test capture flow.

### Milestone 3 --- Processing

-   job queue;
-   worker;
-   provider interface;
-   stub provider;
-   representation lifecycle.

Use a stub/deterministic provider before integrating expensive AI
generation. Prove orchestration first.

### Milestone 4 --- Authorization

-   developer application;
-   grants;
-   scopes;
-   revoke flow;
-   audit.

### Milestone 5 --- Demo A

-   first SDK;
-   one representation profile;
-   end-to-end rendering.

### Milestone 6 --- Demo B

-   second visual style/profile;
-   same canonical identity;
-   demonstrate portability.

### Milestone 7 --- Hardening

-   deletion;
-   rate limits;
-   security review;
-   observability;
-   retries;
-   failure UX;
-   documentation.

### Milestone 8 --- External Developer Sandbox

Only after internal MVP success.

------------------------------------------------------------------------

## 21. Codex Working Rules

Codex should treat these as project rules:

-   Never claim support that has not been built/tested.
-   Never add a feature merely because it seems useful.
-   Never turn the project into a modding/injection framework.
-   Never expose raw player identity data to a game unless explicitly
    required and approved.
-   Prefer interfaces over vendor lock-in.
-   Prefer a modular monolith over premature distributed complexity.
-   Keep expensive processing off the gameplay hot path.
-   Add tests with each behavior.
-   Add an Architecture Decision Record for meaningful technical
    choices.
-   Update documentation when behavior changes.
-   Surface uncertainty.
-   Stop at architectural/product conflicts and request a decision.
-   Keep the MVP narrow.

------------------------------------------------------------------------

## 22. Required ADRs Before Major Implementation

Create ADRs for:

-   ADR-001 Backend stack
-   ADR-002 Database
-   ADR-003 Object storage
-   ADR-004 Queue/job system
-   ADR-005 Authentication/authorization approach
-   ADR-006 Canonical identity representation
-   ADR-007 First engine SDK
-   ADR-008 Initial representation format
-   ADR-009 Processing provider strategy
-   ADR-010 Raw capture retention policy

Each ADR should include:

-   context;
-   options;
-   decision;
-   rationale;
-   consequences;
-   reversal conditions.

------------------------------------------------------------------------

## 23. MVP Acceptance Test

The definitive product demonstration:

> A test player creates one Project Synora identity. Demo Game A
> requests an authorized representation and displays a recognizable
> version of the player in Style A. Demo Game B independently requests a
> representation from the same identity and displays the same
> recognizable person in Style B. Each demo retains its own body,
> clothing, animation, lighting, and gameplay systems. Revoking one
> application's authorization blocks new access for that application
> without affecting the other.

If this cannot be demonstrated, the central MVP hypothesis has not yet
been proven.

------------------------------------------------------------------------

## 24. Future Parking Lot --- Explicitly Not MVP

Potential later exploration:

-   additional engines;
-   studio-specific private deployments;
-   advanced full-body identity;
-   accessibility preferences;
-   emotes;
-   animation/personality preferences;
-   voice, only after separate consent/safety design;
-   social identity;
-   creator tools;
-   streaming overlays;
-   cross-game cosmetic concepts;
-   companion-character experiences;
-   developer marketplace/ecosystem;
-   enterprise SLAs;
-   on-device processing;
-   standardized interchange formats.

None of these should enter MVP without an explicit product decision.

------------------------------------------------------------------------

## 25. Immediate Next Action for Codex

Codex should **not** start by generating the whole repository.

Its first task is to review PRD v0.1, Architecture v0.2, and Technical
Spec v0.3 and produce a **Design Review Response** containing:

1.  Restatement of the MVP.
2.  Conflicts or ambiguities found across the documents.
3.  The top unresolved decisions blocking implementation.
4.  Two or three viable canonical identity approaches.
5.  Recommendation for the first engine.
6.  Recommended backend stack with rationale.
7.  Recommended processing strategy for the first prototype.
8.  Threat/privacy concerns requiring decisions.
9.  Proposed ADR sequence.
10. A milestone plan for the first thin vertical slice.
11. Questions requiring human approval.

Only after those decisions are reviewed should Codex create
implementation code.

------------------------------------------------------------------------

# Handoff Note

This document deliberately separates three layers:

-   **PRD v0.1:** what the product is, why it exists, and its
    boundaries.
-   **Architecture v0.2:** how the system should be divided and what
    architectural choices must be made.
-   **Technical Spec v0.3:** concrete contracts, entities, workflows,
    tests, and implementation sequencing.

The permanent product name remains unresolved. **Project Synora** is a
codename.

The project should continue to evolve through explicit versioned
decisions rather than silent changes.

**North Star:**\
**Players keep their identity. Games keep their worlds. We connect the
two.**
