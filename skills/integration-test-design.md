# Integration Test Design Skill

## Purpose

Validate that multiple system parts work together correctly.

## Scope

Use for:
- service + database
- API + service layer
- backend + external API mock
- auth + permission checks
- document processing flows
- AI response parsing + downstream behavior

Do not use for:
- isolated function testing
- full browser user journeys
- production load testing

## Inputs Required

- integrated components
- data flow
- dependencies
- test environment
- expected outcomes
- failure cases

## Preconditions

1. Identify integration boundary.
2. Decide real vs mocked dependencies.
3. Define test data.
4. Confirm no production resources are touched.

## Execution Workflow

1. Restate integration flow.
2. Define components involved.
3. Identify dependency strategy.
4. Define happy path.
5. Define negative paths.
6. Define timeout/failure behavior.
7. Define data setup and teardown.
8. Generate test cases or code.
9. Define execution command.
10. Define evidence needed.

## Validation Expectations

Tests must catch contract mismatches, data shape mismatches, auth failures, and dependency failure behavior.

## Output Contract

Return:
- integration flow map
- test matrix
- fixture strategy
- dependency strategy
- test cases/code
- run command
- cleanup requirements

## Escalation Boundaries

Escalate if integration requires live credentials, production services, or destructive writes.

## Anti-Patterns

Avoid:
- silently using production endpoints
- tests that depend on external service availability without isolation
- no cleanup
- fake tests that never cross a real boundary
