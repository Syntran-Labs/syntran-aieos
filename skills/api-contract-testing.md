# API Contract Testing Skill

## Purpose

Validate that API producers and consumers remain compatible.

## Scope

Use for:
- REST endpoints
- request and response schemas
- status codes
- error response contracts
- API versioning
- frontend/backend compatibility
- external integration contracts

Do not use for:
- full UI testing
- database migration testing
- performance benchmarking

## Inputs Required

- endpoint list
- expected request schema
- expected response schema
- consumers
- authentication requirements
- error examples

## Preconditions

1. Identify producer and consumer.
2. Identify contract source: OpenAPI, examples, tests, documentation, or inferred current behavior.
3. Identify breaking-change risk.
4. Confirm test environment.

## Execution Workflow

1. Restate contract.
2. Define required fields.
3. Define optional fields.
4. Define status codes.
5. Define error body shape.
6. Define auth and permission responses.
7. Define backward compatibility checks.
8. Generate contract tests or validation checklist.
9. Define run command.
10. Define breaking-change report.

## Validation Expectations

Contract tests must detect:
- missing fields
- renamed fields
- type changes
- status code changes
- error format changes
- auth behavior changes
- undocumented breaking changes

## Output Contract

Return:
- API contract matrix
- compatibility risks
- positive tests
- negative tests
- schema validation approach
- breaking changes
- run command

## Escalation Boundaries

Escalate if API behavior is undocumented or consumers rely on fields not in the contract.

## Anti-Patterns

Avoid:
- treating example payloads as the whole contract
- only testing success responses
- ignoring auth/permission responses
- silent breaking changes
