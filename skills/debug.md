# Debug Skill

## Purpose

Systematic diagnosis and resolution of defects.

---

## Scope

Bugs, errors, unexpected behavior, failures.
Not for new features or restructuring.

---

## Required Inputs

- Description of the problem (what is expected vs. what is happening)
- Error messages, stack traces, or logs (if available)
- Steps to reproduce
- Environment context (OS, Python version, dependencies)

---

## Preconditions

- Problem is reproducible or evidence is available
- Scope is limited to diagnosis and fix of the stated issue

---

## Execution Workflow

1. **Restate the problem** — confirm understanding of expected vs. actual behavior
2. **Inspect evidence** — read logs, stack traces, error messages
3. **Identify probable causes** — list 3-5 hypotheses ranked by likelihood
4. **Eliminate causes** — work through hypotheses systematically
5. **Identify root cause** — state the confirmed cause with evidence
6. **Propose fix** — describe the fix before implementing
7. **Request approval** if fix touches Sensitive code
8. **Implement fix** — minimal change to address root cause only
9. **Validate** — confirm the problem is resolved
10. **Summarize** — root cause, fix applied, validation result

---

## Validation Expectations

- Original problem no longer reproduces
- Fix is minimal (does not introduce unrelated changes)
- No new failures introduced
- Root cause is documented

---

## Output Contract

- Root cause statement
- Fix applied
- Validation evidence
- Completion summary

---

## Escalation Boundaries

Stop and ask if:
- Root cause is in a system boundary (external API, DB, infrastructure)
- Fix requires touching auth, credentials, or production systems
- Multiple interacting bugs are found (scope creep risk)
- Problem cannot be reproduced

---

## Anti-Patterns

- Fixing symptoms without finding root cause
- Making multiple unrelated changes simultaneously
- Assuming the fix worked without validation
- Suppressing errors instead of resolving them
