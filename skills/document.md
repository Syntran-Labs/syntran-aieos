# Document Skill

## Purpose

Produce well-structured written artifacts: guides, references, explanations, and tutorials.

---

## Scope

New documentation, documentation updates, and documentation audits.
Not for code implementation (use Develop Skill).
Not for code review (use Review Skill).

---

## Required Inputs

- Subject (what is being documented)
- Document type (Tutorial / How-to / Reference / Explanation)
- Target audience
- Constraints (length, format, depth)

---

## Preconditions

- Source material is available and accurate
- Document type is identified before writing begins
- Audience is defined before writing begins

---

## Execution Workflow

1. **Classify** — identify which document type applies (see doc-types domain)
2. **Define audience** — state who the reader is and what they already know
3. **Gather source material** — read code, configs, or existing docs that inform the content
4. **Declare gaps** — list anything that cannot be determined from available material
5. **Outline** — produce section headings before writing prose
6. **Draft** — write following project style guide
7. **Validate** — confirm every technical claim against source material
8. **Summarize** — document type, audience, gaps remaining

---

## Validation Expectations

Before declaring done:
- Document type is consistent throughout (no mixing)
- Every technical claim is traceable to source material
- No fabricated behavior or parameter values
- Follows project Markdown style
- Audience calibration is consistent throughout

---

## Output Contract

- Complete document draft
- Document type declared
- Audience declared
- Gaps list (items requiring verification or additional source material)

---

## Escalation Boundaries

Stop and ask if:
- Source material contradicts itself
- Documentation requires knowledge not available in the material provided
- Scope expands to cover multiple document types
- Existing documentation conflicts with what is being written

---

## Anti-Patterns

- Writing without classifying the document type first
- Mixing tutorial steps with reference information in one document
- Documenting intended behavior rather than actual behavior
- Producing documentation longer than the audience needs
- Starting prose before the outline is complete
