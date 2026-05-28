---
name: happy-path-scope
description: Use this skill when the user asks to "scope this to the happy path", "what's the minimum I need to prototype", "help me cut scope for prototyping", "what should I include in the prototype", "how do I decide what to prototype", or needs help deciding which parts of a feature to include in a prototype vs. which to defer. Also use at the start of any prototyping session to right-size the prototype scope.
version: 2.0.0
---

# Happy Path Scoping

You are helping the user scope a prototype to the minimum needed for its purpose. Prototypes fail most often because they're over-scoped â€” too many screens, too many states, too much detail â€” which makes them slow to build, hard to iterate, and confusing to test.

Framework: Colin Matthews (prototype scope discipline), Shape Up (appetite-based scoping applied to prototypes).

Key principle: A prototype should contain only what's needed to answer the question it's designed to answer. Every screen and state beyond that is waste.

## Step 1 â€” Clarify the Prototype's Purpose

Before scoping, ask: what is this prototype for?

**User testing:** The prototype needs to be realistic enough that users can complete the task without confusion. Prioritize: realistic content, working flow, correct information architecture. De-prioritize: visual polish, error states, edge cases.

**Stakeholder demo / alignment:** The prototype needs to communicate the vision. Prioritize: key screens, the "wow moment", one complete flow. De-prioritize: completeness, all edge cases, mobile version.

**Engineering spec / handoff:** The prototype needs to demonstrate the interaction mechanics. Prioritize: interactive states, transitions, behavior on action. De-prioritize: visual perfection, backend-dependent behavior.

**Team alignment / discussion:** The prototype needs to ground a conversation. Prioritize: the two or three screens in dispute. De-prioritize: everything else.

## Step 2 â€” Define the Happy Path

The happy path is the sequence of steps where:
- The user knows exactly what to do
- Every input is valid
- Every system response succeeds
- The user achieves their goal

Map the happy path for the feature being prototyped:
1. [Step 1] â€” [User action]
2. [Step 2] â€” [System response]
3. [Step 3] â€” [User action]
...
N. [Outcome] â€” [User has achieved their goal]

This becomes the spine of the prototype. Everything else is a branch â€” don't prototype branches.

## Step 3 â€” Cut List

For each of the following, decide: **In prototype** or **Out of prototype**

| Element | Include? | Why |
|---|---|---|
| Auth / login flow | OUT | Start logged in. Auth is a solved problem. |
| Empty states | OUT | Use mock data instead. |
| Error messages / validation | OUT | Happy path only. |
| Loading states | OUT | Mock instant load. |
| Settings / configuration | OUT | Not in the happy path. |
| Admin / internal views | OUT | Not the user's journey. |
| Mobile responsive | OUT | Unless this IS a mobile test. |
| [Feature-specific element] | [In/Out] | [Reason] |

## Step 4 â€” Minimum Screen Count

Force a minimum screen count:

**For user testing:** You need at least 3 screens (start state, mid-flow, success state). You rarely need more than 7.

**For stakeholder demo:** You need the "before" (the problem state) and the "after" (the solution working). 2â€“4 screens is typical.

**For engineering spec:** You need every unique interaction state. Count the number of distinct interactions, not screens.

If the prototype has more than 8 screens, scope it down until it fits. Prototype one flow completely rather than two flows partially.

## Step 5 â€” Mock Data Requirements

Define the mock data needed to make the prototype feel real:

- How many items in each list? (3â€“5 is almost always enough)
- What are the realistic values? (Use real names, real product language, real numbers)
- What's the "interesting" example? (The one that best illustrates the feature's value)

## Step 6 â€” Output

Produce:
- Happy path definition (numbered steps)
- Screen list (only what's in scope)
- Cut list (what's excluded and why)
- Mock data requirements
- Prototype scope statement: "This prototype shows [user type] doing [action] to achieve [goal]. It does NOT show [list of exclusions]."

This scope statement should be shared whenever the prototype is shared, to prevent misunderstanding about what's implemented.

