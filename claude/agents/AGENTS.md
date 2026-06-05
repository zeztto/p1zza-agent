# Claude Agent Role Definitions

## SCOPE

This directory contains canonical Claude role definition files used by the Claude runtime package.

## WHERE TO LOOK

| Task | Location | Notes |
| --- | --- | --- |
| Add or change a role | `*.md` in this directory | Mirror shared semantics in `../../codex/agents/`. |
| Change role routing | `../AGENTS.md` | Update dispatch and handoff protocol. |
| Change Claude runtime orientation | `../CLAUDE.md` | Keep package-level source-of-truth links accurate. |
| Change hooks that depend on roles | `../scripts/hooks/` | Coordinate with role ownership and rule docs. |

## CONVENTIONS

- One role per file.
- Keep role names aligned with Codex when a matching role exists.
- Role definitions should be concise ownership contracts.
- Reviewers are read-only by default.

## ANTI-PATTERNS

- Do not add Codex-specific skill routing here.
- Do not silently diverge from `../../codex/agents/` for shared roles.
- Do not widen implementation role boundaries without updating `../AGENTS.md`.
