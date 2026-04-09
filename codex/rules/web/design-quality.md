Extends [common/patterns.md](../common/patterns.md).

# Web Design Quality

## Anti-Template Policy

Never ship generic template UI. Output must look intentional and product-specific.

### Banned

- Default card grids with uniform spacing, no hierarchy
- Stock hero: centered headline + gradient blob + generic CTA
- Unmodified library defaults as finished design
- Flat layouts without layering, depth, or motion
- Uniform radius/spacing/shadows across all components
- Safe gray-on-white with one accent color
- Dashboard-by-numbers: sidebar + cards + charts, no point of view
- Default font stacks without deliberate choice

### Required (at least 4 per surface)

1. Hierarchy through scale contrast
2. Intentional spacing rhythm, not uniform padding
3. Depth via overlap, shadows, surfaces, or motion
4. Typography with character and real pairing
5. Semantic color use, not decorative-only
6. Designed hover/focus/active states
7. Grid-breaking editorial or bento composition
8. Texture/grain/atmosphere when fitting
9. Motion that clarifies flow
10. Data viz as part of the design system

## Before Writing Frontend Code

1. Pick a specific style direction (not "clean minimal")
2. Define palette intentionally
3. Choose typography deliberately
4. Gather real references
5. Use ECC design/frontend skills where relevant

## Style Directions

Editorial/magazine, neo-brutalism, glassmorphism, dark/light luxury, bento, scrollytelling, 3D integration, Swiss/International, retro-futurism.

Do not default to dark mode. Choose what the product wants.

## Component Checklist

- [ ] Avoids default Tailwind/shadcn template look
- [ ] Has intentional hover/focus/active states
- [ ] Uses hierarchy over uniform emphasis
- [ ] Believable in a real product screenshot
- [ ] Both light and dark themes feel intentional (if applicable)
