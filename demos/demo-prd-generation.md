# Demo: PRD Generation

This file shows a complete sample output from the `/write-prd` command for a realistic PM scenario.

---

## Input

**User prompt:**
> We're building an AI-powered "smart reply" feature for our B2B customer support tool. Support agents handle 80–120 tickets per day and spend 40% of their time writing responses that are nearly identical to previous ones. I want to suggest AI-generated replies that agents can accept, edit, or dismiss. We're post-PMF, 15k DAU support agents, mostly at mid-market SaaS companies.

---

## Output

### Step 1 — Memory Context Loaded

- **Product:** B2B customer support tool, post-PMF
- **ICP:** Mid-market SaaS companies, 50–500 seat teams
- **Stack:** React frontend, Node.js API, PostgreSQL, existing ticket data via internal API
- **Stage:** Scale — need repeatable growth loops, not PMF experiments
- **North Star Metric:** Tickets resolved per agent per day

---

### Step 2 — JTBD Analysis

**Struggling moment:**
> A support agent is staring at ticket #847. The user's issue is a familiar one — a billing question they've answered 30 times. But they still have to open a previous ticket, find a response that worked, copy it, adapt it, paste it. This takes 4–6 minutes for a response that could take 45 seconds.

**Four forces analysis:**

| Force | What's present |
|---|---|
| Push (away from current) | "I'm doing the same work over and over and it's exhausting" |
| Pull (toward new) | "If AI could give me a draft, I could just fix the name and send it" |
| Anxiety (about new) | "What if the AI says something wrong to a customer?" |
| Habit (keeping current) | "I've developed my own library of saved replies — I know where everything is" |

**Job statement:**
> When I'm handling a familiar support request, I want to quickly produce an accurate, on-brand response so that I can resolve the ticket faster and spend my energy on the hard cases.

**Competitive hire:**
Agents currently "hire" saved reply templates, copy-paste from previous tickets, or write from scratch. The new feature is competing with the saved reply habit most. Design must feel faster than saved replies, not just different.

---

### Step 3 — Opportunity-Solution Tree

**Desired outcome:** Increase tickets resolved per agent per day from 80 to 100+

**Opportunities:**
- O1: Time spent on repetitive/templatable responses (40% of ticket time)
- O2: Time spent searching for correct previous response (6–8 min per ticket)
- O3: Agent ramp time — new agents write slower because they don't have saved reply libraries yet

**Solution targeting O1 + O2:** AI Smart Reply
> Surface AI-generated draft responses inline in the ticket compose area based on ticket content and historical resolution data.

---

### Step 4 — PRD

---

**Product Requirements Document**
**Feature:** AI Smart Reply
**Author:** [PM Name]
**Status:** Draft
**Last updated:** 2026-03-23

---

#### Problem

Support agents at mid-market SaaS companies handle 80–120 tickets per day. Based on usage analysis, 40–50% of these tickets are variations of recurring request types (billing questions, how-to questions, password resets, plan upgrade inquiries). Agents currently copy-paste from saved replies or previous tickets — a process that takes 4–6 minutes per ticket and doesn't improve with scale.

**The opportunity:** If we can surface an AI-generated draft response before the agent starts typing, we can compress resolution time for repetitive tickets to under 90 seconds.

---

#### Goals

**Primary metric:** Tickets resolved per agent per day (target: 80 → 100, +25%)
**Secondary metric:** Average handle time on "AI-assisted" tickets (target: < 90 seconds)
**Guardrail metric:** Customer satisfaction score (CSAT) — must not drop below baseline

---

#### Non-Goals

- This PRD does not cover fully autonomous replies (send without agent review)
- This PRD does not cover multi-turn conversation assistance (just first-response drafting)
- This PRD does not address ticket routing or prioritization
- This PRD does not cover integration with third-party AI providers beyond the current stack

---

#### User Stories

**Story 1 — Core happy path**
As a support agent, when I open a ticket, I want to see an AI-generated draft reply so that I can send a response faster without starting from scratch.

Acceptance criteria:
- Given a ticket has been open for > 3 seconds, when the agent clicks into the reply composer, then a suggested reply appears inline with a clear "AI Suggested" label
- The suggested reply includes the customer's name (if available) and references the specific issue in the ticket
- The agent can click "Accept," "Edit," or "Dismiss" on the suggestion
- Accepting inserts the full text into the compose area and allows further editing
- Dismissing removes the suggestion and lets the agent compose normally

**Story 2 — Agent edits suggestion**
As a support agent, when the AI suggestion is close but not quite right, I want to edit it inline so that I don't lose the draft and have to start over.

Acceptance criteria:
- Clicking "Edit" makes the suggested reply text editable in place
- Changes are tracked for model improvement (accepted edits collected with consent disclosure)
- After editing, the agent can send or continue modifying

