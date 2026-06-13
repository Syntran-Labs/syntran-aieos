# Performance Test Skill

## Purpose

Evaluate speed, scalability, and reliability under expected and abnormal load.

## Scope

Use for:
- load tests
- stress tests
- spike tests
- soak tests
- latency validation
- throughput validation
- timeout/fallback validation

Do not use for:
- production load testing without approval
- security exploitation
- cost-unbounded experiments

## Inputs Required

- target endpoint/flow
- expected load
- environment
- acceptable thresholds
- dependencies
- test duration

## Preconditions

1. Confirm environment.
2. Confirm approval if shared/staging/production.
3. Define cost and rate-limit risks.
4. Define rollback/stop condition.
5. Define metrics collection.

## Execution Workflow

1. Restate performance objective.
2. Define test type.
3. Define load profile.
4. Define metrics:
   - avg latency
   - p95 latency
   - p99 latency
   - throughput
   - error rate
   - resource usage
5. Define thresholds.
6. Define test data.
7. Define execution command/script.
8. Define stop conditions.
9. Define report format.

## Validation Expectations

Performance reports must include p95/p99 and error rate, not only averages.

## Output Contract

Return:
- test profile
- metrics
- thresholds
- script or command
- execution constraints
- risk notes
- report template

## Escalation Boundaries

Escalate if:
- production could be affected
- cloud cost may increase
- external service limits may be hit
- results require infrastructure changes

## Anti-Patterns

Avoid:
- testing with unrealistic data
- ignoring error rate
- ignoring p95/p99
- no stop condition
- accidental production tests
