# p1zza-agent Codex Package

This directory is the Codex-focused package for `p1zza-agent`.

## What Is Here

- `AGENTS.md` — Codex workspace operating contract
- `skills/` — Codex skills for routing and specialist work
- `agents/` — canonical role definitions used by the skills
- `rules/` — canonical workflow, collaboration, and quality rules
- `docs/` — Codex-specific migration, compatibility, and optimization notes
- `install.sh` — installs the package directly into `~/.codex`

## Current Scope

- 28 role files plus directory-scoped `AGENTS.md` guidance
- 41 rules
- 14 Codex skills

## Installation

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/codex/install.sh)"
```

로컬 clone에서 실행하려면 `cd codex && ./install.sh`를 사용하면 됩니다.

This installs the managed p1zza files directly into `~/.codex`, preserves unrelated Codex state files, keeps the Codex runtime entrypoint at `~/.codex/AGENTS.md`, and installs Codex skills under `~/.codex/skills/` without touching shared `~/.agents/`.

The installer updates p1zza-managed `agents/*.md` files without removing external Codex agents such as LazyCodex `*.toml` agent configs.

If you need legacy shared skill links for compatibility, run the installer with `P1ZZA_LINK_SHARED_SKILLS=1`.

## Recommended Use

1. Use this directory as the Codex workspace root when you want the self-contained Codex package.
2. Run `./install.sh` when you want the package installed directly into `~/.codex`.
3. Keep root-level Claude installer files separate from this package and out of `~/.codex`.

## LazyCodex Compatibility

Recommended combined mode:

- `p1zza-agent` remains the canonical control plane for role routing, packet protocol, Korean response behavior, and project rules.
- `LazyCodex` / `omo@sisyphuslabs` can be enabled as an acceleration layer for LSP, AST, post-edit diagnostics, and workflow commands.
- LazyCodex bundled rules should stay disabled so they do not override the p1zza-agent `AGENTS.md` and `rules/` contract.
- Telemetry and auto-update hooks should stay disabled unless a user explicitly opts in.
- p1zza-agent installers preserve external LazyCodex agent config files under `~/.codex/agents`.

Korean setup and operation manual: [`docs/lazycodex-p1zza-optimization-ko.md`](./docs/lazycodex-p1zza-optimization-ko.md)

## Notes

- This package is derived from the current `p1zza-agent` repo state.
- The canonical packet set includes `lead-directive-v1`, `lead-response-v1`, `lead-review-v1`, `qa-contract-v1`, `qa-response-v1`, `frontend-contract-v1`, `frontend-response-v1`, `customer-signal-v1`, `customer-handoff-v1`, `ux-brief-v1`, and `ux-handoff-v1`.
- Product-level tutorials live at root `docs/ai-agent-quickstart.md` and `docs/vibe-coding-guide-ko.md`.