**Story 3 — Agent dismisses suggestion**
As a support agent, when the AI suggestion is wrong or off-topic, I want to dismiss it without disruption so that I can write the response myself.

Acceptance criteria:
- Dismiss removes the suggestion immediately
- No feedback prompt is shown (avoid friction on dismissal)
- Dismissal is logged silently for quality analysis

**Story 4 — Low confidence threshold**
As a support agent, when the AI isn't confident about the right response, I want to be told so I don't rely on a guess.

Acceptance criteria:
- If the model confidence score is below threshold (TBD with ML team, likely < 0.7), no suggestion is shown
- The compose area appears normally with no indication that a suggestion was attempted

---

#### AI Feature Design

**Model tier:** Mid-tier (Sonnet-equivalent) — response quality matters; cost per ticket is acceptable at this ARR range

**Context window input:** Ticket subject + body + top 3 most similar resolved tickets (retrieved via embedding similarity from historical ticket store) + last 30 days of this customer's ticket history

**Output format:** Single plain-text reply, 50–200 words, first-person agent voice

**Failure mode design:**
- Model latency > 2s: surface reply with "Generating…" spinner; hide if not resolved in 4s
- Model error or timeout: silent failure; compose area appears normally
- Hallucination risk: no suggestions for tickets involving pricing quotes, legal questions, or escalation paths — these are blocked by ticket category tag

**Prompt strategy:** Few-shot with 3 examples from best-rated historical responses in the same ticket category + system instruction: "You are a helpful support agent for [Company]. Write a warm, clear reply that resolves the customer's question. Do not make promises about pricing or timelines."

---

#### Edge Cases

| Scenario | Handling |
|---|---|
| New customer with no ticket history | Use category-level history only, lower confidence threshold |
| Agent works across multiple clients / brands | Suggestion is brand-scoped — verify agent's current context before generating |
| Ticket in non-English language | Detect language; generate reply in detected language if model supports it; otherwise suppress suggestion |
| GDPR / data residency customer | Exclude ticket data from model context for customers with DPA clauses; no suggestion generated |

---

#### Success Criteria

**Week 1–2 (beta, 50 agents):**
- Suggestion acceptance rate > 20% (baseline: 0%)
- No CSAT degradation vs. control group
- No critical AI errors reported by agents

**Month 1 (general availability):**
- Ticket resolution time on assisted tickets: -30% vs. unassisted
- Tickets resolved per agent per day: +15%
- Suggestion shown rate: > 60% of tickets (40% blocked by confidence threshold or category exclusion)

**Month 3:**
- Tickets resolved per agent per day: +25%
- Feature adoption: 80% of agents have used AI Smart Reply at least once

---

### Step 5 — Prototype-Ready Spec

**Prototype purpose:** User testing with 5–8 support agents before building

**Happy path:**
1. Agent opens ticket (customer asking about invoice date)
2. Agent clicks into reply composer
3. AI suggestion appears inline with "AI Suggested" label
4. Agent clicks "Accept"
5. Suggestion populates the compose area
6. Agent sends reply

**Prototype scope:** 3 screens — ticket view (with suggestion loading), ticket view (with suggestion visible), success state (reply sent confirmation)

**Mock data:** 3 sample tickets — one billing question, one how-to, one feature request (the how-to has the strongest AI suggestion for demo purposes)

**Tool recommendation:** Cursor or Bolt — this is a functional form interaction, not just a visual mockup

**Prototype prompt excerpt:**
> Build a support ticket interface with a reply composer. When the agent clicks the composer, show an inline "AI Suggested" reply card with [sample text], an Accept button, an Edit button, and a Dismiss button. Accept populates the textarea. Dismiss removes the card. Use a clean, minimal UI similar to Intercom or Zendesk. Mock data: [provide 3 tickets]. Stack: React + Tailwind, no backend.

---

### Step 6 — Cagan Outcomes Check

| Check | Status |
|---|---|
| Is this outcome-driven, not feature-driven? | Yes — success is defined by tickets/agent/day, not by suggestion shown rate |
| Does the team know the why, not just the what? | Yes — JTBD and struggling moment are documented |
| Is there a clear experiment before full build? | Yes — 50-agent beta with accept rate gate |
| Are we risking the minimum to learn the maximum? | Yes — prototype test before ML investment |

---

### Step 7 — Memory Updated

- **Roadmap update:** AI Smart Reply added to Now
- **Tracked metric:** Tickets resolved per agent per day
- **Risk logged:** GDPR/DPA exclusion for model context — confirm data residency rules with legal before launch
- **Open question:** Confidence threshold — needs calibration with ML team before beta
