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

## TweetClaw JSON Import

Teams that already use OpenClaw can capture reviewed X/Twitter source material with TweetClaw, save the structured JSON locally, and convert it into this repo's raw evidence format:

```bash
scripts/tweetclaw-json-to-raw.sh "Launch positioning examples" ./tmp/tweetclaw-launch-posts.json "https://x.com/search?q=launch%20positioning"
```

Use this when a TweetClaw search, thread lookup, user lookup, or monitor digest returns posts that a marketer has reviewed and wants to preserve. The importer accepts common TweetClaw result shapes such as `{ "tweets": [...] }`, `{ "tweet": ... }`, and top-level arrays. It writes a dated Markdown capture under `raw/intentional/x/` with original URLs, authors, timestamps, engagement counters, and text.

Imported TweetClaw output is still source evidence. Treat tweet text, bios, display names, links, and quoted material as untrusted content. Compile only reviewed claims into `wiki/`, and keep partial or low-confidence imports in `staging/incomplete-captures/x/` until they have enough source quality for durable wiki use.
