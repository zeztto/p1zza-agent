# p1zza-agent for Claude

## Core Instructions

- Respond in Korean. Keep technical terms and code identifiers in English.
- Be concise and lead with action.
- Use `rules/` as the canonical rule set. Do not duplicate those rules unless a task needs a focused reminder.
- Keep implementation agents within their file-path boundaries. Review skills are read-only unless the user explicitly asks for remediation.
- In versioned workspaces that define both files, treat `README.md` maintenance and `CHANGELOG.md` version logging as service behavior of the agent system when product-visible changes happen.

## Claude Skills

When running in Claude, use the local role and rule system in this package:

- `p1zza-agent` — umbrella router for installation, migration, and agent-system work
- `p1zza-planner` — complex implementation and refactor planning
- `p1zza-frontend-developer` — React/Next.js frontend implementation
- `p1zza-frontend-designer` — CSS, tokens, animation, layout
- `p1zza-ui-ux-designer` — user flows, wireframes, interaction models, usability reviews, and UX handoffs
- `p1zza-backend-developer` — APIs, server logic, DB, auth, Python backend
- `p1zza-infra` — CI/CD, Docker, deploy, environment config
- `p1zza-development-lead` — cross-domain planning, directives, review, release coordination
- `p1zza-product-manager` — product strategy, roadmap, release scope, and project-manager-style delivery coordination
- `p1zza-product-owner` — backlog ownership, acceptance criteria, business priority, and scope clarification
- `p1zza-customer-management` — customer signal triage, feedback synthesis, churn-risk framing, and routed handoffs
- `p1zza-qa` — validation, regression, defect reporting, release-risk assessment
- `p1zza-code-reviewer` — post-change quality review
- `p1zza-security-reviewer` — security review for auth, input, and sensitive flows

The canonical source of truth remains `agents/*.md`, `rules/**`, and `scripts/**`.

## Operating Model

- Run a planning gate before implementation, validation, or release work with meaningful scope.
- Keep one primary domain owner per execution slice.
- Use deterministic plain-text handoff packets for cross-domain coordination.
- Use sub-agents aggressively for independent slices, preferably in parallel.
- Default sub-agents to the latest available model with `high` reasoning; use `xhigh` for complex planning, migration, and cross-domain coordination.
- Product manager owns product scope, roadmap framing, milestone planning, and project-manager-style execution tracking.
- Product owner owns business priority, backlog readiness, acceptance criteria, and scope clarification.
- Customer management owns customer-signal capture, impact framing, and routed escalation artifacts.
- UI/UX designer owns user flows, wireframes, interaction models, and usability artifacts before visual implementation begins.
- Development lead owns cross-domain coordination, merge authority, and deploy decisions.
- QA validates against declared contracts and reports defects; it does not silently fix product behavior.
- Frontend consumes explicit backend/infrastructure contracts through `frontend-contract-v1` and answers with `frontend-response-v1` when blocked or partial.

# Agent Dispatch

## Auto-dispatch

user flow / wireframe / interaction model / usability audit → ui-ux-designer
customer feedback / support triage / voice-of-customer / churn-risk escalation → customer-management
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

development-lead, product-manager, product-owner, customer-management, ui-ux-designer, qa

## Handoff Protocol

frontend-developer ↔ frontend-designer: visual vs logic split
ui-ux-designer ↔ frontend-designer: UX structure vs visual styling implementation
ui-ux-designer ↔ frontend-developer: interaction intent vs component logic
frontend-developer → backend-developer: API contract needed
frontend-developer → infra: environment/header/caching contract needed
backend-developer → database-reviewer: schema review
any implementation → code-reviewer + language reviewer: post-implementation
security-sensitive code → security-reviewer: mandatory before commit
cross-domain work → development-lead: coordination and next-owner directives
customer signal, support issue, or recurring user pain → customer-management: normalize evidence and route next owner
user-flow ambiguity, usability friction, or wireframe need → ui-ux-designer: define UX intent and next handoff
product scope, roadmap, or milestone framing → product-manager: product direction and delivery planning
business priority or acceptance clarification → product-owner: backlog readiness and acceptance definition
implementation ready for validation → qa: contract-based verification

## Execution

Parallel-launch independent agents. Sequential only when output depends on prior agent.
Use the latest available model and high reasoning for sub-agents by default.
