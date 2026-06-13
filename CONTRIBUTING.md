# Contributing to SYNTRAN AIEOS

SYNTRAN AIEOS is a personal engineering operating system. Contributions are welcome for:

- Bug reports and corrections in agent/skill/governance definitions
- New agent or skill definitions that follow the standard contract format
- New domain packs for areas not yet covered
- Example project profiles
- Documentation improvements

---

## What a Contribution Is Not

- Changes to the governance model's core principles (these are by design)
- Project-specific content (keep project profiles in your own fork or private copy)
- Credentials, API keys, local paths, or personal configuration

---

## Standard Contract Format

Every agent must define: Mission, Scope, When to use, When NOT to use, Required inputs, Output contract, Risk boundaries, Escalation boundaries, Anti-patterns, Example invocation.

Every skill must define: Purpose, Scope, Inputs required, Preconditions, Execution workflow, Validation expectations, Output contract, Escalation boundaries, Anti-patterns.

See existing files in `agents/` and `skills/` for reference.

---

## Process

1. Fork the repo
2. Create a branch: `feat/your-agent-name` or `fix/description`
3. Follow the existing file structure and naming conventions
4. Open a pull request with a clear description of what was added and why

---

## Code of Conduct

Be direct, be specific, be honest about limitations. The same principles that govern AI behavior in this system apply to contributions: surface risks, declare assumptions, don't make silent changes.
