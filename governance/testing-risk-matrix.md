# Testing Risk Matrix

## Risk Classification

| Risk Level | Description | Testing Requirement |
|---|---|---|
| Low | Small isolated change, no data/security impact | Unit or focused manual validation |
| Medium | Feature-level change or API/UI behavior change | Unit + integration/API/component + regression |
| High | Auth, permissions, data, AI output, external integrations | Full targeted test suite + security/data validation |
| Critical | Production, credentials, IAM, destructive data, medical/customer-sensitive data | Explicit approval + full validation + rollback evidence |

## High-Risk Change Types

- auth/login
- permission filtering
- document access control
- database schema
- ETL transformation
- AI/RAG retrieval
- LLM response parsing
- deployment config
- cloud IAM
- secrets
- production observability
- payment or billing
- medical/patient data

## Required Negative Tests for High-Risk Changes

- unauthorized access
- wrong role
- expired token
- missing input
- malformed input
- dependency unavailable
- timeout
- empty results
- duplicate data
- unexpected schema
- large payload
- logging of sensitive values

## Release Decision Guidance

GO:
- all mandatory tests passed
- no blocker
- rollback available

GO WITH RISK:
- non-critical gaps documented
- human accepts risk

NO-GO:
- blocker exists
- critical evidence missing
- security/data/permission risk unresolved

HOLD:
- insufficient evidence
- ambiguous requirements
