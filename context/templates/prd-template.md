# PRD: [Feature Name]

**Author:** [Name]
**Date:** [YYYY-MM-DD]
**Status:** Draft / In Review / Approved
**OKR Link:** [Which OKR does this serve?]

---

## Problem

[2–3 sentences: what is broken, who is affected, and the cost of not solving it. Be specific — name the user segment, quantify the pain where possible.]

---

## Users

**Primary user:** [Persona name] — [one sentence on why they're most affected]

**Secondary user:** [Persona name] — [one sentence on how they also benefit]

**User Stories:**

- As a [primary user], I want to [action], so that [outcome].
- As a [primary user], I want to [action], so that [outcome].
- As a [secondary user], I want to [action], so that [outcome].

---

## Solution

**What we're building:**
[Concrete description of the solution mechanic. What does the user actually do? What does the system do?]

**Explicitly out of scope:**
- [Thing that sounds related but isn't in this version]
- [Thing users will ask for that we're deferring]

---

## Key Flows

**Flow 1 — [Happy path name]:**
1. User [action]
2. System [response]
3. User [action]
4. System [response]
5. User achieves [outcome]

**Flow 2 — [Second key flow]:**
1. [Step]
2. [Step]
3. [Outcome]

---

## System Architecture *(AI/ML features only)*

**Model:** [Which model tier and why — e.g. claude-sonnet-4-6 for latency/quality balance]
**Input:** [What goes in — structured data, user text, retrieved context?]
**Output:** [What comes out — structured JSON, freetext, action?]
**Retrieval layer:** [RAG / file read / database lookup / none]
**Latency target:** [e.g. < 2s P95]
**Fallback behavior:** [What happens when the model fails or returns low-confidence output?]
**Evaluation framework:** [How will model quality be measured? What's the bar to ship?]
**AI-specific failure modes:**
- Hallucination: [How will we detect and surface this?]
- Latency spike: [What happens to UX?]
- Cost overrun: [Budget guard and alerting approach]

---

## Acceptance Criteria

- [ ] [Binary, testable criterion 1 — QA can verify this in isolation]
- [ ] [Binary, testable criterion 2]
- [ ] [Binary, testable criterion 3]
- [ ] [Binary, testable criterion 4]
- [ ] [Binary, testable criterion 5]

---

## Edge Cases & Failure Modes

| Scenario | Expected Behavior |
|---|---|
| [Scenario 1 — e.g. user submits empty input] | [What system does] |
| [Scenario 2 — e.g. network timeout during processing] | [What system does] |
| [Scenario 3 — e.g. data missing for required field] | [What system does] |

---

## Success Metrics

| Metric | Baseline | Target | Timeframe | Measurement Method |
|---|---|---|---|---|
| [Outcome metric — e.g. 7-day retention] | [Current value] | [Goal] | [e.g. 30 days post-ship] | [How to measure] |
| [Usage metric] | [Baseline] | [Target] | [Timeframe] | [Method] |

---

## Open Questions

- [Question 1] — Owner: [Name or TBD] — Priority: [High/Medium/Low]
- [Question 2] — Owner: [Name or TBD] — Priority: [High/Medium/Low]

*Note: High-priority open questions block approval. Medium block launch. Low can ship with.*

---

## Dependencies & Risks

**Dependencies (must be true before shipping):**
- [Dependency 1 — internal or external]
- [Dependency 2]

**Risks:**
- [Risk 1] — Likelihood: [H/M/L] — Impact: [H/M/L] — Mitigation: [Plan]
- [Risk 2] — Likelihood: [H/M/L] — Impact: [H/M/L] — Mitigation: [Plan]

---

## Prototype-Ready Spec *(for v0 / Bolt / Lovable)*

> Drop this section into your vibe-coding tool to generate a working prototype.

Build a [happy path only] prototype of [feature name].

**User:** [Primary persona description in one sentence]
**Core interaction:** [One sentence on the main thing the user does]
**Key screens/states:**
1. [Screen 1] — [What it shows and does]
2. [Screen 2] — [What it shows and does]
3. [Outcome state] — [What success looks like]

**Do not build:** [List of things to exclude from prototype — complex states, edge cases, auth, etc.]
**Stack:** [e.g. React, no backend, use mock data]
**Design tokens:** [e.g. Tailwind, minimal styling, focus on flow not polish]
