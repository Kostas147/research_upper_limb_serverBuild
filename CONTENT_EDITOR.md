# Runtime content editor

This Linux dedicated build includes the Research runtime editor controller.
It downloads only JSON; images/GLB are loaded and rendered by WebGL clients.
Server and client were rebuilt together. Keep Render **Free**, PORT binding
`0.0.0.0:$PORT`, and existing WebSocket/TLS-termination configuration.

Required server-only Render Environment variables:

- `AETMA_CONTENT_API_URL`: the existing content Worker plus
  `/worlds/research_upper_limb`.
- `AETMA_CONTENT_SERVICE_TOKEN`: Research-specific Worker/server token.
- `METACIVIC_TEACHER_PIN`: private teacher PIN (same as IMT in this pilot).

Do not commit values. Missing configuration disables editing, not the base world.
Worker storage uses a separate `research_upper_limb/` namespace inside the
existing private content bucket; IMT layouts/assets are not shared.

The public launch version is `20260926-research-editor2`. Teachers can add PNG/JPEG,
self-contained GLB, and the built-in Energy Bubble sphere portal. Drafts are
private until Save. Runtime content changes need no further Unity rebuild.
