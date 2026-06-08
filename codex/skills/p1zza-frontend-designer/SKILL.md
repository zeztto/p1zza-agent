---
name: p1zza-frontend-designer
description: Use for visual design implementation in the p1zza-agent workflow. Handles CSS, design tokens, layout, typography, animation, and className-only component styling updates after UX flow and interaction intent are defined. Do not use for server logic, data flows, or component state changes.
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
- If the work begins from user flow, wireframe, or usability ambiguity, coordinate first with `../p1zza-ui-ux-designer/SKILL.md`.
- Avoid generic template-looking layouts; make intentional visual choices that match the existing product language.

## Retained LazyCodex Design Guidance

The only retained LazyCodex behavior is frontend visual-design taste. Use the local `../lazycodex-frontend-ui-ux/SKILL.md` guidance when Codex would otherwise produce generic UI.

- Choose a concrete aesthetic direction before styling.
- Avoid template card grids, generic purple gradients, and default font choices unless already established by the product.
- Make typography, color, motion, spacing, and states feel intentionally designed for the domain.
- Keep this as design guidance only; LazyCodex plugin hooks, workflow commands, MCP tooling, and multi-agent configs are not part of the active p1zza-agent setup.
