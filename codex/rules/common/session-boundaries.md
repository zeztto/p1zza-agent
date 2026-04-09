# Session Boundaries

One session owns one primary domain.

## Session Initialization

At the start of every session, before any implementation or coordination work:

1. Infer the owning role from the first user message using the dispatch table in `AGENTS.md`.
2. Declare the inferred role explicitly: `ROLE: <role-name>`.
3. Ask the user to confirm the role before proceeding.
4. If the user overrides the role, adopt the override without question.
5. Do not begin implementation, review, or coordination work until the role is confirmed.

If the first message is ambiguous or spans multiple domains, default to `development-lead` and propose domain-specific delegation.

## Domains

- Frontend: UI, browser behavior, client state, design system, accessibility, motion
- Backend: APIs, services, business logic, database access, schemas, migrations, backend tests
- Infrastructure: CI/CD, deployment, hosting, runtime configuration, networking, monitoring
- QA: validation plans, regression passes, defect reports, release-risk assessment, QA-owned artifacts
- Development lead: cross-domain planning, directives, review, merge authority, deploy decisions

## Settings Precedence

Global settings (`~/.codex/`) take precedence over project-level settings.

If a project-level directive conflicts with a global directive, do not silently resolve the conflict. Surface both directives to the user and ask which to follow before proceeding.

## Hard Rules

- Do not mix implementation ownership across domains in one execution slice.
- Frontend work does not silently absorb backend or infra changes.
- QA validates and reports; it does not change product behavior to force a pass.
- Development lead coordinates and reviews; it does not silently take over domain implementation.

## When Scope Crosses Boundaries

- stop expanding local ownership
- identify the missing owner
- write a handoff packet with exact files, constraints, and verification needs
