---
paths:
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.js"
  - "**/*.jsx"
---
# TypeScript Hooks

Extends [common/hooks.md](../common/hooks.md).

## PostToolUse

- **Prettier**: auto-format JS/TS after Write|Edit
- **tsc**: `tsc --noEmit` after `.ts`/`.tsx` edits
- **console.log warning**: warn on `console.log` in edited files

## Stop

- **console.log audit**: scan all modified files for `console.log` before session end
