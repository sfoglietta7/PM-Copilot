---
name: competitive-positioning
description: Use this skill for "competitive analysis", "competitive landscape", "how do we differentiate", "competitive positioning", "what's our competitive advantage", or when preparing board/investor updates that include competition.
when-to-use: The user needs to understand the true competitive set and define a sustainable, differentiated position.
allowed-tools:
  - run_terminal_cmd
  - open_files
  - create_file
  - grep
  - task
---

# Competitive Positioning

Help the user understand the competitive landscape and define a defensible position using Hamilton Helmer (7 Powers) and April Dunford (Obviously Awesome 5-component positioning).

## Grok Approach

Use the `task` tool + `market-researcher` or `strategy-analyst` persona for heavy competitive work.

## Key Steps

1. Load context (memory + company/competitors.md).
2. Map real competitive set (direct, indirect, status quo — from the user's perspective).
3. Build comparison matrix.
4. Apply 7 Powers assessment (rate each moat).
5. Apply Dunford 5-component positioning and craft a clear positioning statement.
6. Deliver actionable recommendations + offer to update context/company/competitors.md and memory.

Always distinguish the user's actual competitive set from the "obvious" investor list.