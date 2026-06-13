Apply **Refactor** — safe restructuring without changing observable behavior.

**Use when:** renaming, decomposing, removing duplication, improving readability
**Not for:** adding features → use develop | fixing bugs → use debug

**Invocation template:**
```
Use [architect | python-engineer].
Apply refactor.
Relevant domains: [list]
Task: [what specifically to restructure and why]
Constraints: [what must not change, test coverage status]
```

**Requires explicit approval before any edits.** Commit before starting — rollback path required.