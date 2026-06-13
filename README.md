# SyntranAI AIEOS

> An AI Engineering Operating System — not a prompt collection.

SYNTRAN turns Claude Code into a **governed implementation partner**: consistent roles, repeatable workflows, explicit permission boundaries, and a self-measuring telemetry layer. Every session starts from the same behavioral baseline. Every action is traceable. Every sensitive change requires approval.

---

## The Problem With Raw Claude Code

An unconfigured Claude Code session is powerful but stateless from a behavioral standpoint:

- No consistent definition of what Claude *should* and *should not* do
- No repeatable workflows — quality depends on how well you phrase each prompt
- No permission model — nothing stops Claude from silently modifying production configs
- No traceability — you can't measure whether structured prompting actually helps
- Every project starts from scratch

SYNTRAN solves all four.

---

## Who Is This For?

- Solo technical leads and senior engineers who use Claude Code across multiple projects
- AI engineers who want repeatable, traceable workflows instead of ad-hoc prompting
- Anyone building production systems with Claude Code who wants governance from day one
- Teams who need to explain and audit what their AI assistant was asked to do

---

## Architecture

SYNTRAN maps directly onto OS concepts. Claude Code is the runtime. SYNTRAN is what runs on it.

| OS Concept | SYNTRAN Equivalent | Location |
|---|---|---|
| **Kernel** *(governance layer)* | Governance model — defines and enforces all safety rules through behavioral instruction | `CLAUDE.md` + `governance/` |
| **Processes** | Agents — specialist execution contexts with defined output contracts | `agents/` |
| **System calls** | Skills — standardized operation contracts with explicit workflows | `skills/` |
| **Device drivers** | Domains — area-specific knowledge packs (facts, config, constraints) | `domains/` |
| **Applications** | Projects — tenant workloads that inherit all OS-level rules | `projects/` |
| **Boot sequence** | `CLAUDE.md` auto-loads at every session start | Always |
| **Process monitor** | Telemetry — hooks that log every prompt, command, and token count | `telemetry/` |
| **Execution engine** | Claude Code | Runtime (not the OS itself) |

---

## Quick Start

The framework itself requires no installation — it is Markdown files, nothing to package or deploy. Runtime dependencies are listed below.

**Runtime dependencies:**
- VSCode with the Claude Code extension
- PowerShell 5.1 (telemetry hooks — Windows built-in)
- Ollama (optional, for local inference)

```
1. Clone or download this repo and open syntran-aieos/ in VSCode with the Claude Code extension.
2. CLAUDE.md loads automatically — governance is active from the first message.
3. Type /synw- in the chat input to browse available agents and skills.
```

**First invocation:**

```
Use python-engineer.
Apply develop.
Relevant domains: local-inference
Task: Write a script that calls Ollama to summarize a text file.
Constraints: llama3.2:3b, no external dependencies beyond requests, Python 3.11+
```

Claude will restate the objective, declare assumptions, design the approach, implement, and produce a completion summary — in that order, every time.

---

## Governance

Governance is the kernel. It is always active and never needs to be invoked. Every action is classified before execution:

| Category | Examples | Gate |
|---|---|---|
| **Safe** | Reading, analyzing, proposing, drafting, documenting | Proceed |
| **Moderate** | Creating files, scaffolding, config templates, adding tests | Declare plan → proceed |
| **Sensitive** | Modifying existing code, schemas, pipelines, auth flows | Explicit approval required |
| **Critical** | Credentials, production configs, IAM, DB operations, deployments | Explicit approval required |
| **Forbidden** | Deploy to prod, rotate secrets, delete prod data, disable security | Never |

When a Sensitive or Critical action is required, Claude stops and issues a structured approval request:

```
Approval Required

Intent:     [what Claude intends to do]
Files:      [list of files impacted]
Reason:     [why this is necessary]
Risks:      [what could go wrong]
Rollback:   [how to undo]

Proceed?
```

Claude is instructed to halt at this gate pending explicit approval. This is behavioral contract, not hard enforcement — the governance model works through instruction, not sandboxing. See [`SECURITY.md`](SECURITY.md) for the full scope and limits of this model.

---

## Agents

Agents define *who* handles the task — role, focus, output contract, and escalation boundaries.

| Agent | Best For | Slash Command |
|---|---|---|
| **Architect** | Solution design, tradeoff analysis, system decomposition | `/synw-agent-architect` |
| **Python Engineer** | Implementation, refactoring, testing, pipelines | `/synw-agent-python-engineer` |
| **Security Reviewer** | Risk identification, vulnerability surfacing, auth review | `/synw-agent-security-reviewer` |
| **Technical Writer** | Guides, references, explanations, ADRs, READMEs | `/synw-agent-technical-writer` |
| **Test Strategy Lead** | Risk-based test planning, release quality gates | `/synw-agent-test-strategy-lead` |
| **Test Automation Engineer** | Automated test design, fixtures, component/integration/E2E | `/synw-agent-test-automation-engineer` |
| **Release Test Manager** | Release validation coordination, go/no-go recommendations | `/synw-agent-release-test-manager` |

Definitions: [`agents/`](agents/)

