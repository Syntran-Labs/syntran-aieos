# Approval Request Template

Use this format whenever a Sensitive or Critical action is required.
AI must stop, produce this, and wait for explicit human approval before proceeding.

---

## Template

```
Approval Required

Intent:
[what I intend to do — be specific]

Files impacted:
- [file path 1]
- [file path 2]

Reason:
[why this change is needed]

Risks:
- [risk 1]
- [risk 2]

Rollback:
[how to undo this change if something goes wrong]

Proceed?
```

---

## Rules

- Never proceed on a Sensitive or Critical action without this format being explicitly acknowledged
- If the human says "yes" or "proceed" without reading the risks, restate the risks once before executing
- If scope changes during execution, stop and re-request approval for the new scope
- Always confirm completion with a summary of what was actually changed
