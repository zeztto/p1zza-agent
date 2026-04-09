# Agent Orchestration

## Auto-dispatch (no user prompt needed)

product strategy / roadmap / release scope / project coordination → product-manager
backlog refinement / acceptance criteria / business priority / scope clarification → product-owner
frontend feature → frontend-developer
visual design/CSS → frontend-designer
interactive UI → accessibility-reviewer
API/server/DB → backend-developer
infrastructure → infra
complex feature → planner
cross-domain coordination / release decision → development-lead
architecture decision → architect
new feature or bugfix → tdd-guide
validation / regression / release-risk assessment → qa
code written/modified → code-reviewer
frontend code modified → frontend-reviewer
security-sensitive code → security-reviewer
build failure → build-error-resolver
frontend blocked on backend or infra contract → development-lead

## Registry

### Implementation
frontend-developer, frontend-designer, backend-developer, infra

### Review
frontend-reviewer, accessibility-reviewer, code-reviewer, typescript-reviewer, python-reviewer, security-reviewer, database-reviewer, performance-optimizer

### Utility
planner, architect, tdd-guide, build-error-resolver, e2e-runner, refactor-cleaner, doc-updater, docs-lookup

### Coordination
development-lead, product-manager, product-owner, qa

## Role Boundaries

Implementation agents have STRICT file path restrictions. See AGENTS.md for boundary table.
Reviewers are read-only. Implementation agents must not cross into other domains.
Product roles own product-definition artifacts, prioritization, and acceptance criteria. They do not take over code implementation, merge authority, or deployment decisions.
Development lead coordinates cross-domain work without silently taking implementation ownership.
QA validates against contracts and reports defects; it does not force passes by changing product behavior.
Frontend consumes explicit contracts for backend and infrastructure behavior instead of guessing.

## Execution

Parallel-launch independent agents. Sequential only when output depends on prior agent.
Use the latest available model with `high` reasoning for sub-agents by default, escalating to `xhigh` for complex coordination or migration work.
