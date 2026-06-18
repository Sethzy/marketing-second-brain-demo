# Signal Sweep Research Lane

Signal Sweep is the handrolled recent-signal lane. It is useful for finding what people are reacting to now, but it is lower-trust than an intentional full-source capture.

The live runner fans out a topic query across configured public sources, then writes ranked evidence clusters with source labels, URLs, dates, engagement counters, scores, short rationales, and excerpts. The demo corpus only claims what the checked-in scans actually show: X posts plus YouTube results/transcripts.

Engagement is treated as attention evidence. Likes, reposts, replies, comments, and views help rank what appears to matter socially, while the wiki layer keeps the judgment conservative by requiring staging and source-backed promotion.

```text
topic -> raw/sweeps/signal-sweeps -> staging/signal-sweeps digest -> optional wiki promotion
```

The canonical demo scan is:

```text
raw/sweeps/signal-sweeps/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

Its staged digest is:

```text
staging/signal-sweeps/2026-06-17-performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-digest.md
```

Use the scan wrapper when the private Signal Sweep runner is installed:

```bash
scripts/run-signal-sweep.sh "performance marketing AI ad generation Google Ads Meta Ads creative variants"
```

Stage a digest:

```bash
scripts/stage-signal-sweep-digest.sh raw/sweeps/signal-sweeps/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

Promotion into `wiki/` should happen only after a maintainer decides the signal is durable enough or backs it with exact captures.
