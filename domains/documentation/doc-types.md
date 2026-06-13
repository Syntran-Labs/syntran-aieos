# Documentation Types

## Framework: Diátaxis

Four distinct document types. Each serves a different reader need.
Mixing types produces documents that do all four things poorly.

Always classify before writing.

---

## Tutorial

**Reader need:** Learning — "take me through it step by step"

**Characteristics:**
- Author takes responsibility for the journey
- Reader learns by doing, not by reading
- Success is completing the exercise, not understanding everything
- Assumes no prior knowledge of the subject

**Structure:** Introduction → prerequisites → sequential steps → what was accomplished

**Use for:**
- Getting started guides
- First-time setup walkthroughs
- Introductions to new features

**Do not use for:** explaining why something works, listing all options, or task-specific instructions for experienced users

---

## How-to Guide

**Reader need:** Task — "help me accomplish this specific goal"

**Characteristics:**
- Reader has a goal, not a learning objective
- Assumes the reader is already competent
- Does not explain concepts — links to Explanation docs instead
- Steps are goal-oriented, not lesson-oriented

**Structure:** title states the goal → numbered steps → result

**Use for:**
- Procedural instructions for known workflows
- "How to add a new project profile"
- "How to route a task to local inference"

**Do not use for:** teaching concepts, listing all available options exhaustively

---

## Reference

**Reader need:** Information — "what exactly does X do / accept / return"

**Characteristics:**
- Accurate and complete above all else
- Austere — no narrative, no hand-holding
- Structured for lookup, not reading start to finish
- Mirrors the structure of the thing it describes

**Structure:** consistent repeating pattern per item (name → type → description → default → example)

**Use for:**
- Agent contract specifications
- Skill parameter lists
- API endpoint documentation
- Configuration field reference

**Do not use for:** teaching, task instructions, contextual background

---

## Explanation

**Reader need:** Understanding — "why does it work this way"

**Characteristics:**
- Discusses context, background, and design decisions
- Does not teach how to do something
- Allows the reader to form a mental model
- Can be opinionated — explains tradeoffs and reasoning

**Structure:** context → the mechanism or decision → alternatives considered → implications

**Use for:**
- Why SYNTRAN uses a Safety Model
- Why inference routing separates local from cloud
- Why Diátaxis is used as the documentation taxonomy
- Architecture Decision Records (ADRs)

**Do not use for:** step-by-step instructions, exhaustive option lists

---

## Quick Classification Guide

| Question to ask | Type |
|---|---|
| "Does this teach someone something new?" | Tutorial |
| "Does this help someone accomplish a task?" | How-to |
| "Does this describe exactly what something is or does?" | Reference |
| "Does this explain why something is the way it is?" | Explanation |
