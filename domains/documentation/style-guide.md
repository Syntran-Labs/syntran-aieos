# Documentation Style Guide

## Derived From

Existing SYNTRAN framework files (agents/, skills/, domains/, governance/).
Follows common Markdown documentation conventions.

---

## Heading Hierarchy

- H1 (`#`): document title only — one per file
- H2 (`##`): major sections
- H3 (`###`): subsections within output contracts or structured templates only
- Do not use H4 or deeper

---

## Section Separators

Use `---` between every H2 section.
Do not use `---` within a section.

---

## Lists

- Bullet lists for unordered items: short, imperative, no trailing period
- Numbered lists for ordered workflows: use bold step name + em-dash + description
  - Example: `1. **Classify** — identify which document type applies`
- No introductory sentence required before a list
- No nested lists beyond one level

---

## Bold and Em-dash

- Bold labels in lists: `- **Label** — description`
- Em-dash (`—`) as separator, not hyphen (`-`)
- Bold for step names in numbered workflows
- Do not bold for emphasis in prose — restructure the sentence instead

---

## Tables

- Pipe-delimited
- Use for structured comparisons: severity levels, option sets, quick-reference guides
- No excess padding in cells
- Header row always present

---

## Code Blocks

- Triple backtick for invocation examples and templates
- No language specifier required for prose templates
- Use language specifier (`python`, `powershell`, `json`) for actual code

---

## Tone and Voice

- Declarative and direct
- "Must" / "Must not" — not "Should" / "Consider" / "It is recommended to"
- No hedging language
- No introductory padding ("This section describes...", "In order to...")
- Imperative mood in instructions ("Read all files" not "You should read all files")

---

## Section Naming

**Agent files** follow this order:
Mission → Use For → Do NOT Use For → Required Inputs → Output Contract → Strict Rules → Anti-Patterns → Example Invocation

**Skill files** follow this order:
Purpose → Scope → Required Inputs → Preconditions → Execution Workflow → Validation Expectations → Output Contract → Escalation Boundaries → Anti-Patterns

**Domain files**: free structure, but always start with a short statement of what the domain covers.

---

## Cross-references

- Reference other files inline: "(use Architect Agent)" or "(see doc-types domain)"
- No hyperlinks to internal files — use plain text names
- No hyperlinks to external URLs unless the URL is the subject of the document

---

## What Not to Write

- Comments that explain what (names and structure should do that)
- Sections that say "this section covers X" before covering X
- Trailing summaries that restate what was just written
- Placeholder text or TODO markers in published files
