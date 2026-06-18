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
  <a href="examples/last30days-to-wiki/README.md">Last30Days walkthrough</a>
</p>

---

## Why This Exists

Most marketing research workflows collapse into one of two bad shapes: a folder of saved links nobody can query, or a set of AI summaries with no durable source trail.

`marketing-second-brain-demo` shows a different operating model. Raw evidence stays immutable. Noisy sweeps are staged before promotion. The wiki is the compiled layer agents can improve over time. QMD provides retrieval across both source material and synthesis.

The demo corpus is marketing-only: AI marketing workflows, SEO/AEO/GEO, paid creative ops, content systems, autonomous landing pages, lifecycle/CRM, UGC, analytics, and Stripe-style Forward Deployed AI enablement.

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
qmd query $'intent: Find source-backed marketing workflow examples.\nlex: Last30Days X capture QMD marketing workflow raw wiki staging'
qmd get './wiki/marketing/agentic-marketing-workflows.md'
```

Build embeddings locally if you want semantic retrieval:

```bash
scripts/qmd-refresh.sh --embed
```

The repo intentionally does not commit `.qmd/` state.

## Philosophy

**Raw stays raw.** `raw/` is immutable evidence. If a source changes, capture a new snapshot.

**Staging is honest about uncertainty.** Last30Days sweeps and incomplete captures are useful signal, but they are not treated as canonical truth until promoted.

**The wiki compounds.** `wiki/` is where agents synthesize, merge, cross-link, and update durable marketing knowledge.

**Retrieval comes first.** The point is not a pretty notebook. The point is that future agents can answer from source-backed memory instead of rediscovering the web.

**Marketing workflows beat marketing prompts.** The demo emphasizes repeatable loops: capture signal, validate evidence, generate campaign assets, review outputs, measure results, and feed learning back into the next run.

## What It Supports

- **Exact X capture lane** - paste a post URL, preserve the raw source, then compile the reusable marketing idea into the wiki.
- **Last30Days research lane** - run recent-signal sweeps, save raw output, stage a digest, and selectively promote useful patterns.
- **QMD retrieval** - search wiki, raw, and staging with lexical and semantic queries.
- **Source-map provenance** - track which raw and staging files support which wiki pages.
- **Append-only operations log** - show when knowledge was added, staged, or promoted.
- **Public GitHub Pages front door** - explain the system without requiring local setup.
- **Local linting** - catch broken links, source-map drift, and accidental private material.

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
raw/sweeps/last30days/performance-marketing-ai-ad-generation-google-ads-meta-ads-creative-variants-raw.md
```

Run a staged-signal workflow:

```bash
scripts/last30days-to-sweeps.sh "AI marketing workflow transformation"
scripts/stage-last30days-digest.sh raw/sweeps/last30days/ai-marketing-workflow-transformation-stripe-anthropic-claude-code-marketers-agents-skills-raw.md
```

The public demo includes the resulting raw sweep and digest so reviewers can inspect the shape without live credentials.

## Architecture

```text
raw/         immutable source evidence
staging/     incomplete captures and sweep digests
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
- `raw/sweeps/last30days/ai-marketing-workflow-transformation-stripe-anthropic-claude-code-marketers-agents-skills-raw.md` - canonical Last30Days walkthrough source.
- `staging/last30days/2026-06-17-ai-marketing-workflow-transformation-stripe-anthropic-claude-code-marketers-agents-skills-digest.md` - staged digest from that sweep.
- `state/source-map.json` - provenance map from evidence to compiled pages.
- `scripts/lint-second-brain.sh` - local verification.

## FAQ

**Is this a template or a finished corpus?**

Both. It is a working demo corpus plus a repo shape you can fork for another marketing team.

**Why not just save links?**

Links do not preserve source text, trust state, compiled synthesis, or retrieval paths. This repo treats source capture and synthesis as separate layers.

**Why include Last30Days if it is noisy?**

Because marketers need recent signal, but recent signal should be staged and reviewed before becoming durable knowledge.

**Why include QMD?**

Agents need a fast first-line retrieval layer across Markdown. QMD lets an agent search exact terms, semantic concepts, and source-backed pages without guessing from memory.

**Can the exact X capture script run out of the box?**

The public wrapper documents the flow and expected dependencies. Authenticated capture requires local browser cookies and tooling that are not committed to this demo.

**What should a reviewer notice?**

That the system is not a pile of AI summaries. It preserves evidence, separates trust lanes, compiles reusable marketing knowledge, and gives agents a repeatable way to answer from the corpus.

