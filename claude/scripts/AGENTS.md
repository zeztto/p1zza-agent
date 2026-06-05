# Claude Scripts Knowledge Base

## SCOPE

This directory contains Claude runtime hooks, setup utilities, and support libraries.

## WHERE TO LOOK

| Task | Location | Notes |
| --- | --- | --- |
| Hook behavior | `hooks/` | Runtime event scripts and guardrails. |
| Shared script utilities | `lib/` | Package manager, formatting, inspection, utility helpers. |
| Package setup | `setup-package-manager.js` | Package manager setup flow. |
| Install behavior | `../install.sh` | Runtime installer lives one level up. |

## CONVENTIONS

- Keep hooks fail-safe unless a hook is intentionally blocking.
- Preserve user runtime state and make backup behavior explicit.
- Keep script output concise and actionable.
- Prefer small utility functions in `lib/` when hooks share behavior.

## ANTI-PATTERNS

- Do not hardcode machine-specific paths.
- Do not let hooks hang indefinitely.
- Do not silently mutate product files from a hook unless the hook contract explicitly says so.
