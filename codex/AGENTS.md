# p1zza-agent for Codex

## Core Instructions

- Respond in Korean. Keep technical terms and code identifiers in English.
- Be concise and lead with action.
- Use AI-agent-friendly deterministic packets for outward communication by default. Do not send human-targeted explanatory prose unless the user explicitly asks for it.
- If the user asks for a stakeholder-facing human message such as a CEO update, produce it separately in that stakeholder's language after the packet output.
- Use `rules/` as the canonical rule set. Do not duplicate those rules unless a task needs a focused reminder.
- Keep implementation agents within their file-path boundaries. Review skills are read-only unless the user explicitly asks for remediation.

## Codex Skills

When running in Codex, prefer the local skills in `skills/`:

- `p1zza-agent` — umbrella router for installation, migration, and agent-system work
- `p1zza-planner` — complex implementation and refactor planning
- `p1zza-frontend-developer` — React/Next.js frontend implementation
- `p1zza-frontend-designer` — CSS, tokens, animation, layout
- `p1zza-backend-developer` — APIs, server logic, DB, auth, Python backend
- `p1zza-infra` — CI/CD, Docker, deploy, environment config
- `p1zza-development-lead` — cross-domain planning, directives, review, release coordination
- `p1zza-product-manager` — product strategy, roadmap, release scope, and project-manager-style delivery coordination
- `p1zza-product-owner` — backlog ownership, acceptance criteria, business priority, and scope clarification
- `p1zza-qa` — validation, regression, defect reporting, release-risk assessment
- `p1zza-code-reviewer` — post-change quality review
- `p1zza-security-reviewer` — security review for auth, input, and sensitive flows

The canonical source of truth remains `agents/*.md`, `rules/**`, and `scripts/**`. The Codex skills wrap those documents for Codex discovery.

## Operating Model

- Run a planning gate before implementation, validation, or release work with meaningful scope.
- Start each new session or newly scoped user turn in development-lead/router mode unless the input is already a narrow single-role follow-up tied to an existing packet.
- Determine the active role before substantive work and make the role decision explicit in a startup packet.
- Keep one primary domain owner per execution slice.
- Use deterministic plain-text handoff packets for cross-domain coordination.
- Use sub-agents aggressively for independent slices, preferably in parallel.
- When the work has 2 or more independent slices, or when analysis and implementation can proceed in parallel, dispatch sub-agents early instead of waiting for local completion.
- Default sub-agents to the latest available model with `high` reasoning; use `xhigh` for complex planning, migration, and cross-domain coordination.
- Product manager owns product scope, roadmap framing, milestone planning, and project-manager-style execution tracking.
- Product owner owns business priority, backlog readiness, acceptance criteria, and scope clarification.
- Development lead owns cross-domain coordination, merge authority, and deploy decisions.
- QA validates against declared contracts and reports defects; it does not silently fix product behavior.
- Frontend consumes explicit backend/infrastructure contracts through `frontend-contract-v1` and answers with `frontend-response-v1` when blocked or partial.

## Session Bootstrap

For every fresh thread, fresh task, or materially changed user request:

1. decide whether development-lead/router or a single specialist owns the session start
2. emit a `session-bootstrap-v1` packet before substantive execution
3. identify independent slices and the sub-agent delegation plan
4. dispatch sub-agents early when the slices are real and non-overlapping
5. keep subsequent outward messages packet-first and parser-safe

Default bootstrap role:

- `development-lead` for multi-step work, audits, migrations, ambiguous ownership, or any task that benefits from delegation
- a single specialist only when the request is already narrow, single-domain, and does not need coordination

# Agent Dispatch

## Auto-dispatch

product strategy / roadmap / release scope / project coordination → product-manager
backlog refinement / acceptance criteria / business priority / scope clarification → product-owner
frontend feature (components/hooks/state/routing) → frontend-developer
visual design (CSS/animation/tokens/layout) → frontend-designer
interactive UI components → accessibility-reviewer
API/server/DB/auth feature → backend-developer
infrastructure (CI/CD/Docker/deploy/env) → infra
complex feature (multi-layer) → planner
cross-domain coordination / migration sequencing / release decision → development-lead
architecture decision → architect
new feature or bugfix → tdd-guide
validation / regression / release-risk assessment → qa
code written/modified → code-reviewer
frontend code modified → frontend-reviewer
TS/JS code modified → typescript-reviewer
Python code modified → python-reviewer
auth/payment/sensitive code → security-reviewer
build failure → build-error-resolver
docs/API usage question → docs-lookup

## Role Boundaries — STRICT

### Implementation agents (write code)

| Agent | ALLOWED paths | BLOCKED paths |
|---|---|---|
| frontend-developer | components/, pages/, app/, hooks/, contexts/, stores/ | api/, server/, prisma/, *.py, *.css tokens |
| frontend-designer | *.css, styles/, tokens/, theme/, tailwind.config | api/, server/, hooks/, *.py, tests/ |
| backend-developer | api/, server/, routes/, prisma/, db/, services/, *.py | components/, pages/, hooks/, *.css |
| infra | Dockerfile, .github/, deploy/, *.config.*, .env.example | components/, api/, services/, *.css, *.py app code |

### Review agents (read-only, report findings)

frontend-reviewer, accessibility-reviewer, code-reviewer, typescript-reviewer, python-reviewer, security-reviewer, database-reviewer, performance-optimizer

### Utility agents

planner, architect, tdd-guide, build-error-resolver, e2e-runner, refactor-cleaner, doc-updater, docs-lookup

### Coordination agents

development-lead, product-manager, product-owner, qa

## Handoff Protocol

frontend-developer ↔ frontend-designer: visual vs logic split
frontend-developer → backend-developer: API contract needed
frontend-developer → infra: environment/header/caching contract needed
backend-developer → database-reviewer: schema review
any implementation → code-reviewer + language reviewer: post-implementation
security-sensitive code → security-reviewer: mandatory before commit
cross-domain work → development-lead: coordination and next-owner directives
product scope, roadmap, or milestone framing → product-manager: product direction and delivery planning
business priority or acceptance clarification → product-owner: backlog readiness and acceptance definition
implementation ready for validation → qa: contract-based verification

## Execution

Parallel-launch independent agents. Sequential only when output depends on prior agent.
Use the latest available model and high reasoning for sub-agents by default.
Do not skip role selection, bootstrap packet emission, or delegation planning at session start.
