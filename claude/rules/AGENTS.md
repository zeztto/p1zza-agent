# Claude Rules Knowledge Base

## SCOPE

This directory contains canonical Claude workflow, collaboration, quality, language, and web rules.

## WHERE TO LOOK

| Task | Location | Notes |
| --- | --- | --- |
| Cross-role workflow | `common/` | Planning, delegation, session boundaries, QA, team packets. |
| Frontend delivery and UX | `web/` | Design quality, frontend collaboration, testing, performance. |
| TypeScript rules | `typescript/` | TypeScript patterns and security. |
| Python rules | `python/` | Python patterns and security. |
| Rule inventory | `README.md` | Directory overview only. |

## CONVENTIONS

- Shared runtime rules should stay semantically aligned with `../../codex/rules/`.
- Keep rule files focused and referenceable.
- Prefer deterministic packets and exact handoff fields over prose-only process.

## ANTI-PATTERNS

- Do not copy full agent role tables into rules.
- Do not make Claude-only changes to shared packet semantics unless the runtime difference is explicit.
- Do not bury installer or hook behavior inside generic workflow rules.
