# QMD Retrieval

QMD is the first-line retrieval layer for this Markdown corpus.

Use lexical search when you know exact words:

```bash
qmd search "Ploy ABM pages programmatic SEO"
qmd search "performance marketing creative ops"
```

Use structured semantic search when the question is conceptual:

```bash
qmd query $'intent: Find source-backed marketing workflows that turn noisy social or web signal into funnel assets.\nlex: Last30Days X capture raw staging wiki marketing workflow funnel\nvec: source-backed marketing intelligence system with raw evidence and compiled wiki pages\nhyde: A marketing second brain captures X posts and recent-market sweeps, stages lower-trust signal, compiles durable workflow pages, and answers with raw citations.'
```

Fetch full sources before answering:

```bash
qmd get './wiki/marketing/agentic-marketing-workflows.md'
qmd get './raw/intentional/x/2026-06-18-bryant-chou-ploy-launch-x-post.md'
```

Refresh the local index:

```bash
scripts/qmd-refresh.sh
scripts/qmd-refresh.sh --embed
```

Do not commit `.qmd/`.

