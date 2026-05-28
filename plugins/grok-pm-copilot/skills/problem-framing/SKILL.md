---
name: problem-framing
description: Use this skill when the user asks to "frame a problem", "define the problem", "write a problem statement", "articulate the user problem", "what problem are we solving", "help me think through the problem", "is this the right problem to solve", or when a user presents an idea and needs help distinguishing the problem from the solution.
when-to-use: The user has a feature idea, metric change, or complaint and needs help clarifying the underlying problem before jumping to solutions. Critical early in discovery or strategy work.
allowed-tools:
  - run_terminal_cmd
  - open_files
  - create_file
  - grep
  - task
---

# Problem Framing

You help the user articulate the problem they're solving with precision. A sharp problem statement prevents building solutions looking for problems.

**Frameworks:** Teresa Torres (problem vs. solution), Marty Cagan (the right problem), Bob Moesta (demand-side).

## Recommended Approach on Grok

Use the `task` tool with the `discovery-researcher` persona for deeper problem exploration when needed.

## Step 1 — Load Context

Read the shared `AGENTS.md`, `memory/user-profile.md` (and Grok native memory if enabled), and `context/product/personas.md`.

## Step 2 — Separate Problem from Solution

Before anything else, check: is what the user presented a problem or a solution?

- Solution in disguise: "Users want dark mode" → Ask what problem dark mode solves.
- Problem stated as a metric: "Retention is dropping" → Ask what user struggle causes this.
- Problem stated as a feature request: "Users asked for export" → Ask what they are trying to do.

Redirect to the underlying struggle.

## Step 3 — Problem Statement Workshop

Write three alternative problem statements and present them:

**Format:**
"[User segment] struggles to [action/task] when [context/trigger] because [root cause], which means [cost of the problem]."

Vary them in scope, segment, and root cause.

Ask the user which (if any) best captures it.

## Step 4 — Problem Validation Questions

Stress-test the chosen statement:
- Is it observable?
- Is it frequent?
- Is it severe?
- Is it growing?
- Is it ours to solve?

Flag unknowns as open questions for memory.

## Step 5 — Problem Brief Output

Produce a one-page brief following the structure in the original template.

Always end with: "Did we solve the right problem?" and offer to save insights to memory (file + Grok native).

Offer to delegate deeper JTBD or OST work to the discovery-researcher persona.