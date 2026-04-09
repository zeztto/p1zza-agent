# Legacy Bot Migration

This document tracks how the legacy `p1zza-bot` operating model was absorbed into the current `p1zza-agent` product layout.

## What The Legacy Bot Contains

The legacy bot was not an application runtime. It was an instruction system for Claude and Codex with:

- global operating contracts
- frontend-only operating contracts
- development lead collaboration rules
- QA collaboration and default workflow rules
- planning and GitHub workflow rules
- session boundary and handoff templates

## Gaps Found In Current `p1zza-agent`

The current `p1zza-agent` already had strong specialist implementation and review roles, but it lacked:

- explicit development-lead ownership and packet formats
- a dedicated QA role and validation workflow
- a generalized session-boundary rule set
- a reusable planning gate for cross-domain work
- an explicit default policy for aggressive sub-agent use with latest-model, high-reasoning delegation

## Migration Strategy

### Phase 1

Integrate legacy operating contracts without changing product code:

- add common rules for planning gate, session boundaries, team collaboration, and QA workflow
- add a common delegation rule for latest-model, high-reasoning sub-agent execution
- add canonical `development-lead` and `qa` agent definitions
- add Codex skills for development lead and QA
- update Codex-facing discovery docs and skill routing

### Phase 2

Normalize and modernize the legacy packets:

- remove machine-specific absolute paths
- compress duplicate frontend/global variants into shared rules
- convert the most useful packet formats into repo-native templates and examples
- preserve frontend contract intake and response semantics in the web rule set

### Phase 3

Decide what becomes permanent product surface:

- keep durable operating contracts inside each runtime package:
  - Claude package: `rules/` and `agents/`
  - Codex package: `rules/`, `agents/`, and `.agents/skills/`
- make the repository root a product shell with installation and handoff docs only
- remove redundant legacy files from the root tree once package parity is verified

## Current Status

- The legacy operating model has been ported into both runtime packages
- Claude package now lives in `claude/`
- Codex package now lives in `codex/`
- The repository root has been reduced to product-level files: `README.md`, `AGENTS.md`, `CLAUDE.md`, `install.sh`, and `docs/`
- Canonical packet semantics are shared across both runtimes:
  - `lead-directive-v1`
  - `lead-response-v1`
  - `lead-review-v1`
  - `qa-contract-v1`
  - `qa-response-v1`
  - `frontend-contract-v1`
  - `frontend-response-v1`
- Sub-agent delegation policy is aligned across both runtimes:
  - use latest available model
  - use `high` reasoning by default
  - use `xhigh` for planning, migration, and cross-domain coordination

## Remaining Backlog

- keep Claude and Codex package contents semantically aligned as each runtime evolves
- decide whether future shared-source generation should replace manual package syncing
