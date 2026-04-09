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
- Use package-local entrypoints for runtime behavior:
  - Claude: `claude/CLAUDE.md`
  - Codex: `codex/AGENTS.md` and `codex/.agents/skills/`
