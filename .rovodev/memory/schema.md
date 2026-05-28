# PM Copilot Memory Schema (Rovo Dev)

This defines the structure of `.rovodev/memory/user-profile.md`.

Every field is optional — the system works with whatever is filled in and grows over time.

## Schema

```yaml
last_updated: ISO date (YYYY-MM-DD)

product_name:
product_stage:          # idea / pre-launch / early / growth / scale
core_user_problem:
business_model:
current_bets:
product_url:

stack:
  issue_tracker:        # Linear / Jira / ...
  docs_tool:
  comms_tool:
  analytics_tool:
  design_tool:
  code_repo:

working_style:
  prd_format_preference:
  verbosity:
  preferred_frameworks:
  avoid:

stakeholders:
  # - name:
  #   role:
  #   comms_style:
  #   sensitivities:
  #   last_contact:

roadmap_state:
  now: []
  next: []
  later: []
  decided_and_why: []

open_questions:
  # - [question] — flagged [date] — owner: [name]

tracked_risks:
  # - [risk] — flagged [date] — status: open/resolved — resolution: [note]

lessons_learned:
  # - [initiative] — [lesson] — [date]
```

## Update Rules

- Always set `last_updated`.
- Date every new open question, risk, and lesson.
- Resolve — do not delete — risks and questions.
- Review open_questions >14 days old and risks >7 days old on session start.

## Recommended Usage in Rovo Dev

Use the `memory` skill (in `.rovodev/skills/memory/`) to manage this file in combination with Rovo's native `/memory reflect` command.