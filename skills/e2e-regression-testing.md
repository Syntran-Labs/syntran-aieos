# End-to-End Regression Testing Skill

## Purpose

Validate critical user workflows across the full application stack and ensure existing behavior still works after changes.

## Scope

Use for:
- critical user journeys
- browser-based flows
- cross-layer regression
- smoke and sanity validation
- major update validation

Do not use for:
- testing every tiny detail
- replacing unit/integration tests
- large brittle UI suites

## Inputs Required

- critical user flows
- user roles
- environment
- seed data
- expected outcomes
- supported browsers if relevant

## Preconditions

1. Identify critical flows.
2. Confirm environment is not production unless explicitly approved.
3. Confirm test data.
4. Confirm cleanup expectations.
5. Confirm selectors/locators.

## Execution Workflow

1. Restate user journey.
2. Define smoke tests.
3. Define sanity tests for changed areas.
4. Define regression tests for existing behavior.
5. Define negative paths.
6. Define permission-specific paths.
7. Define browser/responsive needs.
8. Generate E2E test cases or automation.
9. Define run command.
10. Define pass/fail criteria.

## Validation Expectations

E2E tests must focus on user-visible outcomes and critical flows.

## Output Contract

Return:
- smoke test list
- sanity test list
- regression test list
- E2E scenarios
- data setup/cleanup
- automation candidates
- run command
- release blockers

## Escalation Boundaries

Escalate if tests require production, real payments, real emails, destructive writes, or sensitive data.

## Anti-Patterns

Avoid:
- automating everything through UI
- brittle selectors
- ignoring cleanup
- ignoring negative cases
- relying on timing sleeps instead of stable waits
