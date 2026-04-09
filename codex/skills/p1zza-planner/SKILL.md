---
name: p1zza-planner
description: Use for complex feature work, legacy migration planning, architectural changes, and multi-phase refactors in projects following the p1zza-agent workflow. Produces phased implementation plans with exact file paths, risks, dependencies, and testing strategy.
---

# p1zza-planner

## Canonical References

- `../../agents/planner.md`
- `../../AGENTS.md`
- `../../rules/common/delegation.md`

## Workflow

1. Analyze the request, assumptions, and success criteria.
2. Inspect the relevant code paths before proposing changes.
3. Produce mergeable phases with exact file paths and dependency order.
4. Include testing strategy, risks, and mitigation steps.
5. Call out which slices should be delegated to sub-agents and which should stay local.

## Planning Rules

- Prefer extending existing code over rewriting.
- Every step must be independently verifiable.
- Call out where frontend, backend, infra, or security skills should take ownership.
- For `p1zza-bot` migration work, explicitly map legacy modules to destination files in `p1zza-agent`.
