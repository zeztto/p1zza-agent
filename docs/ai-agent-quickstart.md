# AI Agent Quickstart

TARGET: AI agents starting work in `p1zza-agent`
SCOPE: product-root onboarding
PRIMARY_LANGUAGE: English

## Purpose

Use this document when an AI agent enters the repository for the first time and needs a fast, deterministic way to start correctly.

## First Read Order

1. Read root `AGENTS.md` to understand product-root maintenance rules.
2. Decide whether the active workspace is the product root, `claude/`, or `codex/`.
3. Read the runtime entrypoint that matches the task:
   - Claude runtime: `claude/CLAUDE.md`
   - Codex runtime: `codex/AGENTS.md`
4. Read only the role/rule files needed for the current task.

## Core Operating Rules

- Start meaningful work with explicit role selection.
- Emit `session-bootstrap-v1` before substantive execution.
- Prefer deterministic plain-text packets over human-style prose.
- Keep `claude/` and `codex/` semantically aligned when shared behavior changes.
- In versioned workspaces that define both files, update `README.md` and `CHANGELOG.md` together.
- Do not silently change only one runtime package when the change is meant to be shared.

## Recommended Startup Checklist

1. Infer the owning role for the task.
2. Confirm whether the task is planning, implementation, review, release, or runtime sync.
3. Identify which files are canonical for that task.
4. Check whether the task changes versioned product behavior.
5. If yes, plan `README.md`, `CHANGELOG.md`, and installer metadata updates in the same change.
6. If the task spans multiple domains, keep `development-lead` as coordinator.

## Common Task Flows

### Add a New Role

1. Add role definition files under both `claude/agents/` and `codex/agents/`.
2. Add or update Codex skill wrappers when the role should be discoverable in Codex.
3. Update both packages' dispatch/registry guidance.
4. Update root product docs and version metadata.
5. Request Claude-side review before merge when Claude package files changed.

### Prepare a Release

1. Implement the scoped change.
2. Run review on the current diff.
3. Update `README.md`, `CHANGELOG.md`, and version metadata.
4. Create PR and merge.
5. Sync installed runtimes after merge.

### Sync Installed Runtimes

1. Prefer the package installer or root installer first.
2. Verify actual installed file counts and key-file diffs.
3. If installer assumptions are broken, use minimal manual sync on package-managed paths only.
4. Preserve unrelated user/runtime state.

## Do Not

- replace deterministic packets with long stakeholder prose unless explicitly requested
- let review or QA silently mutate product behavior
- forget runtime sync after merge when the user asks for deployed local behavior
- treat stale package README files as optional if they describe current runtime state

## Minimal First Message Example

```text
TEMPLATE_VERSION: session-bootstrap-v1
role: development-lead
reason: This task changes shared product behavior and needs coordinated execution.
skills: p1zza-development-lead
delegation-plan: inspect current docs and runtime boundaries, then implement the scoped change and review it before merge.
```
