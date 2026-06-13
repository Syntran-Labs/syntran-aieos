Use test-strategy-lead.

Apply test-plan.

Relevant domains:
- testing-framework
- release-governance
- frontend-react-testing (include if the project has a UI)
- backend-api-testing (include if the project has APIs)
- data-ai-testing (include if the project has data pipelines, RAG, LLM outputs, or AI workflows)

Task:
Assess the current testing posture of this project and produce a risk-based testing strategy.

To complete the assessment, inspect available files and ask for any missing context:
- Application type and purpose
- Tech stack (language, framework, database, infrastructure)
- Critical user flows
- Auth and permission boundaries
- Data handling (sensitive data, PII, patient data, financial data)
- API contracts (internal and external)
- UI components and pages
- Current test coverage (what tests exist and at what level)
- Missing or untested areas
- Modules with highest risk or recent churn
- CI/CD pipeline and release process
- Upcoming major updates or known risk areas
- Production impact scope

Required output:

1. Testing maturity summary
   - Overall assessment of current testing posture
   - Confidence level in the current state of quality

2. Current test coverage by level
   - Static analysis / linting
   - Unit tests
   - Component tests
   - Integration tests
   - API tests
   - Contract tests
   - E2E tests
   - Regression tests
   - Security tests
   - Performance tests
   - Data quality tests
   - Accessibility tests
   - Release validation
   For each level: EXISTS / PARTIAL / MISSING / NOT APPLICABLE

3. Risk matrix
   | Area | Risk | Impact | Likelihood | Recommended Test Level | Priority |
   List the highest-risk areas first.

4. Recommended testing roadmap
   - Immediate: critical gaps to close before any merge
   - Before next merge: high-priority tests to add now
   - Before next major update: full suite to build
   - Post-deploy: validation and smoke tests

5. Suggested agents and skills to invoke next
   Example: "Use test-automation-engineer. Apply unit-test-design. Task: ..."

6. Required approval gates
   List any changes that would be Sensitive or Critical before proceeding.

7. Open questions / missing information
   Anything that must be clarified before tests can be written.

Constraints:
- This assessment is Safe: read files, analyze, and produce recommendations only.
- Do not create test files or modify any code during the assessment.
- Do not approve or recommend skipping any approval gate.
- Creating test files after this assessment is Moderate — declare plan, then proceed.
- Modifying production code, auth, schemas, CI/CD, deployment, or infrastructure is Sensitive or Critical and requires explicit approval before any action.
