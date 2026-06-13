Apply **Review** — structured evaluation before code or architecture moves forward.

**Use when:** code review, PR review, architecture review, documentation review
**Read-only** — produces findings and recommendations, not changes

**Invocation template:**
```
Use [architect | python-engineer | security-reviewer].
Apply review.
Relevant domains: [list]
Task: [what to review and what to check for]
Constraints: [context, compliance, conventions]
```

**Output format:** Summary → Findings (Critical / High / Medium / Low) → Recommended next steps