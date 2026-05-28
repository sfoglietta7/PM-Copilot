# Demo: Stakeholder Update

This file shows a complete sample output from the `/stakeholder-update` command — three audience-tailored versions of the same product update, generated from a single prompt.

---

## Input

**User prompt:**
> I need to send a stakeholder update about our Q1 progress. The big news: we shipped the AI Smart Reply feature to 50-agent beta last week. Acceptance rate is 24% after 5 days (better than the 20% gate we set). CSAT held steady at 4.3/5. But load times got worse — average 38 seconds instead of 35 — and engineering says fixing it will push our next feature 2 weeks. I need to send updates to my CEO, to engineering, and I'd like a customer-facing version for our beta group.

---

## Memory Context Loaded

- **Product:** B2B customer support tool
- **ICP:** Mid-market SaaS companies, support teams
- **North Star:** Tickets resolved per agent per day
- **Current risk:** Dashboard load time — was 35s avg, now 38s
- **AI Smart Reply:** Beta launched, 50 agents, acceptance rate 24% (gate: 20%)
- **Roadmap item at risk:** Next feature (TBD) — 2-week slip due to load time fix

---

## Version 1: CEO / Executive Update

**Format:** Slack message (bottom-line up front)

---

**AI Smart Reply beta is exceeding targets. One performance issue requires a call.**

**The good:**
- Beta acceptance rate: 24% (our gate was 20%) — agents are using it
- CSAT steady at 4.3/5 — quality is not degrading
- On track to expand to all 15k DAU agents in 6 weeks if the trend holds

**The issue:**
Dashboard load times crept up from 35s to 38s after the AI integration. Engineering has a fix scoped but it will push our next planned feature by 2 weeks.

**My recommendation:**
Take the 2-week slip. Load time is a churn risk and undermines the retention story we need for renewal conversations. The delay is worth it.

**Decision needed:**
Are you aligned on deprioritizing the next feature to fix load time first? If yes, I'll confirm with engineering today.

---

## Version 2: Engineering Update

**Format:** Written async brief (Notion or Confluence)

---

**Q1 Product Health Check — Engineering**
**Date:** 2026-03-23
**From:** [PM Name]

---

### What shipped

**AI Smart Reply — beta live (50 agents)**
- Feature went out last week on schedule
- Acceptance rate at day 5: 24% (target was 20% — we're above the gate)
- Zero critical errors reported; one edge case around multi-brand contexts logged as P2 (ticket #847)

---

### Current issue: Load time regression

**Observed:** Average dashboard load time increased from 35s to 38s post-AI integration.
**Customer impact:** Already seeing a small uptick in "slow" complaints in support tickets (3 this week, 0 baseline last month).
**Priority:** High — this is a retention-affecting issue and I want to address it before expanding the beta.

**What I need from engineering:**
- Confirm the scoped fix approach (caching layer, as discussed)
- Timeline confirmation: is 2 weeks realistic or should I be planning for 3?
- Dependency check: does this block the [Next Feature] release or delay it specifically?

**What I'm planning to communicate upward:**
Recommendation to leadership is to take the 2-week slip and fix load time first. I'll communicate this today — need your public confirmation of the scope before I do.

---

### Beta expansion gating criteria (for shared tracking)

| Metric | Gate | Current | Status |
|---|---|---|---|
| Acceptance rate | > 20% | 24% | Pass |
| CSAT | ≥ baseline (4.2) | 4.3 | Pass |
| Critical errors | 0 | 0 | Pass |
| Load time | ≤ 35s avg | 38s | Fail — blocking expansion |

**Next gate review:** Week of 2026-03-30, after load time fix ships.

---

### Upcoming decisions I need your input on

1. **Confidence threshold calibration:** ML team flagged that the 0.7 threshold may be too conservative — suppressing suggestions that would have been accepted. Want to do a retrospective analysis on dismissed suggestions after 2 more weeks of data.

2. **GDPR exclusions:** 6 accounts have DPA clauses. Confirmed these accounts are excluded from suggestion generation. Verify this is working correctly in the feature flag config.

---

## Version 3: Customer-Facing Beta Update

**Format:** Email to beta participants

---

**Subject:** AI Smart Reply Week 1 — What We're Seeing + What's Next

Hi [Name],

One week in, and we wanted to share what we're seeing across the beta — and be transparent about one issue we're working through.

---

**The early numbers are encouraging.**

Across the 50 agents in this beta group, about 1 in 4 AI suggestions is being accepted. That might sound low, but it's actually above the bar we set for ourselves — we consider this a strong signal that the suggestions are useful when they appear.

Customer satisfaction scores across your teams have stayed consistent with pre-beta levels. That matters a lot to us — our goal was to speed up responses, not compromise their quality.

---

**One thing we're fixing before expanding.**

After launching Smart Reply, we noticed a small increase in dashboard load times — from about 35 seconds to 38 seconds on average. That's not acceptable to us. We're pausing the beta expansion while we address this, and our engineering team has a fix scoped for the next 2 weeks.

We wanted to be upfront rather than just quietly fix it. If you've noticed this slowness, that's why.

---

**What you can do.**

The most helpful thing you can do right now: keep using Smart Reply normally and let us know if you see suggestions that are clearly wrong or off-brand. Reply to this email or use the "Dismiss" button with a note (we read them all).

A few things we're curious about:
- Are there ticket types where suggestions are consistently good vs. consistently bad?
- Is the "Accept → Edit" flow (where you accept but then change something) useful, or do you find yourself dismissing and starting over?

Any feedback is welcome. We read every response from this group.

---

**Timeline:**
- Load time fix: ~2 weeks (mid-April)
- Beta expansion to all agents: after fix ships, pending final quality check
- GA timeline: We'll share an update in our next note

Thank you for being part of this early group. Your usage data is directly shaping what we build next.

[PM Name]
[Product Name] Team

---

## Which version to send?

| Audience | Format | Tone | Key goal |
|---|---|---|---|
| CEO | Slack, 150 words | Bottom-line up front, decision-oriented | Get alignment on 2-week slip before communicating it |
| Engineering | Written brief, structured | Collaborative, specific, action-oriented | Confirm scope + get their input on two open questions |
| Beta customers | Email, 300 words | Transparent, human, non-technical | Build trust + collect qualitative signal |

---

## Memory Updated

- **Metric logged:** AI Smart Reply acceptance rate 24% (day 5), CSAT 4.3 stable
- **Risk updated:** Load time regression — 38s avg (up from 35s) — in progress, fix scoped for 2 weeks
- **Roadmap update:** Next feature delayed ~2 weeks pending load time fix
- **Open question updated:** Confidence threshold calibration — revisit after 2 more weeks of data
