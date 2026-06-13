# Release Validation Skill

## Purpose

Assess whether a release is ready based on test evidence, unresolved risks, and rollback readiness.

## Scope

Use for:
- major update validation
- go/no-go assessment
- release checklist creation
- post-deploy smoke planning
- defect triage
- release evidence summary

Does not:
- deploy automatically
- override missing approvals
- hide uncertainty

## Inputs Required

- release scope
- changed areas
- test results
- open defects
- environment
- rollback plan
- monitoring plan

## Preconditions

1. Confirm release type.
2. Identify changed surfaces.
3. Identify critical risks.
4. Confirm test evidence.
5. Confirm rollback approach.

## Execution Workflow

1. Restate release scope.
2. List changed areas.
3. Summarize test evidence.
4. Identify missing evidence.
5. Classify open defects:
   - blocker
   - critical
   - major
   - minor
6. Validate mandatory gates:
   - build
   - lint/typecheck
   - unit
   - integration
   - API/contract
   - regression
   - E2E critical flows
   - security
   - performance if relevant
   - data if relevant
   - migration/rollback if relevant
   - accessibility if UI
   - UAT if business-facing
7. Define post-deploy smoke checks.
8. Define rollback triggers.
9. Produce go/no-go recommendation.

## Validation Expectations

Recommendation must be evidence-based and label unknowns.

## Output Contract

Return:
- release readiness summary
- completed tests
- missing tests
- open defects
- risk assessment
- go/no-go recommendation
- required approvals
- post-deploy smoke plan
- rollback trigger list

## Escalation Boundaries

Escalate if:
- auth/permissions changed without security evidence
- production monitoring is missing
- rollback is undefined
- critical tests did not run
- deployment would be irreversible

## Anti-Patterns

Avoid:
- “looks good” without evidence
- ignoring missing tests
- hiding defects
- approving release automatically
- treating CI pass as full validation
