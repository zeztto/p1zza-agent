---
name: p1zza-agent
description: Use when the user wants to work in the p1zza-agent style, install or evolve the p1zza-agent Codex port, or migrate the legacy p1zza-bot into this agent system. Routes work to the appropriate p1zza specialist skill and keeps changes aligned with the canonical agent and rule files.
---

# p1zza-agent

Use this as the umbrella skill for the Codex-focused p1zza-agent package.

## Load First

- `../../../AGENTS.md`

## Responsibilities

- Choose the right p1zza skill as early as possible.
- Treat `../../../agents/*.md` as the canonical specialist definitions.
- Treat `../../../rules/**` as the canonical behavior and quality constraints.
- When updating the agent system itself, keep Codex skills aligned with the canonical files in this package instead of inventing a second source of truth.

## Routing

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

- Keep `../../../p1zza-bot/` intact until the replacement path is verified.
- Prefer extraction and adaptation over a blind copy of legacy code.
- For migration work, start with a plan that maps legacy capabilities to the new agent/rule/skill structure.
- When a legacy behavior is unclear, inspect the bot source before changing the new system.
- Remove or rewrite machine-specific absolute paths during migration.
