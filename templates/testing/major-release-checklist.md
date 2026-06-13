# Major Release Testing Checklist

Release:
Date:
Owner:

## Build and Static Quality

- [ ] Build passes
- [ ] Lint passes
- [ ] Typecheck passes if applicable
- [ ] No obvious dead code or debug-only code
- [ ] No secrets in repo

## Automated Tests

- [ ] Unit tests pass
- [ ] Component tests pass if UI changed
- [ ] Integration tests pass
- [ ] API tests pass
- [ ] Contract tests pass
- [ ] Critical E2E tests pass
- [ ] Regression suite passes

## Security

- [ ] Secrets scan complete
- [ ] Dependency scan reviewed
- [ ] Auth tests pass if auth changed
- [ ] Permission tests pass if permissions changed
- [ ] Logs checked for sensitive data
- [ ] No test credentials committed

## Data / AI

- [ ] Schema validation passes
- [ ] Data freshness checks pass
- [ ] Required fields present
- [ ] LLM/AI output parsing handles malformed output
- [ ] RAG/document access respects permissions
- [ ] Fallback behavior validated

## Performance / Reliability

- [ ] Performance risk assessed
- [ ] Load test completed if required
- [ ] Timeout/fallback behavior validated
- [ ] Monitoring/alerts confirmed

## UI / UX / Accessibility

- [ ] Critical UI flows validated
- [ ] Empty/loading/error states checked
- [ ] Responsive layout checked
- [ ] Keyboard navigation checked
- [ ] Status indicators are not color-only

## Release Readiness

- [ ] Open defects triaged
- [ ] No blocker defects
- [ ] Rollback plan defined
- [ ] Post-deploy smoke test defined
- [ ] Human approval obtained where required

## Go/No-Go

Decision: GO / GO WITH RISK / NO-GO / HOLD

Reason:

Remaining risks:
