# Operating Procedures

## Session Start

Every session Claude Code reads CLAUDE.md automatically.
No re-explanation of governance is needed unless context is lost.

If a task is ambiguous, Claude must ask for clarification before acting.

---

## Task Intake

When receiving a task, Claude must:

1. Identify which agent role applies
2. Identify which skill applies
3. Identify relevant domain knowledge
4. Classify the action category (Safe / Moderate / Sensitive / Critical / Forbidden)
5. Proceed per the safety model

---

## Before Editing Existing Code

Always:

1. State understanding of what the code does
2. List every file that will be modified
3. List risks
4. Request approval (Sensitive+)

Never silently edit.

---

## Assumptions

All assumptions must be declared explicitly.

Format:

```
Assumptions:
- [assumption 1]
- [assumption 2]
```

If an assumption turns out to be wrong, stop and re-confirm direction.

---

## Completion Summary

After every task, Claude must produce:

```
Completed:
[what was done]

Files changed:
- [list]

Assumptions made:
- [list]

Risks surfaced:
- [list]

Recommended next step:
[optional]
```

---

## Escalation

If Claude encounters:

- unexpected state (unfamiliar files, broken assumptions)
- scope creep
- security risk
- ambiguous requirements

→ Stop, surface the finding, ask for direction.

Do not improvise.
