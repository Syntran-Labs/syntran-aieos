# Permission Matrix

## Protected Resource

Resource:
Environment:

## Roles

| Role | Description |
|---|---|

## Permission Matrix

| Test ID | User/Role | Resource | Expected Access | Actual Access | Status |
|---|---|---|---|---|---|
| PERM-001 | Authorized user | Allowed document | Allow |  |  |
| PERM-002 | Authorized user | Restricted document | Deny |  |  |
| PERM-003 | Unauthenticated user | Any protected resource | Deny |  |  |
| PERM-004 | Expired token | Any protected resource | Deny |  |  |
| PERM-005 | Wrong role | Restricted resource | Deny |  |  |

## Logging Checks

- [ ] No tokens in logs
- [ ] No sensitive document content in logs
- [ ] No private identifiers in error messages
- [ ] Denied access does not reveal protected metadata

## Blockers
