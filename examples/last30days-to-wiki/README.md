# Walkthrough: Last30Days To Wiki

This walkthrough shows the recent-signal lane.

## Input

A marketing research topic:

```text
AI marketing workflow transformation Stripe Anthropic Claude Code marketers agents skills
```

## Sweep

The public demo includes the raw sweep:

```text
raw/sweeps/last30days/ai-marketing-workflow-transformation-stripe-anthropic-claude-code-marketers-agents-skills-raw.md
```

In a live private setup:

```bash
scripts/last30days-to-sweeps.sh "AI marketing workflow transformation Stripe Anthropic Claude Code marketers agents skills"
```

## Stage

The staged digest is:

```text
staging/last30days/2026-06-17-ai-marketing-workflow-transformation-stripe-anthropic-claude-code-marketers-agents-skills-digest.md
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
qmd search "AI marketing workflow transformation"
qmd get './staging/last30days/2026-06-17-ai-marketing-workflow-transformation-stripe-anthropic-claude-code-marketers-agents-skills-digest.md'
qmd get './wiki/marketing/agentic-marketing-workflows.md'
```

