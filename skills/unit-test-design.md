# Unit Test Design Skill

## Purpose

Design focused tests for isolated functions, classes, modules, or pure logic.

## Scope

Use for:
- business logic
- parsing
- validation
- transformations
- error handling
- utility functions
- AI/LLM response parsing

Do not use for:
- full API flow validation
- browser UI validation
- database integration

## Inputs Required

- target function/module
- expected behavior
- edge cases
- error cases
- test framework
- mocking constraints

## Preconditions

1. Confirm the unit can be isolated.
2. Identify dependencies to mock.
3. Identify expected inputs/outputs.
4. Identify negative cases.

## Execution Workflow

1. Restate behavior under test.
2. Identify test boundaries.
3. List test cases:
   - happy path
   - invalid input
   - missing input
   - boundary values
   - unexpected structures
   - error propagation
4. Define mocks/stubs.
5. Generate test code or pseudocode.
6. Define run command.
7. Define expected pass/fail interpretation.

## Validation Expectations

Tests must:
- have meaningful assertions
- avoid external network calls
- avoid real credentials
- avoid relying on test order
- include negative cases

## Output Contract

Return:
- unit test matrix
- test data
- mock strategy
- test code or pseudocode
- run command
- limitations

## Escalation Boundaries

Escalate if production code must be refactored to enable testing.

## Anti-Patterns

Avoid:
- tests with no assertions
- overmocking the function being tested
- brittle internal implementation tests
- only testing the happy path
