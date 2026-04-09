# Rules

## Structure

```
rules/
├── common/       # Language-agnostic (always loaded)
├── typescript/   # TS/JS specific
├── python/       # Python specific
└── web/          # Frontend/web specific
```

## Precedence

Language-specific > common when they conflict.

## Rules vs Skills

Rules = what to do (standards, checklists). Skills (`skills/`) = how to do it (patterns, examples).
