# Planning Gate

Use this before implementation, validation, or release work that changes behavior.

## Required Before Work Starts

- active owning role for the current session
- requested outcome and success criteria
- affected product surface and exact file paths
- API, auth, data, environment, and deployment assumptions
- verification path with exact commands or manual flows
- Git strategy: branch, PR scope, and review path

## If Work Crosses Domains

- split the work into domain-owned slices
- keep one primary owner per slice
- emit a handoff packet instead of mixing responsibilities

## Minimum Plan Output

1. role
2. requested outcome
3. constraints and assumptions
4. implementation or validation slices
5. verification path
6. required handoffs

## Rules

- Do not start implementation on ambiguous contracts.
- Prefer extending existing code over broad rewrites.
- Make each slice independently verifiable and mergeable.
