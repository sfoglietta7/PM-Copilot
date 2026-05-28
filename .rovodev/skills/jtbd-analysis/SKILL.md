---
# Adapted for Rovo Dev: Update 'allowed-tools' to Rovo Dev equivalents (open_files, grep, bash, getJiraIssue, etc.)
# Original Claude tools (Read/Write/Glob) have been mapped in the most critical skills.
---
name: jtbd-analysis
description: Use this skill when the user asks about "jobs to be done", "JTBD", "what job are users hiring us for", "demand-side thinking", "what progress are users trying to make", "why do users switch to our product", "what are users really trying to accomplish", "forces of progress", "push pull analysis", or wants to understand user motivation beyond surface-level feature requests. Also use this skill when analyzing customer churn or acquisition to understand the switching trigger.
version: 2.0.0
---

# Jobs-to-be-Done Analysis

You are applying demand-side JTBD analysis (Bob Moesta / Clay Christensen) to understand what progress users are trying to make, and why they hire or fire products. The goal is to find where users will change behavior â€” because context makes the irrational rational.

Key principle: "People don't buy products; they hire them to make progress in their lives." â€” Clay Christensen

## Step 1 â€” Load Context

Read `memory/user-profile.md` for product context, and `context/product/personas.md` for user segments. Identify any existing JTBD insights already captured.

## Step 2 â€” Identify the Struggling Moment

The JTBD framework starts not with the product, but with the moment a user decides something has to change.

Ask the user (or infer from the context):
- "What situation triggers a user to start looking for a solution?"
- "What is the first thing that happens before someone buys or adopts our product?"
- "What is the user's life like right before they hire our product?"

This is the **first thought** moment â€” the triggering event. It could be: a painful event, a new constraint, a milestone, a social pressure, or a realization.

## Step 3 â€” Map the Four Forces

For the target user making a switch (from their current solution to ours), map the four forces:

**Push forces â€” what's pushing them away from the status quo:**
- Frustrations with the current solution
- Anxiety about staying with what they have
- A new problem that the current solution can't handle
- A growing gap between what they need and what they have

**Pull forces â€” what's attracting them to the new solution:**
- The promise of a better outcome
- A specific feature or capability they've seen
- Social proof (someone they respect is using it)
- A new habit or workflow they want to build

**Anxiety forces â€” what's making them hesitate to switch:**
- Fear of learning curve
- Cost of switching (data migration, team training)
- Risk of it not working ("what if this doesn't solve my problem either?")
- Loyalty or sunk cost with current solution

**Habit forces â€” what's keeping them with the old way:**
- Muscle memory and workflow familiarity
- Other tools that integrate with the current solution
- Team or organization inertia
- "Good enough" threshold â€” it's annoying but not painful enough to justify switching

## Step 4 â€” Define the Job Statement

Write the job-to-be-done statement in this format:

**Job statement:** "When [situation / struggling moment], I want to [motivation / what progress they're trying to make], so I can [expected outcome â€” functional / emotional / social]."

Write three versions of the job statement:
1. **Functional job:** The practical task they're trying to accomplish
2. **Emotional job:** How they want to feel during or after
3. **Social job:** How they want to be perceived by others

The best positioning addresses all three. Most products only address the functional job â€” the emotional and social jobs are where differentiation lives.

## Step 5 â€” Competitive Hire Analysis

Who or what is the user currently "hiring" to do this job?
- Name the current hire (could be a product, a process, a person, or nothing)
- What is the user tolerating or workaround-ing with their current hire?
- What would make them fire their current hire?

This defines the true competitive set â€” which is often not who you think.

## Step 6 â€” JTBD Output

Produce a JTBD summary:

**Struggling moment:** [Triggering situation]
**Functional job:** [What the user is trying to accomplish]
**Emotional job:** [How they want to feel]
**Social job:** [How they want to be seen]
**Current hire:** [What they're using today and what's wrong with it]
**Switch trigger:** [What specific event or threshold causes them to look for an alternative]
**Key push:** [The biggest frustration with the status quo]
**Key pull:** [The most attractive thing about the new solution]
**Key anxiety:** [The biggest hesitation about switching]
**Key habit:** [The most powerful inertia keeping them with the old way]
**Implications for us:** [What this means for positioning, onboarding, and messaging]

Offer to add JTBD findings to `memory/user-profile.md` and to relevant persona sections.

