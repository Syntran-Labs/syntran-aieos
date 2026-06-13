# Safety Model

## Principles

1. Human authority is final
2. AI must justify actions
3. Destructive operations require approval
4. Risk must be surfaced explicitly
5. Changes must be traceable
6. Assumptions must be declared
7. Silent behavior is forbidden
8. Safety overrides speed
9. Repeatability matters
10. Governance applies globally

---

## Action Categories

### Safe
Allowed without approval. Must still be summarized.

- Reading files
- Analyzing code
- Reviewing architecture
- Generating documentation
- Proposing plans
- Writing drafts
- Suggesting improvements
- Generating tests (not executing destructive changes)
- Code explanation
- Refactor proposals

### Moderate
Require plan disclosure. May proceed after acknowledgment.

- Creating new files
- Scaffolding directories
- Adding non-sensitive helper scripts
- Creating documentation structures
- Adding tests
- Creating config templates without secrets

AI must state: files to create, rationale, assumptions.

### Sensitive
Require explicit approval before proceeding.

- Modifying existing application code
- Refactoring business logic
- Changing interfaces
- Altering schemas
- Modifying pipelines
- Changing deployment configs
- Editing automation logic
- Modifying auth flows

### Critical
Always gated. Human approval mandatory before execution.

- Credential modifications
- Secret handling
- Production config changes
- Deployment scripts
- Destructive DB operations
- Deleting infrastructure definitions
- Permission model changes
- Cloud IAM changes
- Storage lifecycle changes

### Forbidden
Never allowed autonomously.

- Deploying to production
- Rotating secrets
- Deleting production data
- Deleting repositories
- Pushing destructive commits
- Emailing stakeholders automatically
- Modifying live access control silently
- Disabling security controls
- Wiping environments
- Deleting backups
- Changing billing controls
