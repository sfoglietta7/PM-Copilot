# Demo: Feedback Analysis

This file shows a complete sample output from the `/synthesize-research` command for a realistic PM scenario.

---

## Input

**User prompt:**
> I have 6 weeks of user feedback from our B2B analytics tool. Here's the batch — 47 support tickets, 23 in-app NPS responses, 8 sales call transcripts, and notes from 12 customer interviews. I want to understand what to build next quarter.

**Feedback batch (sample, condensed for demo):**

```
[Support #1] "The export to CSV loses all my formatting. I have to reformat in Excel every time."
[Support #2] "Dashboard takes 45 seconds to load when I add a second data source. This is unusable."
[Support #3] "I can't figure out how to share a dashboard with my CEO. The share button sends them to a login screen."
[Support #4] "The date picker doesn't have a 'last 90 days' option. I have to manually enter dates every week."
[Support #5] "Where is the API documentation? I've been searching for 30 minutes."
[NPS #1] "Love the tool but the load times are killing me. Would give 10/10 if it was faster." (Score: 7)
[NPS #2] "My CFO can't figure out how to view the board dashboard without creating an account. Big blocker." (Score: 5)
[NPS #3] "Best data visualization I've used. Just wish I could customize the chart colors to match our brand." (Score: 9)
[Interview #1] "We actually use it every day for our weekly review but honestly the sharing workflow feels like it was designed for engineers, not for my VP."
[Interview #2] "Every Monday I'm manually pulling the same three charts for our standups. I've asked your support team twice about automation and they keep sending me to the API docs, which I can't use."
[Interview #3] "The charts are great but once I try to get them to my board, I give up and use a screenshot."
[Sales call #1] "The prospect said 'we'd buy this immediately if we could get a read-only view for our executives.'"
[Sales call #2] "Lost the deal because they needed SSO. Their IT team wouldn't approve the tool without it."
[Sales call #3] "Prospect asked if we integrate with their BI tool (Looker). When I said no, they disengaged."
```

*(47 tickets, 23 NPS, 12 interviews, 8 sales calls — full batch in production; sub-agent handles volume above 30)*

---

## Output

### Step 1 — Memory Context Loaded

- **Product:** B2B analytics tool, post-PMF
- **ICP:** Operations and data teams at mid-market companies
- **Current North Star:** Weekly active dashboards (dashboards viewed ≥ once per week)
- **Stage:** Scale — retention and expansion revenue are priorities

---

### Step 2 — Volume Assessment

Total items: 90 (across 4 sources). Above 30-item threshold — sub-agent deployed for parallel theme extraction across sources. Main agent synthesizing sub-agent outputs here.

---

### Step 3 — Theme Extraction

Open coding produced 34 raw signal tags. Axial coding collapsed to 7 themes:

| Theme | Frequency | Source Mix | Severity |
|---|---|---|---|
| T1: Executive sharing and read-only access | High (22 mentions) | Interviews, NPS, Sales | Critical |
| T2: Dashboard load performance | High (18 mentions) | Support, NPS | High |
| T3: Manual recurring workflows (no automation) | Medium (14 mentions) | Interviews, Support | High |
| T4: Date range / filter shortcuts | Medium (9 mentions) | Support | Medium |
| T5: Export and formatting quality | Medium (8 mentions) | Support | Medium |
| T6: API documentation and developer experience | Low (5 mentions) | Support | Medium |
| T7: Branding and chart customization | Low (4 mentions) | NPS | Low |

---

### Step 4 — Opportunity-Solution Tree Mapping

**Theme T1 → Opportunity: Executives can't access dashboards without creating an account**

Struggling moment: A PM has built a great dashboard and wants to share it with their CFO or board before next week's review. The CFO clicks the link, hits a login screen, and gives up. The PM looks bad. The tool fails its most important sharing moment.

Job: When I need to share work product with non-users, I want a way for them to see it without signing up so that I can drive alignment without requiring IT approvals.

OST opportunity: High priority — affects ICP's most important use case (executive reporting), shows up in sales loss analysis, and is the top NPS detractor theme.

Candidate solutions:
- S1a: Public share link with read-only view (no account required)
- S1b: Guest invite with email-only access (no SSO required, one-click accept)
- S1c: Embeddable dashboard widget for internal wikis / Notion / Confluence

**Theme T2 → Opportunity: Dashboard load time degrades at scale**

Performance failure: 45-second load times when adding a second data source. This breaks the daily review habit, which is the core retention behavior.

OST opportunity: Medium priority — blocks daily use but doesn't appear in sales loss data; likely a post-purchase churn driver.

Candidate solutions:
- S2a: Query optimization + caching layer for multi-source dashboards
- S2b: Progressive loading (show available data while remainder loads)
- S2c: Pre-computed scheduled refreshes for high-frequency dashboards

**Theme T3 → Opportunity: Users manually recreate the same reports weekly**

