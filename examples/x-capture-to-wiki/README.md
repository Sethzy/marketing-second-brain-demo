# Walkthrough: X Capture To Wiki

This walkthrough shows the exact social-source lane.

## Input

A marketer or researcher saves an X post:

```text
https://x.com/bryantchou/status/...
```

## Capture

The public demo includes the completed raw capture:

```text
raw/intentional/x/2026-06-18-bryant-chou-ploy-launch-x-post.md
```

In an authenticated local setup, the wrapper is:

```bash
scripts/x-capture-to-raw.sh "https://x.com/bryantchou/status/..."
```

Authenticated X capture requires browser/cookie tooling that is not committed to this public demo.

If a team already uses TweetClaw through OpenClaw, reviewed JSON output can also enter the same raw-evidence lane:

```bash
scripts/tweetclaw-json-to-raw.sh "Ploy launch X examples" ./tmp/tweetclaw-ploy.json "https://x.com/search?q=ploy%20launch"
```

This preserves TweetClaw search or lookup results as immutable source captures before any wiki synthesis. Do not promote imported tweets directly into `wiki/` until a marketer reviews the source quality and decides which claims are durable.

## Compile

The captured post supports two compiled pages:

```text
wiki/marketing/autonomous-websites-and-landing-pages.md
wiki/marketing/agentic-marketing-workflows.md
```

The compiled idea:

```text
The website can become a marketing operating surface: site, brand, CMS, CRM, campaigns, analytics, SEO/AEO, customer data, and human approval loops working together.
```

## Retrieve

```bash
qmd search "Ploy website growth system"
qmd get './raw/intentional/x/2026-06-18-bryant-chou-ploy-launch-x-post.md'
qmd get './wiki/marketing/autonomous-websites-and-landing-pages.md'
```

## Trust Note

Complete X captures can support wiki claims. Partial X captures should stay in `staging/incomplete-captures/x/` until the source text is complete.
