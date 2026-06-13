# Changelog

All notable changes to SYNTRAN AIEOS are documented here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [1.0.0] — 2026-06-13

### Added

- Core governance model: Safe / Moderate / Sensitive / Critical / Forbidden action classification
- Structured approval gate format (Intent / Files / Reason / Risks / Rollback / Proceed?)
- Agent roster: Architect, Python Engineer, Security Reviewer, Technical Writer
- Testing team agents: Test Strategy Lead, Test Automation Engineer, QA Functional Analyst, API Contract Tester, Security Test Reviewer, Performance & Reliability Tester, Data Quality Tester, Accessibility & UX Tester, Release Test Manager
- Skill roster: Develop, Refactor, Debug, Review, Document, Test Plan, E2E Regression, Release Validation
- Testing skills: Unit Test Design, Component Test Design, Integration Test Design, API Contract Testing, Security Test, Performance Test, Data Quality Test
- Domain packs: local-inference, documentation, testing-framework, frontend-react-testing, backend-api-testing, data-ai-testing, release-governance
- Telemetry layer: three Claude Code hooks (UserPromptSubmit, PostToolUse, Stop) logging to usage.csv
- Telemetry KPIs: command adoption rate, framework overhead ratio, cost per command
- slash commands: /synw-agent-*, /synw-skill-*, /synw-invoke, /synw-agents, /synw-skills, /synw-test-assessment
- sync-global-commands.ps1: propagates synw-* commands to ~/.claude/commands/
- scaffold-testing-team.ps1: copies testing team pack into a framework folder
- test_ollama.py: smoke test for local Ollama inference
- Project profiles: WinFolderShift, syntran-vscode
- Example project profiles: _template, etl-pipeline, api-service
- Testing templates: test plan, test case, defect report, major release checklist, release test report, permission matrix
- Governance documents: testing-approval-boundaries, testing-risk-matrix
- Inference routing: dual-backend model (local Ollama + cloud Claude)
- Windows-first implementation (PowerShell 5.1, Claude Code extension)
