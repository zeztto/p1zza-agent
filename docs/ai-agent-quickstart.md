# AI Agent Quickstart

TARGET: AI agents entering a product workspace that uses `p1zza-agent`
SCOPE: first-session onboarding
PRIMARY_LANGUAGE: English

## Purpose

Use this document when an AI agent starts working in a normal product repository that already uses `p1zza-agent`.

This guide is not about maintaining the `p1zza-agent` service itself.
It is about using the service correctly inside an actual product workspace.

## First Read Order

1. Read the product workspace `README.md` to understand the product and current setup.
2. Read the workspace `AGENTS.md` or runtime entrypoint to understand local operating rules.
3. Identify the active runtime:
   - Claude runtime usually starts from `CLAUDE.md`
   - Codex runtime usually starts from `AGENTS.md`
4. Read only the role and rule files needed for the current task.

## What To Figure Out First

Before you change anything, determine:

- what product surface is being changed
- whether the task is product planning, design, frontend, backend, infra, QA, or release work
- which role should own the work
- whether the task changes user-visible behavior
- whether documentation or version notes must be updated in the same change

## Recommended Startup Checklist

1. Infer the owning role for the request.
2. Emit `session-bootstrap-v1` before substantive work.
3. Identify contracts, dependencies, and missing context.
4. If the task spans multiple domains, keep `development-lead` as coordinator.
5. If the task changes a shipped product, plan code, docs, review, and release steps together.

## Typical Product Tasks

### Add or Change a Feature

1. Clarify the user goal and expected outcome.
2. Route product-scoping work to `product-manager` or `product-owner` when needed.
3. Route UX structure to `ui-ux-designer` before styling or component logic if the flow is unclear.
4. Route implementation to the correct engineering owner.
5. Run review and QA before merge when the workspace flow requires it.

### Fix a Bug

1. Capture the reported symptom and the affected surface.
2. Confirm whether the issue is frontend, backend, infra, or mixed.
3. Reproduce or narrow the failure path.
4. Fix the responsible layer without silently absorbing unrelated domains.
5. Update user-visible docs or release notes if behavior changed.

### Prepare a Release

1. Confirm the release scope and target version.
2. Verify code review and required cross-team review gates.
3. Update `README.md` and `CHANGELOG.md` in versioned workspaces that define both files.
4. Merge the scoped change.
5. Sync installed runtimes only after merge.

## Common Role Routing

- product scope, roadmap framing, milestone planning → `product-manager`
- backlog priority, acceptance criteria, scope clarification → `product-owner`
- user flow, wireframe, usability structure → `ui-ux-designer`
- CSS, tokens, layout, visual implementation → `frontend-designer`
- components, hooks, state, routing → `frontend-developer`
- API, DB, auth, server logic → `backend-developer`
- CI/CD, deploy, environment config → `infra`
- validation and release-risk assessment → `qa`

## Do Not

- treat the current workspace like the `p1zza-agent` source repo unless it actually is
- change multiple domains without explicit coordination
- skip packets when the local operating model expects them
- forget docs/version updates in versioned product workspaces

## Minimal First Message Example

```text
TEMPLATE_VERSION: session-bootstrap-v1
role: development-lead
reason: This request affects a product workspace and needs role selection before implementation.
skills: p1zza-development-lead
delegation-plan: inspect the product docs and local runtime rules, then route planning, implementation, and review to the correct owners.
```
