# PROJECT KNOWLEDGE BASE

**Generated:** 2026-06-06
**Commit:** `d2aceb8`
**Branch:** `main`

## OVERVIEW

`p1zza-agent` is a dual-package AI agent runtime for Claude and Codex. The root is a product-maintenance workspace; runtime behavior lives under `claude/` and `codex/`.

## Package Locations

- Claude package: `./claude/`
- Codex package: `./codex/`
- Unified installer: `./install.sh`

## STRUCTURE

```text
p1zza-agent/
├── AGENTS.md          # product-root maintenance contract
├── CLAUDE.md          # product-root compatibility note
├── README.md          # current product usage and version summary
├── CHANGELOG.md       # canonical version log
├── install.sh         # unified Claude + Codex installer
├── claude/            # Claude runtime package
├── codex/             # Codex runtime package
└── docs/              # product-level tutorials
```

## WHERE TO LOOK

| Task | Location | Notes |
| --- | --- | --- |
| Change product version or public usage docs | `README.md`, `CHANGELOG.md`, installers | Update together when product-visible behavior changes. |
| Change Claude runtime behavior | `claude/` | Keep aligned with `codex/` when semantics are shared. |
| Change Codex runtime behavior | `codex/` | Runtime entrypoint is `codex/AGENTS.md`; skills live in `codex/skills/`. |
| Change shared agent role semantics | `claude/agents/`, `codex/agents/` | Mirror role changes across both runtimes unless intentionally runtime-specific. |
| Change shared workflow rules | `claude/rules/`, `codex/rules/` | Keep packet names and operating semantics aligned. |
| Change installer behavior | `install.sh`, `claude/install.sh`, `codex/install.sh` | Preserve unrelated user runtime state and document backup behavior. |

## Maintenance Rules

- Keep `claude/` and `codex/` semantically aligned.
- Do not rename canonical packets shared across both runtimes.
- When changing shared operating semantics, update both package trees in the same change.
- In versioned product workspaces that define `README.md` and `CHANGELOG.md`, treat them as continuously maintained artifacts, not one-time setup files.
- When a version changes or user-visible product behavior, install flow, agent catalog, or operating semantics change in a workspace that defines both files, update `README.md` and `CHANGELOG.md` in the same change.
- Treat README maintenance and version-log upkeep in versioned workspaces as product capabilities of the agent system itself, not as optional repository housekeeping.
- Write product documentation in an AI-agent-friendly format: explicit paths, deterministic sections, low ambiguity, and packet-first structure when useful.
- Use package-local entrypoints for runtime behavior:
  - Claude: `claude/CLAUDE.md`
  - Codex: `codex/AGENTS.md` and `codex/skills/`

## CONVENTIONS

- Prefer deterministic, AI-agent-readable docs: explicit paths, stable sections, low ambiguity.
- Keep root files product-level; do not put runtime-only instructions in root unless they affect both packages.
- Version metadata appears in `README.md`, `CHANGELOG.md`, `install.sh`, and `codex/install.sh`.
- Codex runtime installs target `~/.codex/`; Claude runtime installs target `~/.claude/`.

## ANTI-PATTERNS

- Do not duplicate full rule content across docs when a canonical `rules/` file exists.
- Do not replace runtime package directories wholesale in installers if that would remove third-party runtime artifacts.
- Do not update only one runtime package for a shared semantic change.
- Do not treat `~/.codex/.agents/skills/` as the canonical Codex skill target; use `~/.codex/skills/p1zza-*`.

## COMMANDS

```bash
# Install both runtimes interactively
./install.sh

# Install only Codex package from local clone
cd codex && ./install.sh

# Shell syntax check for installers
bash -n install.sh && bash -n codex/install.sh && bash -n claude/install.sh
```

## NOTES

- This repo currently has existing runtime AGENTS files at root, `claude/`, and `codex/`.
- `codex/docs/lazycodex-p1zza-optimization-ko.md` documents the supported p1zza-agent primary + LazyCodex acceleration setup.
- When generated knowledge conflicts with `claude/AGENTS.md` or `codex/AGENTS.md`, package-local runtime entrypoints win for files inside those packages.
