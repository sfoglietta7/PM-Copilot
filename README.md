# PM Copilot — The AI-Native PM Operating System

> **Multi-platform support for Rovo Dev and Grok added by Steven Foglietta.**

**Product Faculty** • Trusted by 3,000+ product managers

PM Copilot is a comprehensive, framework-grounded AI partner for product managers. It combines deep PM expertise (Teresa Torres, Marty Cagan, Bob Moesta, April Dunford, Lenny Rachitsky, and others) with persistent memory, reusable skills, specialized sub-agents, and live tool integrations.

It turns your AI into a true senior PM teammate that knows your product, your stakeholders, your roadmap, and your working style — so you never have to re-brief it.

### Multi-Platform Support

PM Copilot was originally built for Claude. Support for **Rovo Dev** and **Grok** was added later while keeping the project as a clean, separate repository.

- **Rovo Dev**: Use the `.rovodev/` configuration
- **Grok**: Use the Grok plugin in `plugins/grok-pm-copilot/` (recommended) or the `.grok/` folder

The easiest way to install either is with the provided setup scripts:

- **Windows**: `.\pm-copilot-setup.ps1`
- **Linux / macOS / WSL**: `./pm-copilot-setup.sh`

These scripts will ask which platform you want and copy the correct files into your actual product project.

See the [`.rovodev/README.md`](.rovodev/README.md) for detailed platform-specific instructions.

---

### Original Claude Support

PM Copilot remains fully compatible with Claude environments:

## Supported Platforms

PM Copilot is designed to work across multiple AI environments:

| Platform              | Support Level      | Key Features Available                          | Setup |
|-----------------------|--------------------|--------------------------------------------------|-------|
| **Rovo Dev** (Atlassian) | **Primary (Recommended for teams)** | Full skills, subagents, persistent memory via `AGENTS.md`, native Jira/Confluence context via Teamwork Graph, MCP tools | `.rovodev/` folder in repo |
| **Claude Code / Claude Cowork** | Full               | All 17 commands, 65+ skills, 8 sub-agents, MCP, `CLAUDE.md` global instructions | `claude plugin install` or via Cowork |
| **Claude.ai (Projects)** | Partial            | Skills + `CLAUDE.md` context work well. Slash commands and MCP require Claude Code/Cowork | Upload context files |
| Other agents (Cursor, Windsurf, etc.) | Community / Partial | Many skills and `AGENTS.md` patterns are portable | Manual adaptation |

**Best experience for teams**: Use either the Rovo Dev version (`.rovodev/`) or the Grok plugin, depending on your primary AI tool. Both provide version-controlled PM tooling that travels with your codebase.

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

### For Rovo Dev and Grok Users

PM-Copilot is designed to be used as a **separate repository**. The easiest way for teams to adopt it is:

1. Clone this repository.
2. Run the setup script from inside the `pm-copilot` folder:
   - Windows: `.\pm-copilot-setup.ps1`
   - Linux/macOS: `./pm-copilot-setup.sh`
3. The script will ask you for the path to your actual product project and which platform you want to use.
4. Start your AI tool (Rovo Dev or Grok) inside your product project and say: "Run PM Copilot onboarding"

See [`.rovodev/README.md`](.rovodev/README.md) for the full recommended workflow and cross-platform notes.

### For Claude Users

See the `claude/` directory for the original Claude-optimized version (with `CLAUDE.md`, slash commands, and `.claude-plugin/` manifest).

---

## Working Across Multiple Projects

PM Copilot is designed to work cleanly across many different products and codebases.

### Core Principle

- **User-level installation** (Grok plugin or equivalent) installs the reusable skills and personas **once**. After that, they are available in every project.
- **Project-level configuration** (the `.grok/` or `.rovodev/` folder) holds the actual context and memory for that specific product. This stays isolated per project.

### Recommended Flow for a New Project

When you start working on a second, third, or fourth product:

1. Clone the new project.
2. Navigate into the **PM-Copilot** repository.
3. Run the setup script again:
   - Windows: `.\pm-copilot-setup.ps1`
   - Linux/macOS: `./pm-copilot-setup.sh`
4. Choose your platform (Grok or Rovo Dev).
5. When asked, select the **user-level** option for the plugin/skills (the script will detect that it is already installed and skip re-installation).
6. Point the script at your new project directory.

The script will create a fresh, isolated `.grok/` (or `.rovodev/`) folder inside the new project with its own context and memory profile. Your existing projects remain completely unaffected.

This approach keeps each product's context, roadmap, stakeholders, and memory cleanly separated while still giving you the full power of PM Copilot everywhere.

---

## Project Structure

```
pm-copilot/
├── .rovodev/                  # Rovo Dev configuration
│   ├── AGENTS.md
│   ├── skills/
│   ├── subagents/
│   ├── context/
│   ├── memory/
│   └── README.md
│
├── .grok/                     # Grok configuration (project-level)
│
├── plugins/grok-pm-copilot/   # Grok plugin (recommended install method for Grok)
│
├── claude/                    # Original Claude plugin version (for Claude Code / Cowork)
│   ├── CLAUDE.md
│   ├── commands/
│   ├── agents/
│   ├── skills/
│   └── ...
│
├── pm-copilot-setup.ps1
├── pm-copilot-setup.sh
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

*PM Copilot • Multi-platform support for Claude, Rovo Dev, and Grok*