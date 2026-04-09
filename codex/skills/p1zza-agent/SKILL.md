---
name: p1zza-agent
description: Use when the user wants to work in the p1zza-agent style, install or evolve the p1zza-agent Codex port, or migrate the legacy p1zza-bot into this agent system. Routes work to the appropriate p1zza specialist skill and keeps changes aligned with the canonical agent and rule files.
---

# p1zza-agent

Use this as the umbrella skill for the Codex-focused p1zza-agent package.

## Load First

- `../../AGENTS.md`

## Responsibilities

- Start in development-lead/router mode by default unless the user request is already a narrow single-role follow-up.
- Determine the active role before substantive work and emit a `session-bootstrap-v1` packet first.
- Choose the right p1zza skill as early as possible.
- Treat `../../agents/*.md` as the canonical specialist definitions.
- Treat `../../rules/**` as the canonical behavior and quality constraints.
- When updating the agent system itself, keep Codex skills aligned with the canonical files in this package instead of inventing a second source of truth.

## Bootstrap Workflow

1. classify the request by ownership, risk, and whether multiple slices exist
2. pick the active role for session start
3. emit `session-bootstrap-v1`
4. if the work has independent slices, delegate them early in parallel
5. route the execution slice to the owning specialist skill
6. keep outward communication packet-only unless the user explicitly asks for human-readable explanation

## Routing

- Default session bootstrap or coordination-heavy work -> `../p1zza-development-lead/SKILL.md`
- Product strategy, roadmap shaping, release scope, or project-manager-style delivery coordination -> `../p1zza-product-manager/SKILL.md`
- Backlog refinement, acceptance criteria, business priority, or scope clarification -> `../p1zza-product-owner/SKILL.md`
- Frontend feature or client logic -> `../p1zza-frontend-developer/SKILL.md`
- Visual design, CSS, tokens, motion -> `../p1zza-frontend-designer/SKILL.md`
- API, auth, DB, Python backend -> `../p1zza-backend-developer/SKILL.md`
- CI/CD, Docker, deploy, env templates -> `../p1zza-infra/SKILL.md`
- Complex migration or refactor -> `../p1zza-planner/SKILL.md`
- Cross-domain planning, release coordination, explicit handoffs -> `../p1zza-development-lead/SKILL.md`
- Validation, regression, release-risk assessment -> `../p1zza-qa/SKILL.md`
- Code review after implementation -> `../p1zza-code-reviewer/SKILL.md`
- Security-sensitive changes -> `../p1zza-security-reviewer/SKILL.md`

## Migration Guardrails

- Keep the legacy `p1zza-bot/` repository intact until the replacement path is verified.
- Prefer extraction and adaptation over a blind copy of legacy code.
- For migration work, start with a plan that maps legacy capabilities to the new agent/rule/skill structure.
- When a legacy behavior is unclear, inspect the bot source before changing the new system.
- Remove or rewrite machine-specific absolute paths during migration.
