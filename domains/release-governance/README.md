# Release Governance Domain Pack

## Purpose

Define release testing discipline for SyntranAI projects.

## Release Types

Patch:
- small fix
- low blast radius
- focused regression

Minor:
- new feature or moderate change
- targeted regression
- integration/API checks

Major:
- architecture, UI, API, data, permission, deployment, or workflow change
- full release validation
- explicit rollback plan

## Required Major Release Evidence

- build success
- lint/typecheck success
- unit test results
- integration/API/contract results
- regression results
- critical E2E results
- security scan status
- secrets scan status
- dependency scan status
- performance evidence if relevant
- data quality evidence if relevant
- migration/rollback evidence if relevant
- UAT/business validation if relevant
- post-deploy smoke plan

## Go/No-Go Recommendation

Allowed values:
- GO: required evidence complete, no blockers
- GO WITH RISK: non-critical gaps remain and are explicitly accepted
- NO-GO: blocker exists or mandatory evidence missing
- HOLD: insufficient information

## Blocker Examples

- failing build
- failing critical user flow
- untested auth/permission change
- exposed secret
- migration without rollback
- production monitoring missing for risky change
- unresolved critical defect
- data integrity failure

## Post-Deploy Smoke

Minimum:
- app loads
- health endpoint responds
- login works if applicable
- primary flow works
- logs clean for critical errors
- monitoring receives events
- rollback path still available
