# Planning Gate

Use this before implementation, validation, or release work that changes behavior.

## Required Before Work Starts

- active owning role for the current session
- session bootstrap packet with active role and communication mode
- requested outcome and success criteria
- affected product surface and exact file paths
- API, auth, data, environment, and deployment assumptions
- verification path with exact commands or manual flows
- Git strategy: branch, PR scope, and review path
- delegation plan for independent slices, or explicit `none`

## If Work Crosses Domains

- split the work into domain-owned slices
- keep one primary owner per slice
- emit a handoff packet instead of mixing responsibilities

## Minimum Plan Output

1. role
2. bootstrap packet id or inline bootstrap fields
3. requested outcome
4. constraints and assumptions
5. implementation or validation slices
6. delegation plan
7. verification path
8. required handoffs

## Rules

- Do not start implementation on ambiguous contracts.
- Prefer extending existing code over broad rewrites.
- Make each slice independently verifiable and mergeable.
- Keep the initial plan packet-first.
