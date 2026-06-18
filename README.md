<p align="center">
  <strong>marketing-second-brain-demo</strong>
</p>

<p align="center">
  A retrieval-first marketing intelligence wiki for agents: capture raw market signal, preserve evidence, compile reusable marketing knowledge, and query it with QMD.
</p>

<p align="center">
  <a href="docs/index.html">GitHub Pages front door</a> &nbsp; | &nbsp;
  <a href="wiki/index.md">Wiki index</a> &nbsp; | &nbsp;
  <a href="examples/x-capture-to-wiki/README.md">X capture walkthrough</a> &nbsp; | &nbsp;
  <a href="examples/signal-sweep-to-wiki/README.md">Signal Sweep walkthrough</a>
</p>

---

## Why This Exists

Most marketing research workflows collapse into one of two bad shapes: a folder of saved links nobody can query, or a set of AI summaries with no durable source trail.

`marketing-second-brain-demo` shows a different operating model. Raw evidence stays immutable. Mixed-quality scans are staged before promotion. The wiki is the compiled layer agents can improve over time. QMD provides retrieval across both source material and synthesis.

The demo corpus is marketing-only: AI marketing workflows, SEO/AEO/GEO, paid creative ops, content systems, autonomous landing pages, lifecycle/CRM, UGC, analytics, and marketing enablement.

## Quick Start

Clone the repo:

```bash
git clone https://github.com/<your-org>/marketing-second-brain-demo.git
cd marketing-second-brain-demo
```

Inspect the wiki:

```bash
sed -n '1,180p' wiki/index.md
sed -n '1,140p' wiki/marketing/agentic-marketing-workflows.md
```

Run the local consistency check:

```bash
scripts/lint-second-brain.sh
```

Search with QMD when installed:

```bash
qmd search "performance marketing creative ops"
qmd query $'intent: Find source-backed marketing workflow examples.\nlex: Signal Sweep X capture QMD marketing workflow raw wiki staging'
qmd get './wiki/marketing/agentic-marketing-workflows.md'
```

Build embeddings locally if you want semantic retrieval:

```bash
scripts/qmd-refresh.sh --embed
```

The repo intentionally does not commit `.qmd/` state.

## LLM Wiki Pattern

The repo shape is inspired by the Karpathy LLM wiki pattern: preserve source material in `raw/`, let agents maintain a compiled `wiki/`, keep `wiki/index.md` as the routing layer, and append operational changes to `wiki/log.md`.

That distinction matters. `raw/` is evidence, `staging/` is uncertain signal, and `wiki/` is the LLM-maintained synthesis layer that can be revised as better sources arrive. The human asks questions and reviews judgment; agents handle retrieval, synthesis, provenance, and maintenance.

In this marketing demo, the pattern becomes a source-backed funnel intelligence system:

```text
market signal -> raw evidence -> staged digest -> compiled marketing wiki -> QMD retrieval
```

## Philosophy

**Raw stays raw.** `raw/` is immutable evidence. If a source changes, capture a new snapshot.

**Staging is honest about uncertainty.** Signal Sweep scans and incomplete captures are useful signal, but they are not treated as canonical truth until promoted.

**The wiki compounds.** `wiki/` is where agents synthesize, merge, cross-link, and update durable marketing knowledge.

**Retrieval comes first.** The point is not a pretty notebook. The point is that future agents can answer from source-backed memory instead of rediscovering the web.

**Marketing workflows beat marketing prompts.** The demo emphasizes repeatable loops: capture signal, validate evidence, generate campaign assets, review outputs, measure results, and feed learning back into the next run.

## What It Supports

- **Exact X capture lane** - paste a post URL, preserve the raw source, then compile the reusable marketing idea into the wiki.
- **Signal Sweep research lane** - run recent-signal scans, save raw output, stage a digest, and selectively promote useful patterns.
- **QMD retrieval** - search wiki, raw, and staging with lexical and semantic queries.
- **Source-map provenance** - track which raw and staging files support which wiki pages.
- **Append-only operations log** - show when knowledge was added, staged, or promoted.
- **Public GitHub Pages front door** - explain the system without requiring local setup.
- **Local linting** - catch broken links, source-map drift, and accidental private material.

## How Signal Sweep Search Works

Signal Sweep is the recent-signal research lane. A topic query fans out across configured public sources, normalizes the results into ranked evidence clusters, and stores every useful item with a source label, URL, date, engagement counters, score, short rationale, and excerpt.

The included demo scans show the sources actually present in this repo: X posts and YouTube results/transcripts. Engagement is treated as attention evidence: likes, reposts, replies, comments, and views help rank what real people are reacting to. The point is not to replace Google; it is to catch live social and video signal that editorial search often misses.

