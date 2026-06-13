# Test Plan Skill

## Purpose

Create a risk-based testing plan for a feature, project, or release.

## Scope

Covers:
- test objectives
- affected areas
- risk mapping
- test levels required
- automation vs manual testing
- quality gates
- release readiness criteria

Does not cover:
- production deployment
- destructive test execution
- security changes without approval

## Inputs Required

- feature/release objective
- affected components
- risk level
- user flows
- environments
- known dependencies
- constraints

## Preconditions

Before planning:
1. Identify whether this is patch, minor, or major.
2. Identify sensitive areas: auth, permissions, data, schemas, production config.
3. Identify available test tooling.
4. Identify missing requirements.

## Execution Workflow

1. Restate objective.
2. List assumptions.
3. Identify affected surfaces.
4. Classify risk areas.
5. Select test levels:
   - static analysis
   - unit
   - component
   - integration
   - API
   - contract
   - E2E
   - regression
   - smoke
   - sanity
   - security
   - performance
   - data quality
   - accessibility
   - UAT
6. Define mandatory tests.
7. Define recommended tests.
8. Define automation candidates.
9. Define manual/exploratory checks.
10. Define release gates.
11. Define evidence required.
12. Define approval boundaries.

## Validation Expectations

The plan must answer:
- what must be tested
- why it matters
- how it will be tested
- who/which agent should execute
- what blocks release
- what remains untested

## Output Contract

Return:
- Testing Plan
- Risk Matrix
- Test Level Matrix
- Automation Plan
- Manual QA Plan
- Release Gates
- Open Questions
- Approval Requirements

## Escalation Boundaries

Escalate if:
- requirements are unclear
- permission behavior is affected
- production data could be touched
- rollback is undefined
- security validation is missing for sensitive changes

## Anti-Patterns

Avoid:
- one-size-fits-all testing
- exhaustive testing with no priority
- happy-path-only validation
- ignoring negative tests
- ignoring rollback
