# Frontend Delivery

Use this before meaningful frontend implementation.

## Intake Gate

Confirm all of the following before writing code:

- product goals, routes, flows, and user-visible states
- design references and design-system constraints
- responsive, accessibility, motion, and performance expectations
- current frontend contract packet when backend or infrastructure behavior is involved
- client-side state, loading, empty, error, and optimistic-update behavior
- verification commands and release path

## Change Request Rule

- If a needed contract field is missing, stale, conflicting, or still blocked, emit `frontend-response-v1` before implementation.
- Ask for the smallest backend or infrastructure change that unblocks work.
- Reference the exact endpoint, field, auth rule, header, environment rule, or deployment behavior involved.

## PR Expectations

- Branch format: `frontend/scope-short-slug`
- PR title format: `frontend: <scope summary>`
- Include `goal`, `scope`, `verification`, `contract revision`, and `change requests or blockers`

## Completion Rules

- Do not declare frontend completion while forbidden assumptions remain.
- Do not silently compensate for missing backend or infrastructure behavior in frontend code.
- Return the deliverable and any remaining blocker in packet form when another role must respond.
