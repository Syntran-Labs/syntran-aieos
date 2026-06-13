# Data and AI Testing Domain Pack

## Purpose

Reusable knowledge for testing data pipelines, analytics outputs, reports, RAG workflows, and AI-structured responses.

## Data Quality Dimensions

Validate:
- schema
- completeness
- uniqueness
- freshness
- row count stability
- type correctness
- valid ranges
- referential integrity
- source-target reconciliation
- duplicate detection

## AI Output Validation

LLM and AI outputs must be treated as untrusted until validated.

Check:
- valid JSON if JSON expected
- required fields present
- field types correct
- no hallucinated file references where grounded evidence is required
- confidence or uncertainty fields handled
- fallback behavior works
- malformed response does not crash downstream logic

## RAG / Document AI Testing

Validate:
- citations are present when required
- restricted documents are filtered
- missing permissions suppress sensitive answers
- retrieval failure returns safe fallback
- prompt injection in documents does not override system behavior
- output does not leak unauthorized document content

## BigQuery / Analytics Checks

Common checks:
- table exists
- schema matches expectation
- collected_at is fresh
- row_count within expected bounds
- critical columns not null
- IDs unique where expected
- size_bytes numeric and non-negative
- partition/date coverage present

## Release Blockers

Block release if:
- schema changed silently
- AI output parser accepts invalid structure
- permission filtering fails
- report output cannot be reconciled
- freshness checks fail for critical datasets
