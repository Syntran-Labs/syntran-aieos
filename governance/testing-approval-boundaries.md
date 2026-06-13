# Testing Approval Boundaries

Testing follows SyntranAI safety categories.

## Safe

May proceed:
- reading files
- analyzing test coverage
- proposing test plans
- writing test documentation
- creating checklists
- reviewing test results
- proposing test cases

## Moderate

Declare plan, then proceed:
- creating new test files
- scaffolding test folders
- creating mock data without secrets
- creating config templates without secrets
- creating read-only validation scripts
- creating local-only test commands

## Sensitive

Requires explicit approval:
- modifying existing application code
- modifying interfaces or schemas
- modifying pipelines
- modifying CI/CD
- modifying auth or permission logic
- changing logging behavior in production paths
- changing test data that affects shared environments
- running tests that write to shared databases

## Critical

Requires explicit approval and extra caution:
- production config changes
- IAM/service account changes
- credential handling
- running load tests against production
- destructive DB operations
- deleting data
- changing cloud storage lifecycle or access
- deployment operations

## Forbidden Without Direct Explicit Command

Never autonomously:
- deploy to production
- rotate secrets
- delete production data
- disable security controls
- wipe environments
- push to remote repositories
- run intrusive scans against systems without authorization

## Testing-Specific Rule

Tests must not silently change the system under test.

If a test requires production-code changes, stop and ask for approval using the standard approval format.
