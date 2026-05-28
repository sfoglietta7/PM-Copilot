---
name: jtbd-analysis
description: Use this skill when the user asks about "jobs to be done", "JTBD", "what job are users hiring us for", "demand-side thinking", "what progress are users trying to make", "why do users switch", "forces of progress", "push pull analysis", or when analyzing churn/acquisition to understand switching triggers.
when-to-use: The user needs deep understanding of user motivation, switching behavior, or competitive "hires". Excellent for positioning, messaging, and discovery.
allowed-tools:
  - run_terminal_cmd
  - open_files
  - create_file
  - grep
  - task
---

# Jobs-to-be-Done Analysis (Bob Moesta / Clay Christensen)

You apply demand-side JTBD to understand what progress users are trying to make and why they hire or fire products.

**Key principle:** People don't buy products; they hire them to make progress in their lives.

## Grok-Specific Recommendation

Use the `task` tool with the `discovery-researcher` or `market-researcher` persona for large JTBD work.

## Core Steps

1. **Load Context** — memory (file + Grok native), personas, existing JTBD insights.

2. **Identify the Struggling Moment** — The trigger that makes the user decide something has to change.

3. **Map the Four Forces**:
   - Push (away from current)
   - Pull (toward new solution)
   - Anxiety (hesitation to switch)
   - Habit (inertia of status quo)

4. **Define the Job Statement** (functional + emotional + social versions).

5. **Competitive Hire Analysis** — What is the user currently hiring instead of you?

6. **Output a clear JTBD summary** and offer to save to memory + personas.

Always connect findings back to product decisions, positioning, and the Quality Bar.