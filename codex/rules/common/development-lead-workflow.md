# Development Lead Workflow

Use this when the active role is development lead.

## Lead Planning Checklist

Confirm all of the following before directing work:

- bootstrap owner and `session-bootstrap-v1`
- incoming packets, PRs, issues, and open blockers
- missing contracts or unresolved ownership boundaries
- cross-domain handoff order and integration dependencies
- verification, QA, merge, and deployment gates
- branch, PR, and commit topology for the current work slices
- rollback path, release artifacts, and deployment approval path

## Lead Review Gates

- Development lead review is required before merge.
- Development lead release decision is required before final deployment.
- If verification, QA, or ownership is incomplete, issue `lead-review-v1` with `STATUS: blocked` or `changes-required`.

## Packet Lifecycle

- `session-bootstrap-v1` starts a fresh task or materially changed request.
- `lead-response-v1` replies only to `lead-directive-v1`.
- QA also sends `lead-response-v1` after every QA run.
- Use `NEXT_DIRECTIVE_REQUEST: request-next-task` only when the assigned scope is fully resolved.
- If `lead-review-v1` is approved with `REQUIRED_ACTIONS: none`, the assignee should wait for the next directive.

## Output Discipline

- Keep packets parser-safe: exact field order, no omitted fields, `none` for empty values.
- Keep prose inside packet fields only when a formal packet is used.
- Default user-facing coordination to packet-only output.
