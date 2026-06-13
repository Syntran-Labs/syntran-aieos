# Review Skill

## Purpose

Structured evaluation of code or architecture before it moves forward.

---

## Scope

Code review, architecture review, documentation review, PR review.
Read-only — produces findings and recommendations, not changes.

---

## Required Inputs

- Target (files, PR, architecture description)
- Review objective (what are we checking for?)
- Context (what does this do, who uses it)

---

## Preconditions

- Material to review is available and complete
- Review scope is clearly defined

---

## Execution Workflow

1. **Understand context** — what is this and what should it do?
2. **Read completely** — read all material in scope before forming opinions
3. **Evaluate correctness** — does it do what it claims?
4. **Evaluate safety** — security risks, credential handling, trust boundaries
5. **Evaluate maintainability** — clarity, structure, testability
6. **Evaluate alignment** — does it follow project conventions and governance?
7. **Produce findings** — organized by severity
8. **Recommend** — prioritized list of improvements

---

## Output Contract

Structured review report:

```
## Summary
[1-2 sentence overall assessment]

## Findings

### Critical
- [finding] — [why it matters] — [recommendation]

### High
- [finding] — [why it matters] — [recommendation]

### Medium
- [finding] — [why it matters] — [recommendation]

### Low / Informational
- [finding] — [recommendation]

## Recommended Next Steps
1. [highest priority action]
2. [second priority]
```

---

## Escalation Boundaries

Escalate if:
- Critical security finding is discovered
- Code modifies production systems in unexpected ways
- Review reveals that requirements were misunderstood

---

## Anti-Patterns

- Approving code to avoid conflict
- Reviewing without reading completely
- Mixing review findings with implementation changes
- Skipping security checks because "it looks fine"
