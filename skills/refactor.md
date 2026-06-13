# Refactor Skill

## Purpose

Safe restructuring of existing code without changing observable behavior.

---

## Scope

Internal restructuring: naming, decomposition, duplication removal, readability.
Not for adding features (use Develop Skill).
Not for fixing bugs (use Debug Skill).

---

## Required Inputs

- Target file(s) or module
- Refactor objective (what specifically needs improvement)
- Constraints (what must not change)
- Test coverage status (are there existing tests?)

---

## Preconditions

- Explicit approval obtained (Sensitive action)
- Existing behavior is understood before touching anything
- Rollback path exists (git commit before starting)

---

## Execution Workflow

1. **Read** — read all files in scope completely
2. **Understand** — describe current behavior and structure
3. **Identify issues** — list specific problems being addressed
4. **Declare scope** — list exactly what will change and what will not
5. **Request approval** — get explicit confirmation before editing
6. **Refactor** — make changes incrementally, not all at once
7. **Verify** — confirm behavior is preserved
8. **Test** — run or propose tests to confirm no regression
9. **Summarize** — what changed, what stayed the same

---

## Validation Expectations

- All existing tests still pass
- No new behavior introduced
- No scope creep
- No new dependencies unless declared and approved
- No security regressions

---

## Output Contract

- Refactored code
- List of changes made
- Confirmation that behavior is preserved
- Test results or test proposals

---

## Escalation Boundaries

Stop and ask if:
- Refactor reveals hidden complexity or undocumented behavior
- A change would affect callers outside the declared scope
- Test coverage is absent and behavior is unclear
- A security concern is discovered

---

## Anti-Patterns

- Refactoring and adding features simultaneously
- Changing behavior while claiming it is "just cleanup"
- Proceeding without tests or rollback
- Large monolithic refactors instead of incremental steps
