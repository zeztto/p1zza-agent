---
paths:
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.js"
  - "**/*.jsx"
---
# TypeScript Security

Extends [common/security.md](../common/security.md).

## Secrets

Never hardcode. Always env vars. Fail fast if missing:

```typescript
// NEVER
const apiKey = "sk-proj-xxxxx"

// ALWAYS
const apiKey = process.env.OPENAI_API_KEY
if (!apiKey) throw new Error('OPENAI_API_KEY not configured')
```

## Agent

Use **security-reviewer** for comprehensive audits.
