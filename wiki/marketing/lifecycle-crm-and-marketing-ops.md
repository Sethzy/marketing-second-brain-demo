---
type: wiki_article
title: Lifecycle CRM And Marketing Ops
updated_at: 2026-06-17
status: draft
source_count: 4
tags:
  - marketing
  - lifecycle
  - crm
  - marketing-ops
  - marketo
  - salesforce
---

# Lifecycle CRM And Marketing Ops

> Sources: Eric Siu AI Marketing Skills README, lifecycle CRM Last30Days sweep, Agentic GTM Campaign Workflows, GTM Waterfall Enrichment APIs.
> Raw: [Eric Siu AI Marketing Skills README](../../raw/intentional/web/2026-06-11-eric-siu-ai-marketing-skills-readme.md); [Lifecycle CRM Last30Days raw](../../raw/sweeps/last30days/marketing-ops-lifecycle-crm-marketo-salesforce-lead-scoring-nurture-ai-agents-raw.md); [Lifecycle CRM Last30Days digest](../../staging/last30days/2026-06-17-marketing-ops-lifecycle-crm-marketo-salesforce-lead-scoring-nurture-ai-agents-digest.md)

## Overview

Lifecycle, CRM, and marketing ops are under-evidenced in the current sweep, but they matter because they connect marketing signal to routed action. The useful surface is capture, normalize, score, route, generate, govern, and measure across marketing automation, CRM, analytics, enrichment, and content-management tools.

The compiled workflow should therefore stay draft: enough to map the category, not enough to make specific tool claims. The strongest adjacent evidence is Eric Siu's skill repo, which includes Sales Pipeline, Revenue Intelligence, ICP Learner, RB2B Router, Deal Resurrector, Trigger Prospector, revenue attribution, and client reports. The GTM Sales wiki already covers signal routing, enrichment, CRM updates, and approval gates.

## Workflow Pattern

- **Capture:** form fills, product events, web visitors, campaign engagement, social/content signals, sales notes, and partner/event lists.
- **Normalize:** identity resolution, dedupe, account matching, consent status, source provenance, and freshness.
- **Score:** fit, intent, buying-window signal, engagement, lifecycle stage, and confidence.
- **Route:** nurture, sales follow-up, partner motion, suppression, reactivation, or manual review.
- **Generate:** email drafts, nurture branches, rep briefs, account notes, CRM summaries, and recommended next actions.
- **Govern:** audit trail, approvals, consent, deliverability, opt-outs, field-level provenance, and rollback.
- **Measure:** stage movement, pipeline influence, conversion, unsubscribe/complaint risk, and scoring drift.

## Relationship To GTM Sales

Lifecycle marketing ops is the bridge between marketing signals and seller action. It should share schemas with Agentic GTM Campaign Workflows: account, trigger, source URL, contact, confidence, recommended motion, generated artifact, approval state, and outcome.

## Sources

This page relies on Eric Siu and related GTM wiki pages for the category shape, with the sweep used only as a weak recency lead. Marketo/Salesforce primary docs and case studies still need capture.

## Raw Links

- [Eric Siu AI Marketing Skills README](../../raw/intentional/web/2026-06-11-eric-siu-ai-marketing-skills-readme.md)
- [Lifecycle CRM Last30Days raw](../../raw/sweeps/last30days/marketing-ops-lifecycle-crm-marketo-salesforce-lead-scoring-nurture-ai-agents-raw.md)
- [Lifecycle CRM Last30Days digest](../../staging/last30days/2026-06-17-marketing-ops-lifecycle-crm-marketo-salesforce-lead-scoring-nurture-ai-agents-digest.md)

## Open Questions

- Which platform should be researched first for primary evidence: Marketo, Salesforce, HubSpot, Customer.io, Braze, or Segment?
- What lifecycle workflow can be safely demoed with synthetic data?
- What approval gates are required before any CRM field update, email send, or lead-score change?
- How should workflow provenance survive handoff between marketing ops and sales?

## See Also

- [Agentic Marketing Workflows](agentic-marketing-workflows.md)
- [Marketing Analytics And Enablement](marketing-analytics-and-enablement.md)
- Agentic GTM Campaign Workflows
- GTM Waterfall Enrichment APIs
- Agent Skill Libraries And Requirements