---

## Skills

Skills define *how* the task is executed — the exact workflow, validation expectations, and when to stop and escalate.

| Skill | Best For | Slash Command |
|---|---|---|
| **Develop** | New features, modules, scripts, integrations | `/synw-skill-develop` |
| **Refactor** | Restructuring existing code without behavior change | `/synw-skill-refactor` |
| **Debug** | Systematic root-cause diagnosis and fix | `/synw-skill-debug` |
| **Review** | Code, architecture, and documentation review | `/synw-skill-review` |
| **Document** | Typed documentation production (Tutorial / How-to / Reference / Explanation) | `/synw-skill-document` |
| **Test Plan** | Test strategy, risk mapping, coverage model, release gates | `/synw-skill-test-plan` |
| **E2E Regression** | End-to-end regression test design | `/synw-skill-e2e-regression-testing` |
| **Release Validation** | Release readiness evidence and approval checklist | `/synw-skill-release-validation` |

Definitions: [`skills/`](skills/)

---

## Testing Team

Nine specialist testing agents, ten testing skills, five domain packs, six templates, and two governance documents for quality-gated delivery.

| Role | Best For | Slash Command |
|---|---|---|
| **Test Strategy Lead** | Test planning, risk mapping, quality gates | `/synw-agent-test-strategy-lead` |
| **Test Automation Engineer** | Unit / component / integration / E2E test design and code | `/synw-agent-test-automation-engineer` |
| **QA Functional Analyst** | Functional verification, acceptance criteria | *(direct invocation)* |
| **API Contract Tester** | API contract and schema validation | *(direct invocation)* |
| **Security Test Reviewer** | Security-focused test design | *(direct invocation)* |
| **Performance & Reliability Tester** | Load, latency, failure mode tests | *(direct invocation)* |
| **Data Quality Tester** | Data pipeline and AI output validation | *(direct invocation)* |
| **Accessibility & UX Tester** | WCAG, usability, interaction coverage | *(direct invocation)* |
| **Release Test Manager** | Release validation coordination, go/no-go recommendations | `/synw-agent-release-test-manager` |
| **Testing Assessment** | Full project testing maturity and risk assessment | `/synw-test-assessment` |

All testing agents operate under the existing Safe / Moderate / Sensitive / Critical / Forbidden model. No additional permissions are granted. Creating test files is Moderate. Modifying production code, auth, schemas, or CI/CD is Sensitive or Critical.

Governance: [`governance/testing-approval-boundaries.md`](governance/testing-approval-boundaries.md) · [`governance/testing-risk-matrix.md`](governance/testing-risk-matrix.md)
Templates: [`templates/testing/`](templates/testing/)

---

## Domains

Domains are knowledge packs — area-specific facts, constraints, and configuration. Always declare domains explicitly in invocations for deterministic behavior; relying on inference introduces unpredictability.

| Domain | Contents |
|---|---|
| [`local-inference`](domains/local-inference/) | Ollama endpoint, hardware guidance, model inventory, routing rules |
| [`documentation`](domains/documentation/) | Diátaxis document type taxonomy, project style guide |
| [`testing-framework`](domains/testing-framework/) | Core testing concepts, level taxonomy, coverage model |
| [`frontend-react-testing`](domains/frontend-react-testing/) | React component and UI testing patterns |
| [`backend-api-testing`](domains/backend-api-testing/) | API contract, integration, and negative test patterns |
| [`data-ai-testing`](domains/data-ai-testing/) | RAG/AI output validation, data quality checks |
| [`release-governance`](domains/release-governance/) | Release decision rules, go/no-go criteria |

---

## Projects

Projects are OS tenants. Each inherits the full governance model and adds its own stack, constraints, and agent/skill recommendations.

| Project | Purpose |
|---|---|
| [**WinFolderShift**](projects/winfoldershift/) | Relocate Windows shell folders (Downloads, Documents) from C to a secondary drive via registry redirection |
| [**syntran-vscode**](projects/syntran-vscode/) | VSCode extension — agent/skill browser, invocation builder, live telemetry dashboard for Claude Code |

To add a new project: create a `profile.md` under `projects/<name>/` following the pattern in [`examples/projects/_template/`](examples/projects/_template/).

Example profiles are available in [`examples/projects/`](examples/projects/).

---

## Inference Routing

SYNTRAN runs two inference backends. The routing decision is a data sensitivity and task complexity call — not a cost optimization.

| Backend | Endpoint | Model | Use When |
|---|---|---|---|
| **Local (Ollama)** | `http://localhost:11434` | `llama3.2:3b` | Patient data, credentials, confidential context, or offline |
| **Cloud (Claude)** | Anthropic API | `claude-sonnet-4-6` | Architecture, security, multi-file reasoning, final output |

> **Important:** `llama3.2:3b` is for low-risk work — summarization, classification, formatting, and private-context triage. It is not the final authority for architecture decisions, security reviews, or complex multi-file reasoning. Those always route to cloud.

Full routing rules: [`domains/local-inference/routing-guide.md`](domains/local-inference/routing-guide.md)

---

## Telemetry

