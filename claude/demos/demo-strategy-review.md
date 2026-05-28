# Demo: Strategy Review

This file shows a complete sample output from the `strategy-stack` skill and `pre-mortem` skill used together, for a realistic PM scenario.

---

## Input

**User prompt:**
> Can you review our product strategy? We're a project management tool for creative agencies. 18 months post-launch, $2.1M ARR, growing 8% MoM. We've been trying to compete with Asana and Monday.com but we're struggling to explain why a team would choose us over them. Our bet is on AI — we're building AI features but haven't shipped anything meaningful yet. The board is asking for a 2-year vision.

---

## Output

### Part 1: Strategy Stack Review

---

#### Level 1 — Vision

**Current vision (inferred from prompt):** "A project management tool for creative agencies with AI."

**Diagnosis: Weak.** This is a category description, not a vision. It describes what you are, not the future state you're creating. "With AI" is an additive feature claim, not a strategic direction.

**The test:** Can a potential customer hear your vision and feel like you built the product for them specifically? Would a creative agency head say "that's exactly what we've been waiting for"? A vision statement for "AI project management for agencies" fails this test.

**Draft alternatives to consider:**

Option A (outcome-oriented): "Creative agencies that use [Product] should always know which projects are at risk, why, and exactly what to do about it — before a client ever feels a delay."

Option B (customer-change-oriented): "We exist to give creative directors time back. The agencies that run on [Product] spend 40% less time in status meetings and 40% more time making things."

Option C (market redefinition): "Project management built for work that doesn't fit in a Gantt chart."

