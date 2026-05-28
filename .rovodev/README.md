# PM Copilot for Rovo Dev

**Rovo Dev optimized distribution** of the AI-Native PM Operating System.

This folder (` .rovodev/ `) contains everything Rovo Dev needs to turn the agent into a senior product management partner.

---

## How Rovo Dev Loads PM Copilot

Rovo Dev automatically discovers and uses:

- **`.rovodev/AGENTS.md`** — Global instructions, session protocols, quality bar, and memory rules. This is the heart of the system.
- **`.rovodev/skills/`** — 65+ atomic PM skills. These are auto-loaded based on their `description` or invoked by name.
- **`.rovodev/subagents/`** — 8 specialized sub-agents for complex, multi-step work (discovery, strategy, docs, etc.).
- **`.rovodev/context/`** — Your product and company context (highly recommended to fill in).
- **`.rovodev/memory/`** — Schema and guidance for persistent memory.

Rovo Dev's native memory system (`/memory`, `/memory reflect`, `AGENTS.md`) works alongside the traditional file-based `memory/user-profile.md` approach.

---

## Project Scope vs User Scope (Very Important)

Rovo Dev supports two installation locations. Understanding the difference is critical.

### 1. Project Scope (Recommended for PM Copilot)
**Location:** `.rovodev/` folder **inside your repository** (current design)

**Best for:**
- Teams
- Version control
- Product-specific context (roadmap, personas, stakeholders, memory profile)
- Sharing the full "PM operating system"

**Advantages:**
- Everyone on the team gets the exact same tools when they open the repo.
- Context files stay with the project they belong to.
- You can have different PM Copilot configurations per product/repo.

### 2. User Scope (Global / Personal)
**Location:** `~/.rovodev/` in your home directory

**Best for:**
- Personal skills or subagents you want available in *every* project.
- Global preferences.
- Tools you use across many different codebases.

**Downsides if you copy the entire PM Copilot here:**
- Loses team sharing (everyone has to manually copy files).
- Product-specific files (your roadmap, stakeholders, memory profile) would apply globally — usually not what you want.
- Running `/memory init` at user scope analyzes the current directory and can create messy global memory.

### Direct Answer to Your Question

**No — it is usually not better** to copy the entire `.rovodev` directory to `/home/username/` (i.e. `~/.rovodev`).

**Recommended approach:**

| Goal                              | Recommended Action |
|-----------------------------------|--------------------|
| Use with a **team**               | Keep `.rovodev/` in the repo root (current structure). Use the `pm-copilot-setup` scripts. |
| Use **personally across all projects** | Selectively copy only `skills/` and `subagents/` to `~/.rovodev/`. Keep `context/`, `memory/`, and `AGENTS.md` at project level. |
| Quick personal experiment         | You *can* copy everything to `~/.rovodev/`, but expect to clean up context/memory later. |

The setup scripts (`pm-copilot-setup.ps1` and `pm-copilot-setup.sh`) already support the smart hybrid pattern: they run project memory init by default and *optionally* copy only skills/subagents to your user folder.

---

## Quick Start for Other Teams / Companies

Because PM-Copilot is maintained as a **separate repository**, the recommended way to use it is with the setup scripts.

### Recommended Workflow (Easiest for Most People)

1. **Clone the PM-Copilot repository**
   ```bash
   git clone https://github.com/your-org/pm-copilot.git
   cd pm-copilot
   ```

2. **Run the setup script from inside the PM-Copilot folder**
   ```powershell
   # Windows
   .\pm-copilot-setup.ps1
   ```

   ```bash
   # Linux / macOS / WSL
   chmod +x pm-copilot-setup.sh
   ./pm-copilot-setup.sh
   ```

3. **The script will ask you**:
   - The full path to the project directory where you actually do your work (your real product repo).
   - Whether you want to also install some skills globally to `~/.rovodev/`.

4. The script will:
   - Copy the `.rovodev` folder into your chosen project directory.
   - Change into that directory.
   - Guide you through running `/memory init`.
   - Offer to install user-level skills.

5. **Start using it**
   ```bash
   acli rovodev run
   ```
   Then inside Rovo Dev say:
   ```
   Run PM Copilot onboarding
   ```

This approach keeps PM-Copilot as a clean, separate open source project while still making it very easy for other teams to adopt.

---

## Key Files

| File | Purpose |
|------|---------|
| `AGENTS.md` | Core system prompt. Contains session start protocol, memory rules, quality bar, gossip mode, and framework defaults. Edit this to change global behavior. |
| `config.yml` | Rovo Dev settings (model, temperature, tool permissions, additionalSystemPrompt). |
| `mcp.json` | Connections to Linear, Jira, Notion, Slack, GitHub (optional but powerful). |
| `skills/` | Reusable PM expertise. Most skills fire automatically when relevant. |
| `subagents/` | Focused specialist agents for heavy lifting. Invoke by name ("Use the discovery-researcher subagent..."). |
| `context/` | Fill these with your real product/company information for best results. |

