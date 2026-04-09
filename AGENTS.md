# Product Root

This root is the product workspace, not a runtime package.

## Package Locations

- Claude package: `./claude/`
- Codex package: `./codex/`
- Unified installer: `./install.sh`

## Maintenance Rules

- Keep `claude/` and `codex/` semantically aligned.
- Do not rename canonical packets shared across both runtimes.
- When changing shared operating semantics, update both package trees in the same change.
- In versioned product workspaces that define `README.md` and `CHANGELOG.md`, treat them as continuously maintained artifacts, not one-time setup files.
- When a version changes or user-visible product behavior, install flow, agent catalog, or operating semantics change in a workspace that defines both files, update `README.md` and `CHANGELOG.md` in the same change.
- Treat README maintenance and version-log upkeep in versioned workspaces as product capabilities of the agent system itself, not as optional repository housekeeping.
- Write product documentation in an AI-agent-friendly format: explicit paths, deterministic sections, low ambiguity, and packet-first structure when useful.
- Use package-local entrypoints for runtime behavior:
  - Claude: `claude/CLAUDE.md`
  - Codex: `codex/AGENTS.md` and `codex/skills/`
