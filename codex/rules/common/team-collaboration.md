# Team Collaboration

Use deterministic plain-text packets when handing work between roles.

## Delegation Policy

- Prefer parallel sub-agent execution for independent slices.
- Default sub-agents to the latest available model with `high` reasoning.
- Use `xhigh` reasoning for cross-domain coordination, planning, or migration-heavy tasks.
- If delegation is unavailable, continue locally and call out the impact only when it materially changes execution.

## Development Lead Directive

Canonical copy-paste packets also live in `development-lead-templates.md`.

```text
TEMPLATE_VERSION: lead-directive-v1
DIRECTIVE_REVISION: <revision-id>
TARGET_ROLE: backend | infrastructure | frontend | qa
GOAL: <exact outcome>
OWNERSHIP: <owned surface and out-of-scope areas>
INPUTS: <required packets, PR refs, docs, environments>
FILES_TO_TOUCH: <allowed paths only>
CONSTRAINTS: <hard boundaries, sequencing rules, release notes>
ACCEPTANCE_CHECKS: <exact checks or exit criteria>
HANDOFF_REQUIREMENTS: <next owner and expected packet or PR output>
PRIORITY: critical | high | normal
OPEN_QUESTIONS: <unknowns or none>
```

## Team Response

```text
TEMPLATE_VERSION: lead-response-v1
REPLY_TO_DIRECTIVE_REVISION: <revision-id>
STATUS: ready | partial | blocked
UNDERSTOOD_SCOPE: <one-paragraph summary>
BLOCKERS: <exact missing details or none>
REQUIRED_DECISIONS: <lead decisions needed or none>
VERIFICATION_RESULTS: <checks run and exact failures, if any>
DELIVERABLE: <completed work, remaining gaps, next owner>
NEXT_DIRECTIVE_REQUEST: none | request-next-task
```

## Lead Review Or Release Decision

```text
TEMPLATE_VERSION: lead-review-v1
REVIEW_REVISION: <revision-id>
TARGET_ROLE: backend | infrastructure | frontend | qa | project
STATUS: approved | changes-required | blocked
FINDINGS: <exact review findings or none>
REQUIRED_ACTIONS: <what must happen next or none>
MERGE_DECISION: hold | merge-ready | merged
DEPLOY_DECISION: hold | deploy-ready | deployed
NEXT_OWNER: <who moves next>
```

## Rules

- One directive targets one role only.
- Use exact file paths, packet ids, branch names, and environment names.
- Keep extra narration minimal when the packet is sufficient.
- Merge and deploy readiness come from development-lead review, not implication.
- `lead-response-v1` replies only to `lead-directive-v1`.
- Use `NEXT_DIRECTIVE_REQUEST: request-next-task` only when the assigned scope is fully resolved.
- Keep field order unchanged and use `none` when a packet field is empty.
- When using a formal packet, keep commentary outside the packet to a minimum.
- If `lead-review-v1` is approved with no required actions, the assignee should wait for the next directive instead of sending a redundant follow-up packet.
