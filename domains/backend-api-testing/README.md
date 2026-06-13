# Backend API Testing Domain Pack

## Purpose

Reusable knowledge for testing Node, Python, REST, and service APIs.

## API Test Areas

Test:
- status codes
- response schema
- error schema
- auth required
- permission denied
- invalid input
- missing input
- timeout/dependency failure
- rate limiting if applicable
- idempotency where relevant

## Contract Testing

Contract must define:
- required fields
- optional fields
- field types
- nullability
- error shape
- pagination behavior
- auth behavior
- compatibility policy

## Permission-Sensitive Endpoints

Always test:
- authorized user can access allowed resource
- authorized user cannot access forbidden resource
- unauthenticated user fails
- expired token fails
- wrong role fails
- missing resource does not leak sensitive info
- logs do not expose token or sensitive payload

## Mocking Rules

Mock external systems when:
- service is paid
- service is unstable
- service requires secrets
- service is production-only
- deterministic tests are needed

Use real local/test dependencies when:
- integration behavior is critical
- schema compatibility matters
- persistence behavior matters

## Release Blockers

Block release if:
- auth/permission tests are missing for protected endpoints
- response schema changed without contract update
- errors leak sensitive data
- dependency failures crash the service instead of returning controlled errors
