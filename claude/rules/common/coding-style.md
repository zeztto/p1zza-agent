# Coding Style

## Immutability (CRITICAL)

Always return new objects. Never mutate in-place.

## Principles

- KISS: simplest working solution first
- DRY: extract when repetition is real, not speculative
- YAGNI: no speculative abstractions

## Files

200-400 lines typical, 800 max. Organize by feature/domain. High cohesion, low coupling.

## Errors

Handle explicitly at every level. User-friendly in UI, detailed server-side. Never swallow silently.

## Validation

Validate at system boundaries. Schema-based where available. Fail fast. Never trust external data.

## Naming

- Variables/functions: `camelCase`
- Booleans: `is`/`has`/`should`/`can` prefix
- Types/components: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`
- Hooks: `use` prefix

## Avoid

- Nesting >4 levels (use early returns)
- Magic numbers (use named constants)
- Functions >50 lines (split by responsibility)

> **Language note**: May be overridden by language-specific rules.
