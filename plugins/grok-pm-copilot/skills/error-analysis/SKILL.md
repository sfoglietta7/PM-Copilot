---
name: error-analysis
description: Use this skill when the user asks to "analyze AI errors", "error analysis for our AI feature", "open coding", "axial coding", "analyze model failures", "categorize AI mistakes", "find patterns in bad AI outputs", "what's wrong with our AI", or has a set of bad AI outputs and wants to understand what's failing and why. This is the first step in the AI eval methodology from Hamel Husain and Shreya Shankar.
version: 2.0.0
---

# AI Error Analysis

You are conducting a structured error analysis of AI output failures â€” the first and most important step in building an effective eval system. Most teams skip this step and build evals that measure the wrong things, leading to dashboards that are ignored.

Framework: Hamel Husain + Shreya Shankar (Building eval systems that improve your AI product, 2025), Aman Khan (Beyond vibe checks, 2025).

Key principle: "Many teams build eval dashboards that look useful but are ultimately ignored and don't lead to better products, because the metrics these evals report are disconnected from real user problems." â€” Hamel Husain + Shreya Shankar, Lenny's Newsletter (2025)

The solution: ground evals in real failure modes first, then build evals to catch those failures.

## Step 1 â€” Gather Failure Data

Ask the user to provide failure data:
- **Traces:** Input â†’ output pairs where the AI failed. Can be pasted directly or uploaded.
- **User feedback:** Thumbs down, low ratings, complaint tickets about AI outputs
- **Known bad examples:** Cases the team already knows are wrong

Minimum viable set for open coding: 30â€“100 failure examples. More is better, but 30 gives enough signal to start.

## Step 2 â€” Open Coding

Open coding = free-form critique of failures, one at a time, without a predetermined category system.

For each failure:
1. Read the input and the bad output
2. Write a brief, specific description of what went wrong: "The model contradicted the user's stated preference", "The output is factually wrong about [X]", "The response is unhelpfully vague when the user needs specifics"
3. Do NOT categorize yet â€” just describe in your own words

This produces a list of free-form failure descriptions.

**Common AI failure types to watch for (but don't force fit):**
- **Factual error / hallucination:** Model states something incorrect as fact
- **Instruction following failure:** Model ignores or misinterprets the system prompt or user instruction
- **Format error:** Output is in the wrong format (too long, wrong structure, wrong tone)
- **Context failure:** Model ignores or loses relevant context from earlier in the conversation
- **Hedging over-use:** Model adds excessive caveats that undermine the usefulness of the response
- **Scope creep:** Model does more than asked, confusing the user
- **Retrieval failure (RAG):** Retrieved context is wrong, irrelevant, or not used
- **Reasoning error:** Model reaches the wrong conclusion through flawed reasoning
- **Safety over-refusal:** Model refuses a reasonable request due to over-sensitive safety filters

## Step 3 â€” Axial Coding

Axial coding = grouping the open coding descriptions into a manageable set of named failure categories.

Target: fewer than 10 categories. More than 10 is too granular to act on.

For each group of similar descriptions:
- Name the category (3â€“5 words, noun-phrase)
- Write a one-sentence definition
- List 2â€“3 example failure descriptions that fit

The categories should be mutually exclusive (each failure fits in one category) and collectively exhaustive (every failure fits somewhere, even if there's an "Other" category).

## Step 4 â€” Frequency Count

For each category:
- Count how many failures fall into it
- Calculate the percentage of total failures
- Rank by frequency

**The top 3 categories by frequency are your evaluation priorities.** Build evals to catch these first. Everything else is secondary.

## Step 5 â€” Root Cause Analysis

For the top 3 failure categories:
- What causes this type of failure?
  - System prompt issue (instructions are unclear, missing, or contradictory)
  - Model capability issue (this task is at the edge of the model's capability)
  - Context issue (the model doesn't have the information it needs)
  - Retrieval issue (RAG is returning wrong or irrelevant chunks)
  - Data issue (training/fine-tuning examples were poor)
  - Prompt engineering issue (user prompt format triggers this failure)

- Is this fixable with prompt engineering, or does it require a different approach (better retrieval, fine-tuning, model upgrade)?

## Step 6 â€” Output

Produce:
- Open coding output (list of failure descriptions)
- Axial coding result (category names, definitions, counts)
- Ranked failure category table (category | count | % | root cause)
- Top 3 categories with root cause diagnosis and recommended next step
- Eval design recommendation: what evaluation method would catch each top failure category?

