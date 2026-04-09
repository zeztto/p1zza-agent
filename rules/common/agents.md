# Agent Orchestration

## Auto-dispatch (no user prompt needed)

frontend feature → frontend-developer
visual design/CSS → frontend-designer
interactive UI → accessibility-reviewer
API/server/DB → backend-developer
infrastructure → infra
complex feature → planner
architecture decision → architect
new feature or bugfix → tdd-guide
code written/modified → code-reviewer
frontend code modified → frontend-reviewer
security-sensitive code → security-reviewer
build failure → build-error-resolver

## Registry

### Implementation
frontend-developer, frontend-designer, backend-developer, infra

### Review
frontend-reviewer, accessibility-reviewer, code-reviewer, typescript-reviewer, python-reviewer, security-reviewer, database-reviewer, performance-optimizer

### Utility
planner, architect, tdd-guide, build-error-resolver, e2e-runner, refactor-cleaner, doc-updater, docs-lookup

## Role Boundaries

Implementation agents have STRICT file path restrictions. See AGENTS.md for boundary table.
Reviewers are read-only. Implementation agents must not cross into other domains.

## Execution

Parallel-launch independent agents. Sequential only when output depends on prior agent.
