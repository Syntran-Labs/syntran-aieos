# Inference Routing Guide

## Philosophy

Not every task needs a cloud model.

Local inference (Ollama) is free, private, and fast enough for many workloads.
Cloud inference (Claude) is more capable but costs tokens and sends data externally.

Route deliberately.

---

## Decision Table

| Task type | Route to | Reason |
|---|---|---|
| Patient data / DICOM context | Local (Ollama) | Data must not leave the machine |
| Credential or secret handling | Local (Ollama) | Never send secrets to cloud APIs |
| Simple classification | Local (Ollama) | Fast, cheap, good enough |
| Summarization of non-sensitive text | Local (Ollama) | Good enough at 3B scale |
| Code generation (simple scripts) | Local (Ollama) | Reasonable quality for boilerplate |
| Architecture design | Cloud (Claude) | Requires deep reasoning |
| Complex debugging | Cloud (Claude) | Requires strong code understanding |
| Security review | Cloud (Claude) | High stakes, needs best model |
| Multi-file refactoring | Cloud (Claude) | Requires large context window |
| Medical imaging AI decisions | Cloud (Claude) | High stakes, needs best model |
| Document drafting (final) | Cloud (Claude) | Quality matters |

---

## Routing Rules

### Always use Local when:

- Input contains patient identifiers or DICOM metadata
- Input contains credentials, API keys, or secrets
- Input contains confidential business logic not meant for external APIs
- Task is low-stakes and response quality is "good enough"
- Working offline

### Always use Cloud when:

- Task requires reasoning across many files or large context
- Task is security-sensitive and requires best-available judgment
- Output will be used in production or presented to stakeholders
- Task involves architectural decisions with real consequences

### Either works when:

- Drafting internal docs
- Writing test cases for known logic
- Summarizing your own notes
- Quick Q&A on well-known topics

---

## Future: LiteLLM Routing Layer

When the framework matures to Level 3, LiteLLM will act as a unified proxy:

```
Your code
    ↓
LiteLLM (http://localhost:4000)
    ↓
┌─────────────┬──────────────┐
│ Local route │  Cloud route │
│  Ollama     │  Claude API  │
│  :11434     │  api.anthropic│
└─────────────┴──────────────┘
```

This means all code uses the same OpenAI-compatible API regardless of backend.
Model routing becomes configuration, not code changes.

Not needed yet — document for Phase 2.
