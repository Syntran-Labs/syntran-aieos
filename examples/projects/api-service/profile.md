# Project: API Service (Example)

> This is an example project profile demonstrating how to onboard a backend API project into SYNTRAN AIEOS.
> Replace the content below with your actual project details.

---

## Purpose

REST API service for a document management platform. Handles document upload, metadata indexing, permission checking, and retrieval. Used by a React frontend and consumed by downstream analytics pipelines.

---

## Status

Active — Pre-release hardening

---

## Stack

| Component | Technology |
|---|---|
| Language | Python 3.11 |
| Framework | FastAPI |
| Database | PostgreSQL 15 (SQLAlchemy ORM) |
| Auth | JWT (RS256) |
| Storage | S3-compatible object store |
| Testing | pytest + httpx |
| CI | GitHub Actions |

---

## Architecture

```
Client (React / analytics pipeline)
    → API Gateway (rate limiting, auth token validation)
    → FastAPI app
        → routes/documents.py    — CRUD endpoints
        → routes/permissions.py  — access control checks
        → services/storage.py    — S3 upload / download
        → services/indexer.py    — metadata extraction and indexing
        → db/models.py           — SQLAlchemy models
        → auth/jwt.py            — token validation middleware
```

---

## Key Design Rules

- Auth middleware runs on every request — no endpoint is publicly accessible
- Permission checks run BEFORE storage operations — fail fast, never leak document existence
- All storage operations are async — blocking calls are not allowed in route handlers
- Database migrations use Alembic — no manual schema changes

---

## How to Run

```bash
# Development server
uvicorn app.main:app --reload

# Tests
pytest tests/ -v

# With coverage
pytest tests/ --cov=app --cov-report=term-missing
```

---

## Relevant Agents

- Architect — new endpoints, auth flow changes, storage architecture decisions
- Python Engineer — implementation, refactoring, test writing
- Security Reviewer — auth changes, permission model changes, any new data exposure

---

## Relevant Skills

- Develop — new endpoints, new services
- Refactor — cleaning up route handlers, extracting service logic
- Debug — 500 errors, auth failures, storage timeouts
- Review — before any PR that touches auth or permission logic
- Test Plan — API contract test design, negative test coverage

---

## Relevant Domains

- `backend-api-testing` — contract testing patterns, negative test patterns
- `release-governance` — go/no-go criteria before production deployment

---

## Safety Notes

- JWT private key is stored in environment variables — never in code or config files
- Permission model changes are Sensitive — require approval and security review before merge
- S3 bucket policies are Critical — do not modify without explicit approval
- Database migration scripts that drop columns or tables are Critical

---

## Current State

- Core CRUD endpoints: complete and tested (47 tests passing)
- Permission middleware: complete, under security review
- S3 integration: complete
- Indexer service: in progress

---

## Possible Next Steps

- [ ] Complete security review on permission middleware
- [ ] Add API contract tests for downstream consumer compatibility
- [ ] Load test key endpoints before production release
- [ ] Review and harden S3 bucket policy
