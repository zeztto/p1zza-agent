# Codex Skills Knowledge Base

## SCOPE

This directory contains Codex skill wrappers for the p1zza-agent workflow. The skills route Codex discovery to canonical files under `../agents/` and `../rules/`.

## WHERE TO LOOK

| Task | Location | Notes |
| --- | --- | --- |
| Umbrella routing | `p1zza-agent/SKILL.md` | Start here for agent-system work. |
| Cross-domain coordination | `p1zza-development-lead/SKILL.md` | Default owner for broad or ambiguous work. |
| Planning | `p1zza-planner/SKILL.md` | Complex implementation and migration plans. |
| Implementation | `p1zza-frontend-*`, `p1zza-backend-developer`, `p1zza-infra` | Keep ownership boundaries strict. |
| Review and validation | `p1zza-code-reviewer`, `p1zza-security-reviewer`, `p1zza-qa` | Review skills report findings unless remediation is requested. |

## CONVENTIONS

- Skill files are wrappers, not the canonical source of role behavior.
- Every skill should reference its canonical role and rule files with relative paths.
- Keep skill descriptions specific enough for Codex skill discovery.
- When role semantics change, update both `../agents/` and the relevant skill wrappers.

## ANTI-PATTERNS

- Do not create a second source of truth inside `SKILL.md`.
- Do not route backend, frontend, infra, QA, and review work through one generic skill when a specialist exists.
- Do not add machine-specific absolute paths to skill files.
