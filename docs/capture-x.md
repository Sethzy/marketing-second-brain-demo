# Exact X Capture

Exact X capture is the high-trust social-source lane.

```text
X URL -> capture script -> raw/intentional/x -> wiki update -> QMD refresh
```

Complete captures belong in `raw/intentional/x/`. Partial, preview-only, auth-failed, or title-only captures belong in `staging/incomplete-captures/x/`.

The canonical demo source is:

```text
raw/intentional/x/2026-06-18-bryant-chou-ploy-launch-x-post.md
```

It supports:

```text
wiki/marketing/autonomous-websites-and-landing-pages.md
wiki/marketing/agentic-marketing-workflows.md
```

Run the wrapper:

```bash
scripts/x-capture-to-raw.sh "https://x.com/example/status/123"
```

The public wrapper explains the authenticated dependency requirements. It does not ship browser cookies or private auth state.

