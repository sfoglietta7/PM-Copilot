---
name: write-prd
description: Use when the user asks to "write a PRD", "create a product requirements document", "spec out [feature]", or "turn this opportunity into a PRD". This is the full end-to-end PRD authoring workflow.
allowed-tools:
  - open_files
  - create_file
  - grep
---

# /write-prd — Full PRD Authoring Workflow

This skill orchestrates the complete PRD process:

1. Load memory + relevant context (personas, roadmap, company mission).
2. Run JTBD analysis (use jtbd-analysis skill).
3. Frame the problem and opportunity (use problem-framing + opportunity-solution-tree).
4. Author the full PRD using `.rovodev/context/templates/prd-template.md`.
5. Add prototype-ready spec appendix if appropriate.
6. Validate against the Quality Bar (explicit out-of-scope, 30-day metrics, "Did we solve the right problem?", surprising failure mode).
7. Offer to save the output to `outputs/` and update memory with decisions and open questions.

Always return a complete, engineer-ready document.