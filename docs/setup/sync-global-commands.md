# How to Sync Global Slash Commands

**Type:** How-to
**Audience:** SYNTRAN framework maintainer
**Script:** [`scripts/sync-global-commands.ps1`](../../scripts/sync-global-commands.ps1)

---

## Problem

Claude Code loads custom slash commands from two locations:

| Location | Scope |
|---|---|
| `~/.claude/commands/` | Global — available in every project |
| `<project>/.claude/commands/` | Local — only available inside that project |

The SYNTRAN `synw-*` commands live in `syntran-aieos/.claude/commands/`. Without intervention, they are invisible when working in any other project.

---

## Solution

`sync-global-commands.ps1` copies all `synw-*.md` files from the local `.claude/commands/` directory to `~\.claude\commands\`, making them available globally across all projects.

The script is **safe to run repeatedly** — it uses MD5 hashing to skip files that have not changed.

---

## When to Run

Run this script after:

- Adding a new `synw-*` command to `.claude/commands/`
- Updating an existing command (agent, skill, project, etc.)
- Setting up Claude Code on a new machine

---

## Usage

Open PowerShell in the repo root and run:

```powershell
& ".\scripts\sync-global-commands.ps1"
```

No parameters required. No elevated privileges needed. The script uses `$PSScriptRoot` to locate the source directory automatically.

---

## Output Reference

```
[ ] Same:    synw-agent-architect.md        # File identical in both locations — skipped
[+] Added:   synw-skill-document.md        # New file — copied to global
[~] Updated: synw-skill-develop.md         # File changed — overwritten in global

Sync complete - Added: 1  Updated: 1  Unchanged: 19
Global commands dir: C:\Users\<username>\.claude\commands
```

| Indicator | Meaning |
|---|---|
| `[ ] Same` | MD5 hash matches — no action taken |
| `[+] Added` | File did not exist globally — copied |
| `[~] Updated` | File changed since last sync — overwritten |

---

## What Gets Synced

Only files matching `synw-*.md` are copied. No other files are touched.

Current synced commands:

| Command | Purpose |
|---|---|
| `/synw-agents` | Browse the agent roster |
| `/synw-skills` | Browse the skill roster |
| `/synw-invoke` | Standard invocation template |
| `/synw-agent-architect` | Activate Architect agent |
| `/synw-agent-python-engineer` | Activate Python Engineer agent |
| `/synw-agent-security-reviewer` | Activate Security Reviewer agent |
| `/synw-agent-technical-writer` | Activate Technical Writer agent |
| `/synw-agent-test-strategy-lead` | Activate Test Strategy Lead agent |
| `/synw-agent-test-automation-engineer` | Activate Test Automation Engineer agent |
| `/synw-agent-release-test-manager` | Activate Release Test Manager agent |
| `/synw-skill-develop` | Apply Develop skill |
| `/synw-skill-refactor` | Apply Refactor skill |
| `/synw-skill-debug` | Apply Debug skill |
| `/synw-skill-review` | Apply Review skill |
| `/synw-skill-document` | Apply Document skill |
| `/synw-skill-test-plan` | Apply Test Plan skill |
| `/synw-skill-e2e-regression-testing` | Apply E2E Regression skill |
| `/synw-skill-release-validation` | Apply Release Validation skill |
| `/synw-test-assessment` | Run testing maturity assessment |

---

## After Syncing

Restart the Claude Code session in the target project (close and reopen the conversation). The commands appear in the `/` autocomplete immediately.

---

## Troubleshooting

**Command still not visible after sync:**
Close and reopen the Claude Code conversation in the target project. The command list is loaded at session start.

**`Resolve-Path` error — source not found:**
Confirm the script is being run from the repo root with `& ".\scripts\sync-global-commands.ps1"`. The script uses `$PSScriptRoot` to locate the source. If you moved the script, update the `$src` path inside it.

**Access denied writing to `~/.claude/commands/`:**
Verify that `~\.claude\commands\` is not read-only. No admin rights are required for the user profile directory.