SYNTRAN measures itself. Three Claude Code hooks fire automatically — no manual instrumentation needed.

| Hook | Fires When | Logs |
|---|---|---|
| `UserPromptSubmit` | Every user message | Session ID, timestamp, project |
| `PostToolUse (Skill)` | Any agent or skill is invoked | Session ID, command name |
| `Stop` | Claude finishes responding | Input tokens, output tokens, framework token estimate |

**CSV schema:** `telemetry/usage.csv`

```
session_id, timestamp, user, project, event_type, command, input_tokens, output_tokens, framework_tokens
```

**KPIs:**

```
Command adoption rate     = sessions with ≥1 COMMAND row / total PROMPT sessions
Framework overhead ratio  = framework_tokens / input_tokens
Cost per command          = (input_tokens × price) / commands_used
```

`framework_tokens` is an **estimated context footprint** — computed at Stop time by scanning all `.md` files in `agents/`, `skills/`, `domains/`, `governance/`, and `projects/` and dividing character count by 4. This measures possible context size, not exact injected tokens. Use it as a relative heuristic, not an absolute cost figure.

**Setup:** Copy `.claude/settings.json.template` to `.claude/settings.json` and update the hook paths to match your local installation. See [`docs/setup/`](docs/setup/).

---

## Workspace Structure

```
syntran-aieos/
├── CLAUDE.md              ← Kernel: OS instructions, loaded every session
├── README.md              ← This file
├── CHANGELOG.md           ← Version history
├── CONTRIBUTING.md        ← Contribution guidelines
├── SECURITY.md            ← Governance model scope and limits
├── LICENSE
├── governance/            ← Safety model, approval templates, operating procedures
├── agents/                ← Specialist role contracts
├── skills/                ← Execution workflow definitions
├── domains/               ← Domain knowledge packs
│   ├── local-inference/   ← Ollama config, model guide, routing rules
│   ├── documentation/     ← Style guide, Diátaxis taxonomy
│   ├── testing-framework/ ← Core testing concepts, level taxonomy
│   ├── frontend-react-testing/
│   ├── backend-api-testing/
│   ├── data-ai-testing/
│   └── release-governance/
├── projects/              ← Tenant project profiles
│   ├── winfoldershift/
│   └── syntran-vscode/
├── examples/
│   └── projects/          ← Example and template project profiles
│       ├── _template/     ← Blank scaffold for a new project
│       ├── etl-pipeline/  ← Example: data pipeline project
│       └── api-service/   ← Example: API service project
├── scripts/
│   ├── sync-global-commands.ps1  ← Propagates synw-* commands to ~/.claude/commands/
│   ├── scaffold-testing-team.ps1 ← Installs testing team pack into a framework folder
│   ├── test_ollama.py             ← Smoke test for local Ollama inference
│   └── telemetry/         ← Hook scripts (log_prompt.ps1, log_command.ps1, log_stop.ps1)
├── templates/             ← Reusable scaffolds
│   └── testing/           ← Test plan, test case, defect report, release checklist
└── docs/                  ← System-level documentation
```

---

## Scripts

Operational scripts live in [`scripts/`](scripts/).

| Script | Purpose | Docs |
|---|---|---|
| `sync-global-commands.ps1` | Copies all `synw-*` slash commands to `~/.claude/commands/` so they are available in every project | [`docs/setup/sync-global-commands.md`](docs/setup/sync-global-commands.md) |
| `scaffold-testing-team.ps1` | Copies testing team files into a target framework folder | — |
| `test_ollama.py` | Health check and smoke test for local Ollama inference | — |
| `telemetry/log_prompt.ps1` | Hook: logs every user message to `telemetry/usage.csv` | — |
| `telemetry/log_command.ps1` | Hook: logs every agent/skill invocation | — |
| `telemetry/log_stop.ps1` | Hook: logs token counts at session end | — |

**Run after any command update:**

```powershell
& ".\scripts\sync-global-commands.ps1"
```

---

## What Claude Cannot Do Autonomously

These are hard stops — no governance category overrides them:

- Deploy anything to any environment
- Create, rotate, or store secrets
- Delete files without explicit approval
- Modify auth or permission models silently
- Push to remote repositories without explicit instruction
- Execute any destructive workflow

---

## Roadmap

| Item | Priority | Notes |
|---|---|---|
| `examples/projects/_template/` | Done | Blank scaffold for new project onboarding |
| License | Done | MIT |
| Contribution guidelines | Done | Framework grows with owner's projects |
| Changelog | Done | Start when v1.0 is declared |
| LiteLLM routing layer | Low | Phase 2 — unified proxy for local/cloud |
| Additional agents | Backlog | Data Engineer, Cloud Engineer candidates |

---

## Runtime

**v1 is Claude-first.** Claude Code is the designed and tested execution engine. The inference routing layer (Ollama + Claude API) is already in place as a foundation, but multi-runtime support is a Phase 2 concern. Don't generalize prematurely — make v1 work well before abstracting the runtime.

---

*Platform: Windows-first · Runtime: Claude Code (v1) · Governed by [`CLAUDE.md`](CLAUDE.md)*
