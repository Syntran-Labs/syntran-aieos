# Frontend React Testing Domain Pack

## Purpose

Reusable knowledge for testing React frontends in SyntranAI projects.

## Recommended Tools

Typical options:
- Vitest or Jest
- React Testing Library
- Playwright for E2E
- Storybook for component state inspection
- Chromatic/Percy/Playwright screenshots for visual regression
- axe or jest-axe for accessibility checks

## Component Test Checklist

For each important component test:
- default state
- loading state
- empty state
- error state
- long text
- missing optional data
- many items
- disabled actions
- destructive action confirmation
- keyboard navigation
- screen reader labels
- responsive behavior

## Document Card Pattern

For document cards, test:
- collapsed state
- expanded state
- READY status
- PROCESSING status
- ERROR status
- long filename
- missing summary
- many tags
- no tags
- delete action
- open/download action
- mobile width
- desktop width
- keyboard expand/collapse
- accessible status text

## Good Selector Policy

Prefer:
- role-based selectors
- accessible names
- data-testid only when necessary

Avoid:
- brittle CSS class selectors
- deep DOM structure selectors
- timing sleeps

## Accessibility Rules

Required:
- buttons have meaningful names
- status not color-only
- focus is visible
- keyboard path exists
- error messages are readable
- truncated text has a way to reveal meaning