---

## Memory Strategy (Important)

PM Copilot supports two complementary memory approaches in Rovo Dev:

1. **Native Rovo Memory** (`AGENTS.md` + `/memory reflect`)
   - Use Rovo's built-in commands for project and user memory.
   - Great for code-related and project-specific context.

2. **PM Copilot Structured Memory** (`memory/user-profile.md`)
   - Preserves the rich PM-specific schema (stakeholders, roadmap state, tracked risks, lessons learned, etc.).
   - The `skills/memory/SKILL.md` skill knows how to read/write this file.

**Recommended**: Use both. Let Rovo manage general project memory while the dedicated `memory` skill manages the detailed PM profile.

---

## Tool Permissions (Cross-Platform Notes)

Rovo Dev is stricter than Claude by default. Review and tune `.rovodev/config.yml` → `toolPermissions` for a smooth PM workflow.

**Recommended settings:**
- Allow read operations (`open_files`, `grep`, `getJiraIssue`) by default.
- Set write operations to `ask` (or `allow` in trusted environments).

### Windows (PowerShell) vs Linux/macOS (bash)

- On **Windows**, Rovo Dev primarily uses **PowerShell**. The `powershell:` section in `config.yml` controls permissions for common safe commands (`Get-ChildItem`, `Get-Content`, `git`, etc.).
- On **Linux and macOS**, the `bash:` section applies.

Both sections are pre-configured in this repo with safe read + git commands allowed. You can customize them independently.

You can also use `--yolo` mode for fully autonomous sessions (use with caution).

---

## Windows + Linux / macOS Compatibility

PM Copilot for Rovo Dev is designed to work on both **Windows (PowerShell)** and **Ubuntu/Linux** (as well as macOS).

### What works out of the box
- All skills, subagents, `AGENTS.md`, and context templates are platform-agnostic.
- Rovo Dev CLI (`acli rovodev`) is cross-platform.
- Path references in docs use forward slashes (`.rovodev/context/...`), which Rovo Dev normalizes on all operating systems.
- MCP servers (via `npx`) work on Windows, Linux, and macOS.

### Recommended setup per OS

| OS              | Recommended Shell     | Key Config File Section | Setup Command                  |
|-----------------|-----------------------|--------------------------|--------------------------------|
| Windows         | PowerShell            | `powershell:` in `config.yml` | `acli rovodev run`            |
| Ubuntu / Linux  | bash or zsh           | `bash:` in `config.yml`       | `acli rovodev run`            |
| macOS           | zsh (default)         | `bash:` in `config.yml`       | `acli rovodev run`            |

### Setup Scripts (Recommended for Adoption)

This repository includes ready-to-use interactive setup scripts in the root:

- `pm-copilot-setup.ps1` — Windows (PowerShell)
- `pm-copilot-setup.sh` — Linux, macOS, and WSL

These scripts are the easiest way for other teams to adopt PM-Copilot. They will:
- Ask you for the path to your actual product project
- Copy the `.rovodev` configuration there
- Guide you through `/memory init`
- Optionally install skills at user level (`~/.rovodev/`)

See the **Quick Start for Other Teams** section at the top of this file for the recommended adoption flow.

---

## Distribution to Your Team

The recommended way to share PM Copilot across a team:

- **Commit `.rovodev/` to your repository** (or a dedicated internal repo).
- Everyone on the team gets the same skills, subagents, and context templates automatically.
- Use the provided `pm-copilot-setup.ps1` (Windows) or `pm-copilot-setup.sh` (Linux/macOS) scripts in the repo root. These run `/memory init` and offer to install user-level skills.

For broader access (non-dev stakeholders), also publish a version as a **Rovo Agent** in Rovo Studio using the content from `AGENTS.md` and key skills as knowledge sources.

---

## Differences from the Claude Version

- Commands are implemented as high-quality skills (invoked by name or natural language).
- `CLAUDE.md` → `AGENTS.md` (with automatic migration support via `/memory init`).
- Stronger native Jira + Confluence context via Atlassian's Teamwork Graph.
- Subagents use Rovo Dev's exact frontmatter format.
- Tool names and permissions are Rovo-specific.

---

## Quality Bar (Non-Negotiable)

Every significant output must:
- End with the question: *"Did we solve the right problem?"*
- Explicitly call out what is out of scope
- Surface at least one failure mode that would surprise a junior PM
- Define success metrics measurable within 30 days
- Carry unresolved open questions forward into memory

---

## Getting Help

- Inside Rovo Dev: Ask "Show me available PM Copilot skills" or "List PM subagents".
- Use `/skills` and `/subagents` Rovo Dev commands to explore.
- For the original Claude-optimized version, see the `claude/` directory at the repo root.

---

**PM Copilot for Rovo Dev** • Product Faculty • Apache 2.0

*Stop working like a 2022 PM. Operate like an AI-native one.*