The trust model is deliberately conservative. A Signal Sweep file is raw recent signal, not final truth. The digest extracts candidate themes into `staging/`, and wiki promotion happens only when a pattern is durable enough or backed by exact captures and stronger source evidence.

## Sources In This Demo

This table reflects the checked-in corpus, not a claim about every platform the broader pattern could support.

| Source lane | What it contributes | Where to inspect it |
|---|---|---|
| X / Twitter exact captures | Specific posts and threads with original URLs, preserved as source evidence for wiki claims. | `raw/intentional/x/`, plus X-sourced pasted captures in `raw/intentional/pasted/` |
| Signal Sweep: X | Recent social posts ranked into evidence clusters with engagement counters, scores, rationales, and excerpts. | `raw/sweeps/signal-sweeps/` and `staging/signal-sweeps/` |
| YouTube | Video results, transcripts, views, comments, and tutorial-style evidence for marketing workflows. | `raw/intentional/youtube/` and Signal Sweep outputs in `raw/sweeps/signal-sweeps/` |
| Web articles and docs | Official articles, README/docs pages, tool pages, and repository snapshots for stronger source-backed claims. | `raw/intentional/web/` |
| Local and pasted captures | Included project snapshots, pasted articles, and imported source material that are useful for demos but still kept as raw evidence. | `raw/intentional/pasted/` |
| Incomplete web leads | URL/context records where the full source text is not captured yet. These stay out of confident wiki claims. | `staging/incomplete-captures/web/` |

Additional sources can be added on demand through platform APIs or source-specific capture adapters while keeping the same raw, staging, wiki, and QMD retrieval pattern.

## Usage Examples

Ask a source-recall question:

```text
Find the X post about Ploy turning websites into growth systems.
```

Expected retrieval path:

```text
raw/intentional/x/2026-06-18-bryant-chou-ploy-launch-x-post.md
wiki/marketing/autonomous-websites-and-landing-pages.md
```

Ask a synthesis question:

```text
What do I know about AI performance marketing workflows?
```

Expected retrieval path:

```text
wiki/marketing/performance-marketing-creative-ops.md
raw/intentional/web/2026-06-11-anthropic-growth-marketing-article.md
raw/intentional/web/2026-06-18-ivangfalco-ads-skills-repository-snapshot.md
raw/sweeps/signal-sweeps/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

Run a staged-signal workflow:

```bash
scripts/run-signal-sweep.sh "AI marketing workflow transformation"
scripts/stage-signal-sweep-digest.sh raw/sweeps/signal-sweeps/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

The public demo includes the resulting raw scan and digest so readers can inspect the shape without live credentials.

## Architecture

```text
raw/         immutable source evidence
staging/     incomplete captures and Signal Sweep digests
wiki/        compiled marketing knowledge
state/       source-map provenance
scripts/     capture, refresh, staging, and lint helpers
docs/        public docs plus GitHub Pages front door
examples/    walkthroughs of flagship workflows
```

Core flow:

```text
Capture signal -> preserve evidence -> compile wiki -> query with QMD -> maintain provenance
```

## Key Files

- `wiki/index.md` - agent-facing router for the compiled marketing wiki.
- `wiki/log.md` - append-only operational history.
- `wiki/marketing/agentic-marketing-workflows.md` - hub article for the demo corpus.
- `raw/intentional/x/2026-06-18-bryant-chou-ploy-launch-x-post.md` - canonical exact-X walkthrough source.
- `raw/sweeps/signal-sweeps/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md` - canonical Signal Sweep walkthrough source.
- `staging/signal-sweeps/2026-06-17-performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-digest.md` - staged digest from that scan.
- `state/source-map.json` - provenance map from evidence to compiled pages.
- `scripts/lint-second-brain.sh` - local verification.

## FAQ

**Is this a template or a finished corpus?**

Both. It is a working demo corpus plus a repo shape you can fork for another marketing team.

**Why not just save links?**

Links do not preserve source text, trust state, compiled synthesis, or retrieval paths. This repo treats source capture and synthesis as separate layers.

**Why stage Signal Sweep output?**

Because marketers need emerging market signal, but recent-source evidence should be staged and reviewed before becoming durable knowledge.

**Why include QMD?**

Agents need a fast first-line retrieval layer across Markdown. QMD lets an agent search exact terms, semantic concepts, and source-backed pages without guessing from memory.

**Can the exact X capture script run out of the box?**

The public wrapper documents the flow and expected dependencies. Authenticated capture requires local browser cookies and tooling that are not committed to this demo.

**What should a reader notice?**

That the system is not a pile of AI summaries. It preserves evidence, separates trust lanes, compiles reusable marketing knowledge, and gives agents a repeatable way to answer from the corpus.
