# Codex Compatibility Note

This file exists so Codex skill references that load `CLAUDE.md` continue to resolve inside the self-contained `codex/` package.

## Session Initialization

At the start of every session, determine the owning role before any other work. Follow the protocol in `rules/common/session-boundaries.md` — infer the role from the first message, declare it, and confirm with the user.

## Settings Precedence

Global settings (`~/.codex/`) take precedence over project-level settings.

When a project-level directive conflicts with global settings, do not silently follow either side. Instead, surface the conflict to the user and ask which directive to follow before proceeding.

## Source Of Truth

- Primary Codex operating contract: `./AGENTS.md`
- Canonical role definitions: `./agents/`
- Canonical rules: `./rules/`
- Canonical Codex skills: `./skills/`

## Intent

- Use `AGENTS.md` and the local skills as the main Codex entrypoint.
- In versioned workspaces that define both files, treat `README.md` upkeep and `CHANGELOG.md` version logging as built-in product responsibilities when product-visible changes land.
- Do not treat this file as an additional rule layer beyond compatibility and package orientation.
