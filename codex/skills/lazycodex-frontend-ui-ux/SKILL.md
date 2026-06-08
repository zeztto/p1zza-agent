---
name: lazycodex-frontend-ui-ux
description: Use as the only retained LazyCodex capability when frontend visual design needs stronger aesthetic direction than the default Codex design behavior. Use for visual UI direction, typography, color, motion, composition, and polished styling guidance; keep p1zza-agent routing and file boundaries primary.
---

# LazyCodex Frontend UI/UX

This skill preserves the useful LazyCodex frontend design behavior without enabling the LazyCodex plugin, hooks, MCP tools, workflow commands, or multi-agent configs.

## Operating Contract

- `p1zza-agent` remains the primary control plane.
- Use this skill only for frontend visual design quality.
- Keep p1zza role boundaries active:
  - UX flow, wireframe, and interaction model: `p1zza-ui-ux-designer`
  - CSS, tokens, layout, typography, animation: `p1zza-frontend-designer`
  - React/Next.js state, components, hooks, routing: `p1zza-frontend-developer`
- Do not use LazyCodex workflow commands, planner agents, reviewer agents, hooks, telemetry, or auto-update behavior.

## Design Mission

Create visually strong, context-specific interfaces that do not look like generic generated UI. Prioritize intentionality, hierarchy, rhythm, spacing, typography, color harmony, and refined motion.

Before coding, choose a clear aesthetic direction:

- Purpose: what problem the interface solves and who uses it
- Tone: utilitarian, refined, editorial, playful, industrial, soft, geometric, minimal, or another concrete direction that fits the product
- Constraints: framework, performance, accessibility, existing design system
- Differentiation: the one detail the user will remember

## Visual Standards

Typography:

- Choose typography that fits the product and existing system.
- Avoid defaulting to Arial, Roboto, Inter, system fonts, or Space Grotesk unless the existing product already uses them intentionally.
- Use at most two font families and keep line-height readable.

Color:

- Commit to a cohesive palette with clear contrast and purposeful accent colors.
- Avoid timid one-hue palettes and generic purple-gradient-on-white compositions.
- Prefer CSS variables or design tokens over scattered literal colors.

Motion:

- Use a few high-impact moments rather than many noisy micro-interactions.
- Prefer compositor-friendly properties: `transform`, `opacity`, `clip-path`, and carefully scoped `filter`.
- Respect `prefers-reduced-motion`.

Composition:

- Avoid predictable card grids, stock hero layouts, and evenly spaced template surfaces.
- Use hierarchy, asymmetry, density, negative space, or contrast when it fits the domain.
- Keep operational tools quiet and scannable; keep expressive sites or games more distinctive.

Details:

- Add polish through states, rhythm, texture, depth, spacing, and edge treatment.
- Make every visible state feel intentionally designed.
- Verify mobile and desktop text fit before considering the work done.

## Anti-Patterns

- Do not override p1zza-agent packet protocol or role routing.
- Do not introduce frontend logic when a design-only change is requested.
- Do not add decorative effects that fight the product's domain.
- Do not expose unfinished or "coming soon" surfaces.
- Do not use this skill as a general LazyCodex replacement.
