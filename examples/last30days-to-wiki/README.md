# Walkthrough: Last30Days To Wiki

This walkthrough shows the recent-signal lane.

## Input

A marketing research topic:

```text
performance marketing AI ad generation Google Ads Meta Ads creative variants
```

## Sweep

The public demo includes the raw sweep:

```text
raw/sweeps/last30days/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

In a live private setup:

```bash
scripts/last30days-to-sweeps.sh "performance marketing AI ad generation Google Ads Meta Ads creative variants"
```

## Stage

The staged digest is:

```text
staging/last30days/2026-06-17-performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-digest.md
```

Staging keeps the sweep useful without pretending it is canonical.

## Promote

Only durable, source-backed patterns should be promoted to:

```text
wiki/marketing/agentic-marketing-workflows.md
```

Promotion should update:

```text
wiki/index.md
wiki/log.md
state/source-map.json
```

## Retrieve

```bash
qmd search "performance marketing creative variants"
qmd get './staging/last30days/2026-06-17-performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-digest.md'
qmd get './wiki/marketing/agentic-marketing-workflows.md'
```
