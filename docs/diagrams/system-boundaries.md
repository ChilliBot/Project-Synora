# System Boundaries

```mermaid
flowchart LR
    Player[Player] -->|OIDC sign-in| IdP[Managed identity provider]
    Player -->|Portal and consent| Web[Synora portal]
    Developer[Developer] --> Web
    Game[Demo application backend] -->|Scoped application auth| API[Synora API]
    Web --> API
    API --> DB[(PostgreSQL)]
    API --> Store[(Private object storage)]
    Worker[Representation worker] --> DB
    Worker --> Store
    Worker --> Provider[Deterministic provider]
    API -->|Short-lived opaque download| Game
```

Trust boundaries:

- Browsers and demo clients are untrusted.
- The managed identity provider authenticates humans but does not own Synora grants.
- The API is the only public authority for grants and representation access.
- Storage and database identifiers remain internal.
- The deterministic provider accepts synthetic fixtures only.
