# Security Policy

## What the Governance Model Is

SYNTRAN AIEOS implements a **behavioral governance model** — a set of explicit rules, action classifications, and approval gates that Claude Code is instructed to follow.

The governance model works through instruction, not technical sandboxing.

---

## What the Governance Model Is Not

This is not a security sandbox. Claude Code itself is not technically constrained from taking actions outside its defined boundaries — the behavioral contract relies on the model following its instructions, which it generally does but is not guaranteed to do in all cases or prompt conditions.

**Do not rely on SYNTRAN AIEOS as a security control in production environments where:**
- Strict access separation is required
- Regulatory compliance demands technical enforcement (not behavioral instruction)
- Untrusted users interact with the same Claude Code session
- Critical infrastructure or customer data is at risk

---

## Intended Threat Model

SYNTRAN AIEOS is appropriate for:
- Solo developers and small teams using Claude Code for personal or commercial development
- Environments where the human operator controls the Claude Code session
- Situations where the goal is consistent, traceable, auditable AI-assisted development
- Prevention of accidental mistakes (silent code rewrites, unintended deployments, credential exposure) by a cooperative AI model

It is not appropriate as the sole control for adversarial scenarios or multi-user shared Claude Code deployments without additional access controls.

---

## Credential and Secret Handling

Never commit credentials, API keys, tokens, or secrets to this repository or to any project profile.

The `.gitignore` excludes:
- `.env` and `.env.*` files
- `*.key`, `*.pem`, `*.p12`
- `service-account*.json`, `credentials*.json`, `token*.json`
- `.claude/settings.json` and `.claude/settings.local.json` (may contain local hook paths)
- `telemetry/usage.csv` (contains session data)

If you discover that sensitive information was accidentally committed to your fork, treat it as exposed and rotate the affected credentials immediately.

---

## Reporting Issues

For issues with the governance model design, agent definitions, or security-relevant documentation:

Open a GitHub issue describing the concern. Do not include any credentials, personal data, or production system details in issue reports.

---

## Scope of v1

v1 is Claude Code-first and Windows-first. The governance model has been designed and tested in that context. Behavior on other platforms or with other AI runtimes is untested and not guaranteed.
