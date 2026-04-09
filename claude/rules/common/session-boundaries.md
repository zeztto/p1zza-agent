# Session Boundaries

One session owns one primary domain.

## Domains

- Frontend: UI, browser behavior, client state, design system, accessibility, motion
- Backend: APIs, services, business logic, database access, schemas, migrations, backend tests
- Infrastructure: CI/CD, deployment, hosting, runtime configuration, networking, monitoring
- QA: validation plans, regression passes, defect reports, release-risk assessment, QA-owned artifacts
- Development lead: cross-domain planning, directives, review, merge authority, deploy decisions

## Hard Rules

- Do not mix implementation ownership across domains in one execution slice.
- Frontend work does not silently absorb backend or infra changes.
- QA validates and reports; it does not change product behavior to force a pass.
- Development lead coordinates and reviews; it does not silently take over domain implementation.

## When Scope Crosses Boundaries

- stop expanding local ownership
- identify the missing owner
- write a handoff packet with exact files, constraints, and verification needs
