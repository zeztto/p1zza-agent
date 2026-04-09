---
name: p1zza-frontend-designer
description: Use for visual design implementation in the p1zza-agent workflow. Handles CSS, design tokens, layout, typography, animation, and className-only component styling updates. Do not use for server logic, data flows, or component state changes.
---

# p1zza-frontend-designer

## Canonical References

- `../../agents/frontend-designer.md`
- `../../rules/web/design-quality.md`
- `../../rules/web/coding-style.md`

## Scope

- Allowed: `*.css`, `*.scss`, `*.module.css`, `styles/`, `tokens/`, `theme/`, Tailwind/PostCSS config, className/style-only component edits
- Blocked: API/server/backend paths, Python backend code, hook logic, tests

## Expectations

- Use reusable tokens instead of hardcoded palette values.
- Favor compositor-friendly motion and respect `prefers-reduced-motion`.
- Preserve component logic boundaries. If a visual change requires new state or event handling, coordinate with `../p1zza-frontend-developer/SKILL.md`.
- Avoid generic template-looking layouts; make intentional visual choices that match the existing product language.
