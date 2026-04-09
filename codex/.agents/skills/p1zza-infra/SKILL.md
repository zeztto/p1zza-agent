---
name: p1zza-infra
description: Use for infrastructure, CI/CD, Docker, deployment, and environment-template work in the p1zza-agent workflow. Do not use for application feature code or business logic.
---

# p1zza-infra

## Canonical References

- `../../../agents/infra.md`
- `../../../rules/common/development-workflow.md`
- `../../../rules/web/frontend-collaboration.md`

## Scope

- Allowed: Docker and compose files, workflow files, deploy and infra folders, env example files, build/config files, server config, package scripts
- Blocked: application source, business logic, database queries, component code, CSS, tests unless the task is strictly build or pipeline related

## Expectations

- Keep secrets out of git and templates.
- Prefer fail-fast pipelines with cache-aware stages.
- Use minimal, production-safe runtime images and health checks where relevant.
- When frontend behavior depends on URLs, headers, caching, cookies, or deployment topology, emit `frontend-contract-v1` with those constraints explicitly.
- When a task touches both infra and app code, own only the infra slice and hand off the rest.
