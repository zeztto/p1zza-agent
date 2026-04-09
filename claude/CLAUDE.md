# Instructions

Be concise. Lead with action. No preamble, no trailing summaries.

## Session Initialization

At the start of every session, determine the owning role before any other work. Follow the protocol in `rules/common/session-boundaries.md` — infer the role from the first message, declare it, and confirm with the user.

## Settings Precedence

Global settings (`~/.claude/`) take precedence over project-level settings.

When a project-level directive conflicts with global settings, do not silently follow either side. Instead, surface the conflict to the user and ask which directive to follow before proceeding.

## Source Of Truth

- Agent dispatch and role boundaries: `./AGENTS.md`
- Canonical role definitions: `./agents/`
- Canonical rules: `./rules/`
- Hook scripts: `./scripts/`
- MCP configurations: `./mcp-configs/`
- Settings: `./settings.json`, `./settings.local.json`
- Installer: `./install.sh` (installs to `~/.claude/`)

## Structure

```
claude/
  AGENTS.md      — dispatch rules, role boundaries, handoff protocol
  agents/        — 26 subagent role definitions
  rules/         — always-follow guidelines (common, web, typescript, python)
  scripts/       — hook scripts and utilities
  mcp-configs/   — MCP server configurations
  settings.json  — Claude Code hooks, permissions, language
  settings.local.json — local UI preferences
  install.sh     — ~/.claude/ installer
```

## Operating Model

Do not duplicate rule content. Read and follow from source.

- **Planning gate** (`rules/common/planning-gate.md`): Run before implementation, validation, or release work with meaningful scope.
- **Session boundaries** (`rules/common/session-boundaries.md`): One session owns one primary domain. Do not mix implementation ownership.
- **Delegation** (`rules/common/delegation.md`): Use sub-agents aggressively for independent slices. Latest available model, `high` reasoning by default, `xhigh` for planning/migration/cross-domain coordination.
- **Team collaboration** (`rules/common/team-collaboration.md`): Deterministic plain-text handoff packets for cross-domain work.

## Agent Dispatch

See `AGENTS.md` for the full dispatch table and role boundary matrix.

- Implementation agents have STRICT file path restrictions.
- Reviewers are read-only.
- Product manager owns product scope, roadmap framing, milestone planning, and project-manager-style execution tracking.
- Product owner owns business priority, backlog readiness, acceptance criteria, and scope clarification.
- Development lead owns cross-domain coordination, merge authority, and deploy decisions.
- QA validates against declared contracts; it does not change product behavior.

## Canonical Packets

`lead-directive-v1`, `lead-response-v1`, `lead-review-v1`, `qa-contract-v1`, `qa-response-v1`, `frontend-contract-v1`, `frontend-response-v1`

Templates: `rules/common/development-lead-templates.md`, `rules/common/qa-templates.md`

## Knowledge Capture

- Personal notes, preferences → auto memory
- Team/project knowledge → project docs
- Do not duplicate what code/comments already express

## Intent

- Use this directory as the self-contained Claude Code package.
- Run `install.sh` to deploy to `~/.claude/`.
- Do not treat this file as an additional rule layer beyond orientation and package structure.
