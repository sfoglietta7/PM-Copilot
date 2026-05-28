# Context Directory

This directory holds your product and company context. PM Copilot (in both Rovo Dev and Claude versions) reads these files to ground every response in your specific situation.

## Recommended Structure

```
.rovodev/context/
├── product/
│   ├── personas.md          # Your actual user personas (create from template)
│   └── roadmap.md           # Your actual roadmap (create from template)
├── company/
│   ├── mission.md           # Company direction, stage, and values
│   ├── past-prds.md         # Past PRDs for tone reference
│   ├── customer-feedback.md # Recurring themes
│   ├── analytics-baseline.md# Metric definitions
│   └── competitors.md       # Competitive landscape
└── templates/               # Do not edit these — use as starting points
```

## Quick Setup

1. Copy the templates under `product/` and fill them with your real data.
2. Create the company files as you have information.
3. The more you fill in, the better PM Copilot performs.

Rovo Dev will also pull rich context natively from Jira and Confluence via the Teamwork Graph. Use the files here for product-specific narrative and non-Atlassian knowledge.