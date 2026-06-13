# Data Quality Test Skill

## Purpose

Validate that data inputs, outputs, transformations, and AI-structured responses are reliable.

## Scope

Use for:
- BigQuery validation
- ETL output checks
- dataframe validation
- CSV/JSON validation
- AI response schema validation
- report parity checks
- data freshness checks

Do not use for:
- destructive data repair
- schema migrations without approval
- production writes without approval

## Inputs Required

- dataset/output
- expected schema
- required fields
- freshness expectation
- row count expectations
- business rules

## Preconditions

1. Confirm read-only behavior.
2. Identify sensitive fields.
3. Identify expected schema.
4. Identify source and target.
5. Identify failure threshold.

## Execution Workflow

1. Restate data object under test.
2. Define schema assertions.
3. Define null/completeness assertions.
4. Define uniqueness assertions.
5. Define freshness assertions.
6. Define row count/volume checks.
7. Define range/type checks.
8. Define source-target reconciliation.
9. Define failure report.
10. Generate SQL/Python validation if appropriate.

## Validation Expectations

Checks must fail loudly and explain what failed.

## Output Contract

Return:
- data quality checklist
- validation assertions
- SQL/Python checks
- pass/fail criteria
- failure interpretation
- escalation notes

## Escalation Boundaries

Escalate if:
- PII/patient data appears
- production writes are needed
- schema changes are required
- automated decisions depend on results

## Anti-Patterns

Avoid:
- validating only file existence
- silent failures
- ignoring freshness
- ignoring duplicates
- accepting invalid JSON from LLM outputs
