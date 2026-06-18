# Last30Days Research Lane

Last30Days is the recent-signal lane. It is useful for finding what people are talking about now, but it is lower-trust than an intentional full-source capture.

```text
topic -> raw/sweeps/last30days -> staging/last30days digest -> optional wiki promotion
```

The canonical demo sweep is:

```text
raw/sweeps/last30days/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

Its staged digest is:

```text
staging/last30days/2026-06-17-performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-digest.md
```

Use the sweep wrapper when Last30Days is installed:

```bash
scripts/last30days-to-sweeps.sh "performance marketing AI ad generation Google Ads Meta Ads creative variants"
```

Stage a digest:

```bash
scripts/stage-last30days-digest.sh raw/sweeps/last30days/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

Promotion into `wiki/` should happen only after a maintainer decides the signal is durable enough or backs it with exact captures.