**Recommendation:** Option C is the most defensible — it names the category problem (Asana and Monday.com are built for linear projects; creative work isn't linear) and positions against it directly. Develop this into a full vision narrative.

---

#### Level 2 — Positioning

**Current positioning (inferred):** "We're like Asana but with AI."

**Diagnosis: Fatal.** This is borrowed framing. You're positioning yourself as a lesser version of a $10B company. A prospect who hears "like Asana but with AI" will think: "Why not just wait for Asana to add AI?" — and they'll be right.

**The April Dunford 5-component positioning analysis:**

| Component | Current State | Target State |
|---|---|---|
| Competitive alternatives | "Asana, Monday.com" | "Spreadsheets + Slack threads + Notion pages (how agencies actually manage projects today)" |
| Unique attributes | "AI features (not yet shipped)" | "Built for non-linear creative workflows: briefing → concepting → revisions → approvals → delivery" |
| Value delivered | Unclear | "Creative directors know project status without asking. Clients get updates without manual work." |
| Who cares most | Unclear | "Creative agencies 10–100 people where the principal is still doing client work + team management simultaneously" |
| Market category | "Project management" | "Creative operations" |

**The category reframe:** Asana and Monday.com compete in "work management." The better category for a creative agency tool is "creative operations" — a narrower space where you have a legitimate right to win. This isn't a niche retreat; it's a beachhead. Creative agencies are a definable segment with shared workflows, high tool frustration, and willingness to pay for vertical-specific solutions.

---

#### Level 3 — OKRs

**Current OKRs (inferred):** Revenue growth and feature delivery.

**Diagnosis: Unclear if OKRs connect to strategy.** 8% MoM growth is strong. But if the strategic bet is "creative agencies" and "AI differentiation," the OKRs should be measuring progress against those bets, not just revenue.

**Proposed OKR architecture for next quarter:**

**O1: Establish the creative operations category**
- KR1: 80% of new sign-ups self-identify as creative agencies (vs. current baseline — measure this)
- KR2: 3 new case studies published with creative agency customers demonstrating specific workflow value
- KR3: ICP accuracy: 70% of closed deals match creative agency ICP definition

**O2: Ship the first meaningful AI capability**
- KR1: One AI feature in GA with >30% weekly active usage among beta cohort
- KR2: AI-assisted feature reduces time-to-update (the status reporting workflow) by measurable amount
- KR3: No increase in support tickets related to AI feature (quality floor)

**O3: Retention**
- KR1: D90 retention for agencies that onboard a full team (3+ users): 75%+
- KR2: Expansion revenue rate: 20%+ of accounts expand seat count in first year

---

#### Level 4 — Roadmap

**Current roadmap (inferred):** Broad feature parity + AI features in development.

**Diagnosis: Cover fire / big bet split is unclear.** The "AI bet" is described as a long-term investment, but "hasn't shipped anything meaningful yet." If AI is the strategic differentiator and it's not shipping, the roadmap isn't aligned to the strategy.

**Recommended split:**
- 70% cover fire: Workflow completeness for creative agencies (briefing, revision tracking, approval workflows, client portal) — these are table stakes to win the category
- 30% big bet: AI status intelligence — automatic project health summary, risk flagging based on pattern recognition from past projects

**Now / Next / Later:**

| Now | Next | Later |
|---|---|---|
| Approval workflow (removes manual back-and-forth) | AI project health summary (the first meaningful AI bet) | Client portal (expands value to agency's clients) |
| Creative brief template (ICP-specific onboarding) | Revision tracking with AI change summary | AI-generated SOW/timeline estimates |
| Slack integration for status updates | Integration: Adobe Creative Cloud, Figma | White-label for agencies with multiple sub-brands |

---

#### Level 5 — Execution

**Diagnosis: Green.** 8% MoM growth and 18 months of shipping suggests execution is working. The issue is not execution quality — it's direction clarity.

---

#### Strategy Stack Score

| Level | Score | Note |
|---|---|---|
| Vision | 3/10 | Category description, not a future state |
| Positioning | 2/10 | Borrowed framing from Asana |
| OKRs | 5/10 | Revenue growth tracked but not strategy-linked |
| Roadmap | 5/10 | Good execution discipline, unclear strategic focus |
| Execution | 8/10 | Shipping and growing |

**Total: 23/50 — Strategy needs significant work**

The company is executing well on a strategy that isn't clearly defined. The biggest single unlock: commit to the creative operations category and let that drive positioning, roadmap, and OKR choices.

---

### Part 2: Pre-Mortem — "It's 18 months from now and we failed"

---

**Facilitation prompt used:** "It's Q4 2027. [Product] failed to become the market leader in creative operations. What happened?"

---

#### Failure scenario analysis

**F1 — The Asana AI catch-up (Probability: High | Impact: Critical)**
Asana or Monday.com ships a creative-agency-specific AI workflow module in the next 12 months. Their brand recognition, existing enterprise contracts, and distribution overwhelm any differentiation we've built. Agencies already using Asana don't switch.

Mitigation: Accelerate the category narrative (not just the features) — make "creative operations" a term that prospects use before they find Asana. Become known as the category creator, not a feature differentiator.

**F2 — AI features don't deliver enough value to justify the bet (Probability: Medium | Impact: High)**
We ship AI features but adoption is low because agents don't trust the outputs, the workflow integration is awkward, or the value proposition isn't clear. AI becomes a marketing claim, not a retention driver.

Mitigation: Define success for AI features in behavioral terms before shipping — not "AI feature shipped" but "AI feature used weekly by 30%+ of active users." Set a quality floor in evaluation methodology.

**F3 — ICP spread too wide — we win agencies but not all agencies (Probability: Medium | Impact: Medium)**
"Creative agencies" covers video production, advertising, brand design, UX agencies, marketing firms, PR agencies. Their workflows are different enough that a single product satisfies none of them deeply.

Mitigation: Pick the beachhead within creative agencies. Best candidate: brand/design agencies 10–50 people, where revision tracking and client approval are daily friction points. Win that segment completely before expanding.

**F4 — Founder/PM altitude mismatch — we stay too tactical (Probability: Medium | Impact: High)**
With a small team and strong execution culture, it's easy to stay in the weeds — shipping features, fixing bugs, responding to customer requests. The 2-year vision and category narrative never get developed because there's always something more urgent.

Mitigation: Designate one "altitude sprint" per quarter — a 2-week period where the PM focuses exclusively on vision, positioning, and strategy artifacts. Ship no features during this period.

**F5 — Sales motion doesn't match ICP (Probability: Low-Medium | Impact: Medium)**
The sales team is selling to anyone who will buy, not specifically to creative agencies. Deal quality is mixed. The case study corpus doesn't establish category authority. Investors ask why revenue is growing but category leadership isn't emerging.

Mitigation: GTM specialization — creative agency language in all outbound, ICP qualification criteria in sales playbook, agency-specific onboarding track.

---

#### Priority matrix

| Failure mode | Likelihood | Impact | Detectability | Priority |
|---|---|---|---|---|
| F1: Asana AI catch-up | High | Critical | Medium | 1 |
| F4: Altitude mismatch | Medium | High | Low | 2 |
| F2: AI value failure | Medium | High | Medium | 3 |
| F3: ICP spread | Medium | Medium | Medium | 4 |
| F5: Sales motion mismatch | Low-Medium | Medium | High | 5 |

---

#### Pre-Mortem Actions

**This quarter:**
1. Write the "creative operations" category narrative — 1 page that defines the category and places [Product] as the category creator
2. Define the AI feature quality bar: what does success look like in user behavior terms?
3. Define the beachhead ICP: brand/design agencies 10–50 people; build the qualification criteria

**This year:**
1. Establish 3 marquee creative agency case studies that name the "creative operations" category
2. Ship AI project health summary with a measurable retention impact
3. Formalize the altitude sprint cadence — protect it from execution pressure

---

### Memory Updated

- **Strategic risk logged:** Asana AI catch-up — watch for announcements, prioritize category narrative
- **Vision direction:** "Creative operations" category reframe — needs CEO alignment
- **Beachhead ICP:** Brand/design agencies 10–50 people
- **Open question:** Does the current team self-identify as "creative operations" or "project management"? Needs alignment conversation.
