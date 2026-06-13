# Testing Framework Domain Pack

## Purpose

Reusable testing knowledge for SyntranAI projects.

## Core Principle

Testing is layered. Each level answers a different question.

## Test Levels

| Level | Question |
|---|---|
| Static analysis | Is the code structurally safe and consistent? |
| Unit | Does this isolated piece work? |
| Component | Does this UI component behave correctly in its states? |
| Integration | Do these parts work together? |
| API | Do endpoints behave correctly? |
| Contract | Did producer/consumer compatibility remain stable? |
| E2E | Does the user workflow work end to end? |
| Regression | Did old behavior break? |
| Smoke | Is the system basically alive after deploy? |
| Sanity | Does this specific change work? |
| Security | Did we open a security or permission risk? |
| Performance | Does it handle expected and abnormal load? |
| Data Quality | Are outputs and datasets trustworthy? |
| Migration | Can data/schema/infra change safely and roll back? |
| Accessibility | Can the UI be used by more users and assistive paths? |
| UAT | Does the business/user accept the result? |

## Risk-Based Rule

Higher risk requires deeper validation.

High-risk areas:
- authentication
- authorization
- permission filtering
- production data
- schemas
- migrations
- payment flows
- medical/patient data
- secrets
- deployment and infrastructure
- LLM output used downstream

## Minimum Pull Request Gate

Recommended:
- lint/format
- typecheck if available
- unit tests
- relevant component/integration/API tests
- build
- security/dependency scan if available
- review summary

## Major Release Gate

Recommended:
- full build
- lint/typecheck
- unit tests
- integration tests
- API/contract tests
- regression tests
- E2E critical flows
- security tests
- dependency/secrets scans
- performance check if backend/load changed
- data quality check if data/AI outputs changed
- migration/rollback validation if schema/infra changed
- accessibility check if UI changed
- UAT if business-facing
- post-deploy smoke plan
- rollback trigger list

## Negative Testing Required

Always test:
- missing inputs
- invalid inputs
- unauthorized user
- expired token
- unavailable dependency
- timeout
- malformed JSON
- empty result
- duplicate data
- oversized payload
- unexpected schema
- permission denied

## Release Blockers

Block release when:
- auth/permission behavior is untested
- secrets are exposed
- critical data checks fail
- rollback is unknown for irreversible changes
- build fails
- critical user flow fails
- production monitoring is absent for risky releases
