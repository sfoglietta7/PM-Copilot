# PM Copilot — The AI-Native PM Operating System

**Product Faculty** • Trusted by 3,000+ product managers

PM Copilot is a comprehensive, framework-grounded AI partner for product managers. It combines deep PM expertise (Teresa Torres, Marty Cagan, Bob Moesta, April Dunford, Lenny Rachitsky, and others) with persistent memory, reusable skills, specialized sub-agents, and live tool integrations.

It turns your AI into a true senior PM teammate that knows your product, your stakeholders, your roadmap, and your working style — so you never have to re-brief it.

---

## Getting Started

PM-Copilot is maintained as a **separate open source project**. The easiest way for other teams to adopt it is:

1. Clone this repository:
   ```bash
   git clone <this-repo-url>
   cd pm-copilot
   ```

2. Run the interactive setup script:
   - **Windows**: `.\pm-copilot-setup.ps1`
   - **Linux / macOS / WSL**: `./pm-copilot-setup.sh`

3. The script will ask:
   - Which platform you want to install for (Rovo Dev or Grok)
   - The full path to your actual product working directory

4. It will copy the appropriate configuration (`.rovodev/` or `.grok/`) and guide you through initial setup.

**For Grok users**: The recommended installation method is the Grok plugin located in `plugins/grok-pm-copilot/`.

5. Start your AI tool inside your product directory and begin with:
   ```
   Run PM Copilot onboarding
   ```

The setup scripts include strong safety checks (they will not silently overwrite an existing configuration folder).

For full details, platform-specific notes, and the shared `AGENTS.md`, see the [`.rovodev/README.md`](.rovodev/README.md) and root `AGENTS.md`.

---

## Supported Platforms

PM Copilot is designed to work across multiple AI environments:

| Platform              | Support Level      | Key Features Available                          | Setup |
|-----------------------|--------------------|--------------------------------------------------|-------|
| **Rovo Dev** (Atlassian) | **Primary (Recommended for teams)** | Full skills, subagents, persistent memory via `AGENTS.md`, native Jira/Confluence context via Teamwork Graph, MCP tools | `.rovodev/` folder in repo |
| **Claude Code / Claude Cowork** | Full               | All 17 commands, 65+ skills, 8 sub-agents, MCP, `CLAUDE.md` global instructions | `claude plugin install` or via Cowork |
| **Claude.ai (Projects)** | Partial            | Skills + `CLAUDE.md` context work well. Slash commands and MCP require Claude Code/Cowork | Upload context files |
| Other agents (Cursor, Windsurf, etc.) | Community / Partial | Many skills and `AGENTS.md` patterns are portable | Manual adaptation |

**Best experience for teams**: Use the **Rovo Dev** version (this repo's `.rovodev/` folder). It gives you version-controlled PM tooling that travels with your codebase and leverages Atlassian's native context.

---

## What's Inside

- **65+ PM Skills** across Discovery, Strategy, Execution, Metrics, GTM, AI Evals, Prototyping, and Career.
- **17 High-Level Workflows** (treated as skills in Rovo Dev).
- **8 Specialized Sub-Agents** (Discovery Researcher, Strategy Analyst, Document Writer, etc.).
- **Persistent Memory** — Never re-explain your product, stakeholders, or roadmap.
- **Framework-Rich** — Real methodologies, not generic advice (OST, JTBD, 7 Powers, Pyramid Principle, etc.).
- **Tool Integrations** via MCP (Linear, Jira, Notion, Slack, GitHub) + native Atlassian context in Rovo Dev.

---

## Quick Start

### For Rovo Dev Users (Recommended)

PM-Copilot is designed to be used as a **separate repository**. The easiest way for teams to adopt it is:

1. Clone this repository.
2. Run the setup script from inside the `pm-copilot` folder:
   - Windows: `.\pm-copilot-setup.ps1`
   - Linux/macOS: `./pm-copilot-setup.sh`
3. The script will ask you for the path to your actual product project and copy the configuration there.
4. Start Rovo Dev inside your product project and say: "Run PM Copilot onboarding"

This keeps PM-Copilot clean as an open source project while making adoption simple for other companies.

See [`.rovodev/README.md`](.rovodev/README.md) for the full recommended workflow and cross-platform notes.

### For Claude Users

See the `claude/` directory for the original Claude-optimized version (with `CLAUDE.md`, slash commands, and `.claude-plugin/` manifest).

---

## Project Structure (Rovo Dev Focus)

```
pm-copilot/
├── .rovodev/                  # Rovo Dev configuration (this is the main distribution)
│   ├── AGENTS.md              # Global instructions + session protocols
│   ├── config.yml             # Model, tool permissions, additional prompt
│   ├── mcp.json               # External MCP tool connections
│   ├── skills/                # 65+ reusable PM skills
│   ├── subagents/             # 8 specialized agents
│   ├── context/               # Your product/company context (fill these in)
│   ├── memory/                # Memory schema + guidance
│   └── README.md              # Rovo Dev specific guide
│
├── claude/                    # Original Claude plugin version (for Claude Code / Cowork)
│   ├── CLAUDE.md
│   ├── commands/
│   ├── agents/
│   ├── skills/
│   └── ...
│
├── README.md                  # This file
└── LICENSE
```

---

## Philosophy

PM Copilot exists because most AI assistants are generic. Great product work requires **context, rigor, and taste**. This system encodes the best frameworks in the industry and makes them available on demand with your specific product memory.

Every output is required to meet a high quality bar:
- Ends with *"Did we solve the right problem?"*
- Includes explicit out-of-scope items
- Surfaces surprising failure modes
- Defines 30-day measurable success metrics

---

## License

Apache 2.0 — free to use and modify.

Built by **Product Faculty** — the leading AI PM certification program.

---

*PM Copilot v2.1 • Supports Rovo Dev + Claude ecosystems*