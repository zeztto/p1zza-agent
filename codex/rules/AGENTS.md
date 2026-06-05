# Codex Rules Knowledge Base

## SCOPE

This directory contains canonical Codex workflow, collaboration, quality, language, and web rules.

## WHERE TO LOOK

| Task | Location | Notes |
| --- | --- | --- |
| Cross-role workflow | `common/` | Planning, delegation, QA, session boundaries, team packets. |
| Frontend delivery and UX | `web/` | Design quality, frontend collaboration, testing, performance. |
| TypeScript security/patterns | `typescript/` | TypeScript-specific patterns and security rules. |
| Python security/patterns | `python/` | Python-specific patterns and security rules. |
| Rule inventory | `README.md` | Directory overview only. |

## CONVENTIONS

- Rules are source-of-truth documents; other docs should reference rather than copy them.
- Shared Claude/Codex rules should stay semantically aligned.
- Packet names must remain stable across runtime packages.
- Keep examples concrete and agent-executable when possible.

## ANTI-PATTERNS

- Do not add product-specific one-off instructions here unless they apply to the runtime package broadly.
- Do not duplicate `AGENTS.md` dispatch tables inside individual rules.
- Do not change QA or release semantics without updating both runtime packages and product documentation.
