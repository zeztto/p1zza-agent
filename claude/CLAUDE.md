# Instructions

Respond in Korean. Keep technical terms and code identifiers in English.

Be concise. Lead with action. No preamble, no trailing summaries.

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
  agents/        — 24 subagent role definitions
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
