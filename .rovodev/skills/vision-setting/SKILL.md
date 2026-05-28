---
# Adapted for Rovo Dev: Update 'allowed-tools' to Rovo Dev equivalents (open_files, grep, bash, getJiraIssue, etc.)
# Original Claude tools (Read/Write/Glob) have been mapped in the most critical skills.
---
name: vision-setting
description: Use this skill when the user asks to "write a product vision", "define our vision", "help me articulate where we're going", "vision statement", "long-term vision", "what should our 3-year vision be", "our product story", or wants to create or refine the aspirational direction for the product. Also use this skill when preparing a board or all-hands presentation that needs to anchor on vision. Do NOT use this skill for OKR setting â€” use strategy/okr-structuring for that.
version: 2.0.0
---

# Vision Setting

You are helping the user articulate a clear, compelling product vision â€” the aspirational picture of what the world looks like when they win. Vision is not strategy (how you'll get there) and not roadmap (what you'll build). It's the destination that makes strategy and roadmap choices obvious.

Frameworks: Marty Cagan (vision as a north star), Shreyas Doshi (vision â†’ strategic framework â†’ roadmap stack), Jackie Bavaro (vision â†’ strategy â†’ execution levels).

## Step 1 â€” Load Context

Read `memory/user-profile.md` for product name, stage, core user problem, and current bets. Read `context/company/mission.md` for company direction and values.

## Step 2 â€” Vision Inputs

Before writing, clarify three things:

**The user:** Who specifically benefits from the future world the vision describes? "Everyone" is not a valid answer. Name the specific segment.

**The transformation:** What changes in their life or work when the product achieves its vision? How is their situation meaningfully different?

**The timeframe:** Is this a 1-year, 3-year, or 10-year vision? Calibrate ambition accordingly.

If any of these are unclear, ask one targeted question â€” don't ask all three at once.

## Step 3 â€” The Vision Test

A strong product vision passes all five tests:

1. **Aspirational:** It describes a future state, not a current state or a plan
2. **Specific:** It names who benefits and how â€” not "we'll help people" but "solo PMs will function like 3-person teams"
3. **Durable:** It should still be directionally right 3â€“5 years from now, even if tactics change
4. **Differentiating:** It's distinct from what competitors would say â€” someone should be able to identify the company from the vision alone
5. **Motivating:** It makes smart people want to work here and choose this product

## Step 4 â€” Write Three Vision Drafts

Write three vision statement alternatives:
1. **The narrative version** (3â€“5 sentences): tells the story of the user's transformed life/work
2. **The headline version** (one sentence, 15 words or less): the billboard version
3. **The team version** (internal use): why this matters, who it's for, what winning looks like

For each, identify: what does this make obviously prioritized? What does this make obviously out of scope? If it's not clear, the vision isn't sharp enough.

## Step 5 â€” Strategy Coherence Check

After selecting a vision, check: does the current roadmap point toward this vision?

- Pull roadmap from memory or `context/product/roadmap.md`
- For each Now/Next item: does it move toward this vision or sideways?
- Any item that doesn't connect to the vision is either cover fire (justified) or misaligned (needs discussion)

Flag misaligned items as a conversation for the user to have with their team or leadership.

## Step 6 â€” Output

Produce:
- The three vision drafts with commentary on each
- Recommendation with rationale (which vision is most useful and why)
- A "what this makes obvious" section: top 3 things this vision makes obviously worth doing, and top 3 things it makes obviously not worth doing
- Strategy coherence check result

Offer to save the chosen vision to `memory/user-profile.md` as `current_bets` context.

