# p1zza-agent Claude Package

This directory is the Claude Code-focused package for `p1zza-agent`.

## What Is Here

- `CLAUDE.md` — Claude Code operating contract and package orientation
- `AGENTS.md` — dispatch rules, role boundaries, handoff protocol
- `agents/` — canonical role definitions used by the agent system
- `rules/` — canonical workflow, collaboration, and quality rules
- `scripts/` — hook scripts and utility libraries
- `mcp-configs/` — MCP server configurations
- `settings.json` — Claude Code hooks, permissions, and language settings
- `settings.local.json` — local UI preferences
- `install.sh` — installs the package to `~/.claude/`

## Current Scope

- 28 agents
- 41 rules
- 31 hook scripts
- 1 MCP config

## Installation

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/claude/install.sh)"
```

로컬 clone에서 실행하려면 `cd claude && ./install.sh`를 사용하면 됩니다.

This backs up any existing `~/.claude/` and copies all files into place.

## Difference From codex/

| Concern | `claude/` | `codex/` |
|---|---|---|
| Runtime | Claude Code (CLI/desktop/web) | Codex (OpenAI) |
| Entrypoint | `CLAUDE.md` | `AGENTS.md` + `skills/` |
| Hooks | `settings.json` → `scripts/hooks/` | N/A |
| MCP | `mcp-configs/mcp-servers.json` | N/A |
| Installer | `install.sh` → `~/.claude/` | `install.sh` → `~/.codex/` |

Shared content (`AGENTS.md`, `agents/`, `rules/`) is identical across both packages.

## Notes

- The canonical packet set includes `lead-directive-v1`, `lead-response-v1`, `lead-review-v1`, `qa-contract-v1`, `qa-response-v1`, `frontend-contract-v1`, `frontend-response-v1`, `customer-signal-v1`, `customer-handoff-v1`, `ux-brief-v1`, and `ux-handoff-v1`.
- Product-level tutorials live at root `docs/ai-agent-quickstart.md` and `docs/vibe-coding-guide-ko.md`.
