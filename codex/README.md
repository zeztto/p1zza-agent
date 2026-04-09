# p1zza-agent Codex Package

This directory is the Codex-focused package for `p1zza-agent`.

## What Is Here

- `AGENTS.md` — Codex workspace operating contract
- `skills/` — 10 Codex skills for routing and specialist work
- `agents/` — canonical role definitions used by the skills
- `rules/` — canonical workflow, collaboration, and quality rules
- `docs/` — migration notes from the legacy `p1zza-bot`
- `install.sh` — installs the package directly into `~/.codex`

## Current Scope

- 24 agents
- 39 rules
- 10 Codex skills

## Installation

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/codex/install.sh)"
```

로컬 clone에서 실행하려면 `cd codex && ./install.sh`를 사용하면 됩니다.

This installs the managed p1zza files directly into `~/.codex`, preserves unrelated Codex state files, keeps the Codex runtime entrypoint at `~/.codex/AGENTS.md`, and installs Codex skills under `~/.codex/skills/` without touching shared `~/.agents/`.

If you need legacy shared skill links for compatibility, run the installer with `P1ZZA_LINK_SHARED_SKILLS=1`.

## Recommended Use

1. Use this directory as the Codex workspace root when you want the self-contained Codex package.
2. Run `./install.sh` when you want the package installed directly into `~/.codex`.
3. Keep root-level Claude installer files separate from this package and out of `~/.codex`.

## Notes

- This package is derived from the current `p1zza-agent` repo state.
- The canonical packet set includes `lead-directive-v1`, `lead-response-v1`, `lead-review-v1`, `qa-contract-v1`, `qa-response-v1`, `frontend-contract-v1`, and `frontend-response-v1`.
