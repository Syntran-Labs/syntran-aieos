# Component Test Design Skill

## Purpose

Design tests for UI components and their visible states.

## Scope

Use for:
- React components
- UI state rendering
- user interaction
- responsive behavior
- accessibility expectations
- component-level regression

Do not use for:
- full backend integration
- production deployment
- visual redesign decisions without requirements

## Inputs Required

- component name
- props/data examples
- states
- user interactions
- test framework
- responsive requirements

## Preconditions

1. Identify supported states.
2. Identify required user interactions.
3. Identify accessibility expectations.
4. Identify stable selectors.

## Execution Workflow

1. Restate component purpose.
2. List visual/functional states.
3. Define test cases:
   - default state
   - loading
   - empty
   - error
   - long content
   - missing data
   - role/permission-specific behavior
   - keyboard interaction
   - responsive layout
4. Define accessibility checks.
5. Define visual regression candidates.
6. Produce test code or cases.
7. Define run command.

## Validation Expectations

Tests must validate what users see and can do, not only internal state.

## Output Contract

Return:
- component state matrix
- interaction tests
- accessibility tests
- responsive checks
- visual regression candidates
- test code or pseudocode
- limitations

## Escalation Boundaries

Escalate if component behavior is ambiguous or destructive actions lack safeguards.

## Anti-Patterns

Avoid:
- snapshot-only testing
- brittle CSS selector reliance
- color-only status validation
- ignoring keyboard access
