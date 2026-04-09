# Delegation

Use sub-agents aggressively for independent workstreams when tooling and higher-priority instructions allow it.

## Default Policy

- Prefer sub-agents over single-threaded execution when the work naturally splits into independent slices.
- Prefer parallel delegation for non-overlapping tasks.
- Give each sub-agent one clear owner role and a bounded write scope.
- Keep the main thread focused on coordination, integration, and unblockers while delegated work runs.

## Model And Reasoning Policy

- Use the latest available model in the current environment for sub-agents.
- Use `high` reasoning effort by default for delegated work.
- Escalate to `xhigh` for complex planning, cross-domain coordination, risky migrations, or ambiguous architecture work.
- Do not downshift to lighter reasoning unless the task is truly trivial or the user explicitly asks for speed over depth.

## Fallback

- If sub-agent tooling is unavailable or blocked, continue locally.
- When that fallback materially changes execution quality or speed, state it explicitly.

## Discipline

- Do not delegate urgent blocking work if local action is faster.
- Do not duplicate delegated work in the main thread.
- Prefer concrete handoffs with exact files, constraints, and expected output.
