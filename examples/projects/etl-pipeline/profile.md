# Project: ETL Pipeline (Example)

> This is an example project profile demonstrating how to onboard a data pipeline project into SYNTRAN AIEOS.
> Replace the content below with your actual project details.

---

## Purpose

Automated ETL pipeline that ingests raw sales data from a PostgreSQL source, transforms it (deduplication, currency normalization, category mapping), and loads it into a data warehouse for downstream reporting.

---

## Status

Active — Development phase

---

## Stack

| Component | Technology |
|---|---|
| Language | Python 3.11 |
| Pipeline orchestration | Apache Airflow 2.x |
| Source database | PostgreSQL 15 |
| Target warehouse | BigQuery |
| Data validation | Great Expectations |
| Config | YAML |

---

## Architecture

```
Source (PostgreSQL)
    → extract.py         — reads incremental batches by watermark
    → transform.py       — deduplication, currency normalization, category mapping
    → validate.py        — Great Expectations suite
    → load.py            — BigQuery write (MERGE pattern)
    → report.py          — run summary to Slack / email
```

One Airflow DAG orchestrates the full run on a daily schedule.

---

## Key Design Rules

- Transforms must be deterministic and idempotent — safe to rerun
- Validation runs BEFORE load — failed validation aborts the run without writing to BigQuery
- Raw data is never deleted from source — audit trail preserved
- All config lives in `config/pipeline.yaml` — no hardcoded values in code

---

## How to Run

```bash
# Local test run (dry-run, no BigQuery write)
python main.py --config config/pipeline.yaml --dry-run

# Full run
python main.py --config config/pipeline.yaml

# Airflow trigger
airflow dags trigger etl_pipeline
```

---

## Relevant Agents

- Python Engineer — implementation, new transforms, bug fixes
- Architect — before adding new data sources or changing the load pattern
- Security Reviewer — before any credential or access control change

---

## Relevant Skills

- Develop — new transforms, new data sources
- Debug — pipeline failures, validation errors
- Review — before merging changes to the transform layer
- Test Plan — designing validation suite and regression coverage

---

## Relevant Domains

- `data-ai-testing` — data quality validation patterns
- `backend-api-testing` — API contract patterns for source system integrations

---

## Safety Notes

- Credentials (DB passwords, GCP service account) are managed via environment variables — never hardcoded
- BigQuery MERGE operations are Sensitive — declare scope before execution
- Deleting source data or truncating warehouse tables is Critical — requires explicit approval

---

## Current State

- Extract and transform layers complete and tested
- Validation suite: 14 expectations passing
- Load layer in progress (MERGE logic under review)
- Airflow DAG not yet deployed

---

## Possible Next Steps

- [ ] Complete and review load.py MERGE logic
- [ ] Security review on GCP service account permissions
- [ ] Deploy to staging Airflow environment
- [ ] Run first end-to-end test with real data
