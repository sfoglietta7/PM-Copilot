---
# Adapted for Rovo Dev: Update 'allowed-tools' to Rovo Dev equivalents (open_files, grep, bash, getJiraIssue, etc.)
# Original Claude tools (Read/Write/Glob) have been mapped in the most critical skills.
---
name: funnel-analysis
description: Use this skill when the user asks to "analyze my funnel", "where are users dropping off", "funnel analysis", "conversion analysis", "activation funnel", "onboarding funnel", "purchase funnel", "what's my conversion rate", or has funnel data showing step-by-step drop-off rates and wants to diagnose where to focus.
version: 2.0.0
---

# Funnel Analysis

You are analyzing a conversion funnel to identify where users drop off, why they drop off, and what actions would most improve overall conversion.

Framework: AARRR (Pirate Metrics â€” Acquisition, Activation, Retention, Revenue, Referral), Dave McClure's funnel stages.

## Step 1 â€” Load Context

Read `memory/user-profile.md` for product stage and business model. Read `context/company/analytics-baseline.md` for existing conversion benchmarks.

## Step 2 â€” Funnel Data Input

Ask the user to provide the funnel data. Accept in any format:
- Step names and conversion rates at each step
- Raw numbers (absolute users at each step)
- A description of the funnel steps and approximate drop-off

If the user describes the funnel without numbers, help them estimate or identify where to find the data.

## Step 3 â€” Calculate Key Metrics

From the funnel data, calculate:
- **Step-by-step conversion rate:** Users at step N Ã· users at step N-1
- **Overall funnel conversion:** Users at the final step Ã· users at the first step
- **Absolute drop-off:** Users lost at each step (in absolute numbers, not just %)
- **Revenue impact of each step:** Absolute drop-off Ã— revenue per converted user = value of fixing this step

## Step 4 â€” Identify the Biggest Opportunity

Find the step with the highest combination of:
1. Large absolute drop-off (many users lost here)
2. High recovery value (if conversion improved by 10%, how much total revenue or engagement would that add?)
3. Actionability (is there a known reason for the drop? Is there a plausible fix?)

This is the "leaky bucket" â€” the one step that, if fixed, would most improve the entire funnel.

## Step 5 â€” Diagnose Each Major Drop

For each step with > 20% drop-off:

**What happens at this step?** (What does the user have to do?)
**Why do users drop here?** (Likely causes â€” look for patterns in: UX friction, value perception, trust signals, cognitive load, technical issues)
**What would you need to know to fix it?** (Qualitative insight from interviews? Quantitative data from heatmaps or session recordings? An A/B test?)

**Common funnel drop diagnoses:**

| Drop Location | Likely Cause | Diagnostic |
|---|---|---|
| Landing page â†’ signup | Value prop unclear; sign-up friction | Session recording; copy test |
| Signup â†’ first action | Onboarding too long; time to value too slow | Time to first action analysis; session replay |
| First action â†’ second action | Not seeing value from first action | Interview: "what did you expect to happen?" |
| Free â†’ paid | Paywall too early; wrong trigger; poor value communication | Behavioral analysis before upgrade prompt |
| Paid â†’ renewal | Product not becoming habit; poor ongoing value | Cohort analysis; engagement depth |

## Step 6 â€” Prioritization Matrix

For each major drop:
- Volume of impact (absolute users Ã— value per conversion)
- Effort to fix (quick UX fix vs. major engineering)
- Confidence that the fix will work (high evidence vs. hypothesis)

Recommend the top 1â€“2 improvements to try in the next sprint.

## Step 7 â€” Output

Produce:
- Funnel visualization (text table with step names, conversion rates, absolute drop-off)
- Revenue/engagement impact per step (if baseline data is available)
- Diagnosis for each major drop with most likely cause
- Prioritized fix recommendations
- Recommended experiments (one per top-priority step)

