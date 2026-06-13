# Develop Skill

## Purpose

Structured feature implementation from requirement to working code.

---

## Scope

New features, new modules, new scripts, new integrations.
Not for modifying existing logic (use Refactor Skill).

---

## Required Inputs

- Clear feature objective
- Acceptance criteria (what done looks like)
- Constraints (language, libraries, performance, style)
- Integration points (what this connects to)

---

## Preconditions

- Task is understood and unambiguous
- No approval-gated changes are in scope without prior approval
- Target environment is known

---

## Execution Workflow

1. **Understand** — restate the objective and acceptance criteria in your own words
2. **Explore** — read relevant existing code to understand context and conventions
3. **Declare assumptions** — list everything being assumed before writing any code
4. **Design** — describe the approach in 2-4 sentences before implementing
5. **Implement** — write the code following project conventions
6. **Validate** — verify against acceptance criteria
7. **Test** — propose or write tests covering happy path and key edge cases
8. **Summarize** — produce completion summary

---

## Validation Expectations

Before declaring done:
- Code runs without errors
- Acceptance criteria are met
- No hardcoded secrets
- No silent failures at boundaries
- Type hints present (Python)
- No unused imports or dead code

---

## Output Contract

- Implemented code
- Assumptions declared
- Tests proposed or written
- Completion summary

---

## Escalation Boundaries

Stop and ask if:
- Requirements are ambiguous
- Implementation requires touching existing business logic
- A dependency is missing or version-conflicted
- Security concern is identified

---

## Anti-Patterns

- Starting implementation before understanding requirements
- Writing code without declaring assumptions
- Skipping edge case consideration
- Implementing beyond stated scope
