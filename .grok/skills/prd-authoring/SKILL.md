---
name: prd-authoring
description: Use when the user wants to "author a PRD", "write requirements", "turn this brief into a PRD", or needs help structuring a full product requirements document beyond the high-level workflow.
when-to-use: Detailed PRD writing or refinement work, especially when the user wants to follow the exact template and quality bar.
allowed-tools:
  - run_terminal_cmd
  - open_files
  - create_file
  - grep
  - task
---

# PRD Authoring

Apply the shared prd-template.md with full rigor.

## Grok Best Practices

- Always load the shared Quality Bar from AGENTS.md.
- Use the document-writer persona via the task tool for large PRDs.
- Enforce explicit out-of-scope, 30-day metrics, and "Did we solve the right problem?".
- Cross-reference existing memory, roadmap, and personas.
- Offer to save decisions and open questions to both file memory and Grok native memory.

Never produce vague or incomplete requirements.