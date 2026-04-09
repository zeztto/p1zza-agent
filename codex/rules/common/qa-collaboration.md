# QA Collaboration

Use this when backend, infrastructure, or frontend work hands a validation scope to QA.

## Ownership Model

- Backend owns API behavior, business logic, data rules, and backend test truth.
- Infrastructure owns environments, routing, deployment, runtime constraints, and operational boundaries.
- Frontend owns UI behavior, browser flows, accessibility behavior, and presentation logic.
- QA owns validation truth, regression coverage, defect reports, release-risk calls, and QA-owned artifacts.
- QA may add or edit QA-owned artifacts, but must not silently change product behavior to make validation pass.

## QA Intake Requirements

All QA handoffs should use `qa-contract-v1` from `qa-templates.md`.

Backend-to-QA handoffs should include:

- canonical request and response examples
- validation rules and rejected-input behavior
- async behavior, retries, and eventual-consistency notes when relevant

Infrastructure-to-QA handoffs should include:

- exact environment URLs, hosts, routes, or resource names
- deployment revision or release target
- cache behavior, header rules, auth boundaries, and operational limits

Frontend-to-QA handoffs should include:

- affected routes, states, and browser flows
- responsive and accessibility expectations when relevant
- approved mocks, flags, and visual references when they exist

## Defect And Blocker Rules

- Every failure must identify the exact scenario, environment, observed behavior, and expected behavior.
- Every blocker must name the owning role required to unblock QA.
- Separate confirmed defects from unverified suspicions.
- If contract details, access, fixtures, or release criteria are missing, QA should report `blocked` instead of guessing.

## PR And Release Flow

- `qa-contract-v1` should live in the source development PR body by default.
- `qa-response-v1` should be posted on the source PR by default.
- QA opens a `qa/...` PR only when QA-owned artifacts changed.
- After every QA run, QA also sends `lead-response-v1` to development lead.
- Release judgment should consider the source PR, the `qa-response-v1` result, the QA-to-lead packet, and any QA artifact PR together.
