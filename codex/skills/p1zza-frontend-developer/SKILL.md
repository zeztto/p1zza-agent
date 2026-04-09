---
name: p1zza-frontend-developer
description: Use for React or Next.js frontend implementation in the p1zza-agent workflow. Handles components, hooks, state management, routing, and client-side data fetching. Do not use for API, database, backend, or heavy visual-system work.
---

# p1zza-frontend-developer

## Canonical References

- `../../agents/frontend-developer.md`
- `../../rules/web/patterns.md`
- `../../rules/web/coding-style.md`
- `../../rules/web/frontend-collaboration.md`
- `../../rules/web/frontend-delivery.md`
- `../../rules/typescript/patterns.md`

## Scope

- Allowed: `components/`, `pages/`, `app/`, `hooks/`, `contexts/`, `stores/`, client-side `lib/`, shared frontend-facing `types/`
- Blocked: `api/`, `server/`, `prisma/`, `db/`, Python backend, infrastructure configs, CSS token systems owned by design

## Expectations

- Keep logic in typed components and custom hooks.
- Use the existing data-fetching and state-management patterns already present in the codebase.
- Avoid waterfalls for independent async work.
- Consume `frontend-contract-v1` packets when backend or infrastructure behavior affects the UI.
- If the packet is incomplete or contradictory, answer with `frontend-response-v1` instead of guessing.
- Hand off visual-heavy styling to `../p1zza-frontend-designer/SKILL.md`.
- After non-trivial changes, run `../p1zza-code-reviewer/SKILL.md`.
