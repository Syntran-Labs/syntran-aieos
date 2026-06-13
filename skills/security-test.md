# Security Test Skill

## Purpose

Design and execute safe security validation within authorized boundaries.

## Scope

Use for:
- auth tests
- authorization tests
- permission matrix validation
- secrets scanning
- dependency scanning
- SAST/DAST planning
- secure logging checks
- sensitive data exposure checks

Do not use for:
- unauthorized penetration testing
- exploit development
- bypassing controls
- production intrusive scanning without approval

## Inputs Required

- protected assets
- user roles
- auth method
- sensitive data types
- environment
- allowed tools

## Preconditions

1. Confirm authorization to test.
2. Confirm environment.
3. Confirm no real secrets are exposed in prompts or files.
4. Confirm production is not targeted unless explicitly approved.
5. Define safe boundaries.

## Execution Workflow

1. Restate security scope.
2. Identify trust boundaries.
3. Identify assets to protect.
4. Build permission matrix.
5. Define positive access tests.
6. Define negative access tests.
7. Define secrets scan.
8. Define dependency scan.
9. Define secure logging checks.
10. Define release blockers.
11. Define escalation path.

## Validation Expectations

Security tests must include negative cases and must not weaken controls for convenience.

## Output Contract

Return:
- security test matrix
- permission matrix
- safe scan commands
- release blockers
- risk findings
- remediation recommendations
- approval requirements

## Escalation Boundaries

Stop immediately if:
- credentials are found
- patient/customer data is exposed
- production endpoints are involved unexpectedly
- auth behavior must be changed

## Anti-Patterns

Avoid:
- testing only authorized access
- storing secrets in test fixtures
- logging tokens
- weakening auth for tests
- scanning systems without permission
