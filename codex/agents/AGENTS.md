# Codex Agent Role Definitions

## SCOPE

This directory contains canonical Codex role definition files used by `codex/AGENTS.md` and `codex/skills/p1zza-*`.

## WHERE TO LOOK

| Task | Location | Notes |
| --- | --- | --- |
| Add or change a role | `*.md` in this directory | Keep the matching Claude role aligned when the semantics are shared. |
| Change role routing | `../AGENTS.md` | Update the dispatch table and handoff protocol. |
| Change Codex skill wrapper behavior | `../skills/p1zza-*/SKILL.md` | Skill files should point back to these canonical role docs. |
| Change review ownership | reviewer role files | Review agents remain read-only unless explicitly asked to remediate. |

## CONVENTIONS

- One role per file.
- Keep role names stable; packet routing depends on them.
- Role definitions describe ownership, responsibilities, and boundaries, not implementation plans.
- If a role exists in both `claude/agents/` and `codex/agents/`, shared semantics should match.

## ANTI-PATTERNS

- Do not put Codex skill implementation details here; keep those in `../skills/`.
- Do not silently widen an implementation role's file-path boundary.
- Do not turn a review role into a write-capable role without updating `../AGENTS.md` and changelog context.
