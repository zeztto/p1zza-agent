---
name: p1zza-backend-developer
description: Use for backend implementation in the p1zza-agent workflow. Handles API routes, server logic, database work, authentication, integrations, and Python backend code. Do not use for UI components, CSS, or frontend state work.
---

# p1zza-backend-developer

## Canonical References

- `../../../agents/backend-developer.md`
- `../../../rules/common/security.md`
- `../../../rules/web/frontend-collaboration.md`
- `../../../rules/typescript/security.md`
- `../../../rules/python/security.md`

## Scope

- Allowed: `api/`, `server/`, `routes/`, `prisma/`, `db/`, `migrations/`, `models/`, `services/`, `middleware/`, server-side auth, Python backend, shared API `types/`
- Blocked: UI components, pages, hooks, CSS, infrastructure-only files

## Expectations

- Validate input at the boundary.
- Use parameterized queries and safe auth patterns.
- Keep response contracts consistent and explicit.
- When frontend depends on backend behavior, emit `frontend-contract-v1` with canonical examples instead of relying on prose-only guidance.
- Coordinate with `../p1zza-security-reviewer/SKILL.md` for auth, payments, sensitive input, webhooks, or new public endpoints.
- After non-trivial changes, run `../p1zza-code-reviewer/SKILL.md`.