Struggling moment: Every Monday, the same PM is pulling the same three charts into a slide deck. She's been asking for automation for months. This is a high-frequency pain point that reduces perceived value and creates churn risk.

OST opportunity: Medium priority — clear automation use case; would drive NSM (weekly active dashboards) by increasing automated dashboard views.

Candidate solutions:
- S3a: Scheduled report delivery (email PDF/image on schedule)
- S3b: Dashboard subscriptions with Slack integration
- S3c: Saved "views" that auto-refresh to a linked location

---

### Step 5 — Persona Signal Analysis

**AI Embracer signals (from interview corpus):**
- "I'd love if it could summarize the key changes week over week automatically"
- "If the tool could flag anomalies before I notice them, that would be amazing"
- ~30% of interviewees, mostly in data/ops roles

**AI Skeptic signals:**
- "I just want the data, I don't need AI to interpret it for me"
- "I tried an AI analytics tool before and the summaries were wrong"
- ~45% of interviewees, mostly senior finance/executives

**Neutral signals:**
- "If it's useful and accurate, sure, but don't make it the main thing"
- ~25%

**Implication for feature design:** Any AI-powered insight summary (Theme T3 extension) should be opt-in and positioned as a time-saver, not as the primary UI. Skeptic-friendly framing: "automated summary" not "AI-generated insight." Embracer-friendly: expose confidence score or "view source data" link.

---

### Step 6 — Evidence Map

| Opportunity | User interviews | Support tickets | NPS | Sales data |
|---|---|---|---|---|
| T1: Executive sharing | 8 mentions | 12 mentions | 9 mentions | 2 lost deals |
| T2: Load performance | 3 mentions | 14 mentions | 6 mentions | 0 |
| T3: Recurring automation | 9 mentions | 4 mentions | 2 mentions | 1 mention |
| T4: Date filters | 1 mention | 8 mentions | 0 | 0 |
| T5: Export quality | 2 mentions | 7 mentions | 1 mention | 0 |

**Strongest evidence:** T1 has cross-source validation (interviews + support + NPS + sales) — unusually strong signal. T2 has high support volume but is absent from sales loss data, suggesting post-purchase issue. T3 has high interview signal but lower ticket volume — likely unreported friction.

---

### Step 7 — Open Questions

1. T1: What's the security model for public share links? Need to confirm with security/legal that read-only public URLs are within compliance posture.
2. T2: Is the load time regression isolated to a specific data connector type? Support team should segment by connector before engineering prioritizes.
3. T3: How many users are on a weekly cadence in our analytics? Should validate the scope of this opportunity with product analytics before building.

---

### Step 8 — Recommended Experiments

**Experiment 1 (T1) — Read-only share link:**
MVP: Generate a public URL that shows a static snapshot (not live data) of a dashboard. No account required. Embed behind feature flag.
Hypothesis: If we give PMs a shareable snapshot link, they'll use it to share with executives, increasing the "shared dashboard" event which correlates with retention.
Measure: % of users who share at least one dashboard per month (current: ~18%; target: 35%)
Cost: 1 sprint (frontend only for static snapshot)

**Experiment 2 (T2) — Progressive loading:**
MVP: Show a loading skeleton with available data while remaining data sources load.
Hypothesis: If perceived load time decreases even without actual performance improvement, support ticket volume about "slow dashboards" will drop.
Measure: Support ticket volume for "load time" tag (current: 14/6 weeks; target: <5/6 weeks)

**Experiment 3 (T3) — Scheduled email digest:**
MVP: Allow user to set a weekly schedule for a dashboard to be emailed as a PNG snapshot.
Hypothesis: Users who set up a scheduled digest will have higher weekly active dashboard rates because delivery is automated.
Measure: Week-over-week dashboard view rate for users with a scheduled digest vs. control

---

### Step 9 — Output Summary

**Top opportunity: T1 — Executive sharing (read-only access)**
Strongest cross-source evidence, confirmed sales loss driver, unblocks the ICP's most critical use case (board/executive reporting).

**Recommended Q2 focus:**
- Now: Read-only share link (T1) — 1 sprint MVP to validate hypothesis
- Now: Progressive loading (T2) — unblocks daily use habit
- Next: Scheduled email digest (T3) — drives NSM through automation
- Next: Date range shortcuts (T4) — low cost, high ticket volume
- Later: Export formatting (T5), API docs (T6), chart branding (T7)

**Strategic note:** If T1 (executive sharing) and T3 (automated delivery) are both built, the product moves from a tool analysts use to a product that executives see every week. This is a significant retention moat — executives who see the data weekly advocate for keeping the tool.

---

### Step 10 — Memory Updated

- **Open question logged:** Security model for public share URLs — confirm before building
- **Research themes saved:** 7 themes with evidence counts and priority
- **Roadmap implication:** T1 moved to Now; T3 moved to Next
- **Persona update:** Embracer ~30% / Skeptic ~45% / Neutral ~25% confirmed from this research batch
