# Agent Dispatch

## Auto-dispatch

frontend feature (components/hooks/state/routing) → frontend-developer
visual design (CSS/animation/tokens/layout) → frontend-designer
interactive UI components → accessibility-reviewer
API/server/DB/auth feature → backend-developer
infrastructure (CI/CD/Docker/deploy/env) → infra
complex feature (multi-layer) → planner
architecture decision → architect
new feature or bugfix → tdd-guide
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

## Handoff Protocol

frontend-developer ↔ frontend-designer: visual vs logic split
frontend-developer → backend-developer: API contract needed
backend-developer → database-reviewer: schema review
any implementation → code-reviewer + language reviewer: post-implementation
security-sensitive code → security-reviewer: mandatory before commit

## Execution

Parallel-launch independent agents. Sequential only when output depends on prior agent.
