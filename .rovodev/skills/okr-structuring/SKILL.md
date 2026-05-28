---
# Adapted for Rovo Dev: Update 'allowed-tools' to Rovo Dev equivalents (open_files, grep, bash, getJiraIssue, etc.)
# Original Claude tools (Read/Write/Glob) have been mapped in the most critical skills.
---
name: okr-structuring
description: Use this skill when the user asks to "write OKRs", "structure our OKRs", "help with quarterly goals", "OKR review", "are our OKRs good", "how do I write key results", "our objectives and key results", "check our OKRs", or wants to create, review, or improve their OKR structure. Also use this skill when the user's roadmap items don't clearly connect to stated objectives.
version: 2.0.0
---

# OKR Structuring

You are helping the user write or review OKRs that encode genuine strategic intent â€” not just activity tracking. The goal is OKRs that make roadmap prioritization decisions obvious and tell the product story to leadership.

Frameworks: Marty Cagan (outcomes not output), Shreyas Doshi (strategy vs. execution levels), John Doerr (Measure What Matters).

## Step 1 â€” Load Context

Read `memory/user-profile.md` for current bets, North Star, and roadmap state. Read `context/product/roadmap.md` for current objectives. Read `context/company/mission.md` for company-level direction.

## Step 2 â€” OKR Quality Criteria

Before writing or reviewing, establish the quality bar:

**Objective quality:**
- Is it inspirational and outcome-oriented, not a list of tasks?
- Does it connect clearly to the company mission or North Star?
- Would a smart person outside the team understand why this matters?
- Is it achievable within the timeframe with a real stretch required?

**Key Result quality:**
- Is it a metric with a baseline, target, and timeframe â€” not a milestone?
- Does it measure an outcome the user cares about, not a delivery ("ship feature X")?
- Is it independently measurable â€” not dependent on another KR?
- Is it achievable with 70â€“80% confidence? (Too easy = no stretch; too hard = gives up)

## Step 3 â€” The Output vs. Outcome Test

For each objective and key result, apply the test:

âŒ **Output-framed (bad):** "Ship the new onboarding flow" â€” this measures delivery, not impact
âœ“ **Outcome-framed (good):** "Increase 7-day activation rate from 61% to 75%" â€” this measures what matters

Common outputs disguised as outcomes:
- "Launch X" â†’ Ask: what changes for users when X launches?
- "Increase X feature adoption to Y%" â†’ Ask: does feature adoption translate to the outcome that matters?
- "Complete X research project" â†’ Ask: what decision does this enable?

Help the user reframe all output-framed KRs.

## Step 4 â€” OKR Architecture

Structure OKRs in a clear hierarchy:

**Company-level OKR:** What the whole company is trying to achieve
- **Team-level OKR:** What the product team contributes toward the company OKR
  - **Project-level KRs:** What specific initiatives move the team KR

Make sure each level clearly ladders up. A team OKR that doesn't connect to a company OKR is either a supporting objective (maintenance, tech debt) or misaligned.

## Step 5 â€” Number of OKRs

Recommend the right number based on team size and stage:
- **Solo PM / founding PM (from memory):** 1â€“2 objectives, 2â€“3 KRs each â€” focus is your competitive advantage
- **Small team (< 10):** 2â€“3 objectives, 2â€“4 KRs each
- **Larger team:** 3â€“4 objectives, no more than 5 KRs each

More OKRs = everything is a priority = nothing is.

## Step 6 â€” Write or Review

**If writing from scratch:** Produce a full OKR set with:
- 1â€“3 objectives
- 2â€“4 KRs per objective
- Brief rationale for why each KR is the right measure

**If reviewing existing OKRs:** Score each OKR on the quality criteria (Step 2) and provide:
- What's working
- What to change
- Rewritten versions of any weak objectives or key results

## Step 7 â€” Roadmap-OKR Linkage Check

After OKRs are established, check alignment with the roadmap from memory or `context/product/roadmap.md`:

- For each Now item: which KR does it serve?
- For each KR: is there at least one Now or Next item that moves it?
- Any KR with no roadmap item pointing at it is either a gap (we need something) or a wrong KR (it doesn't translate to buildable work)
- Any roadmap item that doesn't serve a KR is either maintenance (fine, label it so) or misaligned (discuss with team)

Output a simple alignment table.

