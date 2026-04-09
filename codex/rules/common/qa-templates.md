# QA Templates

Canonical plain-text packets for QA handoff and reporting.

## Domain Owner To QA

```text
TEMPLATE_VERSION: qa-contract-v1
TEST_REVISION: <revision-id>
ROLE: backend -> qa | infrastructure -> qa | frontend -> qa
GOAL: <exact validation outcome>
CHANGE_SCOPE: <what changed and what is in scope for QA>
PRODUCT_SURFACE: <affected flows, routes, APIs, jobs, dashboards, or user-visible states>
ENVIRONMENT_TARGET: <local, preview, staging, prod-like, and exact URLs or resource names>
ACCEPTANCE_CRITERIA: <explicit pass conditions>
REQUIRED_CHECKS: <exact commands, scenarios, suites, or manual flows>
KNOWN_RISKS: <known gaps, deferred fixes, or areas to watch>
TEST_DATA_AND_ACCOUNTS: <fixtures, accounts, seed data, or access prerequisites>
FILE_OWNERSHIP: allowed=<qa-owned paths>; forbidden=<non-qa paths>
EXIT_CRITERIA: <ship, block, or escalate conditions>
OPEN_QUESTIONS: <unknowns or none>
```

## QA To Domain Owner

```text
TEMPLATE_VERSION: qa-response-v1
REPLY_TO_TEST_REVISION: <revision-id>
STATUS: passed | failed | partial | blocked
COVERAGE: <what was validated and what was not>
FAILURES: <exact failing scenarios, paths, environments, and observed behavior, or none>
BLOCKERS: <missing access, env issues, contract gaps, or none>
RISK_CALLS: <release risks, regression risks, or none>
VERIFIED_ENVIRONMENTS: <where validation ran and what remained unverified>
ARTIFACTS: <logs, screenshots, outputs, bug ids, or none>
DELIVERABLE: <QA conclusion, required owner response, and ship recommendation>
```

## QA To Development Lead After QA

```text
TEMPLATE_VERSION: lead-response-v1
REPLY_TO_DIRECTIVE_REVISION: <active lead directive revision>
STATUS: ready | partial | blocked
UNDERSTOOD_SCOPE: <what QA validated, what remained out of scope, and the release meaning>
BLOCKERS: <exact failures, access gaps, contract gaps, or none>
REQUIRED_DECISIONS: <lead review, no-ship call, retest request, or none>
VERIFICATION_RESULTS: <qa-response-v1 summary, commands, scenarios, environments, and artifact paths>
DELIVERABLE: <qa result posted to PR, QA artifact PR if any, next owner, and ship recommendation>
NEXT_DIRECTIVE_REQUEST: none | request-next-task
```

## Rules

- Keep field order unchanged.
- Do not omit fields; use `none` when empty.
- After every QA run, QA also sends `lead-response-v1` to development lead.
- If test scope changes, issue a new `TEST_REVISION`.
- If QA is blocked, make the unblock owner explicit in `BLOCKERS` or `DELIVERABLE`.
