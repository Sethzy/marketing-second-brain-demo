# Walkthrough: Signal Sweep To Wiki

This walkthrough shows the recent-signal lane: run a topic scan, preserve the raw ranked evidence, stage a digest, then promote only durable patterns into the wiki.

## Input

A marketing research topic:

```text
performance marketing AI ad generation Google Ads Meta Ads creative variants
```

## Scan

The public demo includes the raw Signal Sweep output:

```text
raw/sweeps/signal-sweeps/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

In a live private setup, the private runner writes the scan:

```bash
scripts/run-signal-sweep.sh "performance marketing AI ad generation Google Ads Meta Ads creative variants"
```

## Stage

The staged digest is:

```text
staging/signal-sweeps/2026-06-17-performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-digest.md
```

Staging keeps the scan useful without pretending it is canonical.

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
qmd get './staging/signal-sweeps/2026-06-17-performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-digest.md'
qmd get './wiki/marketing/agentic-marketing-workflows.md'
```
