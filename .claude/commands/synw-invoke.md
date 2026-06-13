# SYNTRAN Standard Invocation Template

Use this template to structure any task request to Claude within a SYNTRAN project.

```
Use [architect | python-engineer | security-reviewer].
Apply [develop | refactor | debug | review].
Relevant domains: [list relevant domain knowledge packs]
Task: [clear objective in one sentence]
Constraints: [list any hard constraints, e.g. no external deps, Windows-only, etc.]
```

**Agents:** architect · python-engineer · security-reviewer · technical-writer
**Skills:** develop · refactor · debug · review · document
**Projects:** winfoldershift · syntran-vscode

Run `/synw-agents`, `/synw-skills`, or `/synw-projects` for detailed listings.