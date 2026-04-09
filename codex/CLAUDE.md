# Codex Compatibility Note

This file exists so Codex skill references that load `CLAUDE.md` continue to resolve inside the self-contained `codex/` package.

## Source Of Truth

- Primary Codex operating contract: `./AGENTS.md`
- Canonical role definitions: `./agents/`
- Canonical rules: `./rules/`
- Canonical Codex skills: `./.agents/skills/`

## Intent

- Use `AGENTS.md` and the local skills as the main Codex entrypoint.
- Do not treat this file as an additional rule layer beyond compatibility and package orientation.
