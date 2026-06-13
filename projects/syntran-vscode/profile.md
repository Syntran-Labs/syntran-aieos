# syntran-vscode

> VSCode extension that surfaces SyntranAI AIEOS workflows directly in the editor — agent/skill browser, invocation builder, live telemetry dashboard.

---

## Purpose

Standalone VSCode extension built as a portfolio prototype. Demonstrates how the SYNTRAN framework can be packaged for use by teams who do not interact with it through the CLI directly.

**Repo:** https://github.com/Syntran-Labs/syntran-vscode

---

## Stack

- TypeScript 5.4+
- VSCode Extension API (^1.85.0)
- esbuild — bundler
- @vscode/vsce — packaging
- GitHub Actions — CI (build + VSIX artifact)

---

## Architecture

```
src/
├── extension.ts              — activation, command registration
├── commands/                 — setup wizard, new project wizard
├── views/                    — tree providers (agents/skills, projects), telemetry webview
├── framework/                — framework reader, telemetry reader, invocation builder
└── utils/                    — file helpers, path resolution
framework/                    — bundled SYNTRAN snapshot (agents, skills, domains, governance, projects)
```

---

## Key Features (v0.1.0)

- **Agent & Skill browser** — sidebar tree view of all agents and skills
- **Invocation builder** — guided QuickPick wizard → clipboard (paste into Claude Code chat)
- **Telemetry dashboard** — live webview: KPIs, top commands, recent activity from usage.csv
- **New Project wizard** — scaffolds profile.md in 4 steps
- **Setup wizard** — configure local framework path or use bundled snapshot

---

## Constraints

- Windows-first development (matches framework platform)
- No network calls — reads local filesystem only
- No Python dependency — pure TypeScript/Node.js
- Bundled framework snapshot must be updated manually when framework evolves

---

## Recommended Agents

- Architect — feature design, extension API decisions
- Python Engineer — any automation scripts supporting the extension

## Recommended Skills

- Develop — new features (new views, commands, wizards)
- Refactor — TypeScript cleanup
- Review — before any push to the public repo

---

## Governance Notes

This project inherits all SYNTRAN governance rules from CLAUDE.md.
Public GitHub repo — no credentials, no user data, no telemetry uploaded. All data remains local.
