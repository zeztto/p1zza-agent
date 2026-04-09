# QA Workflow

Use this when implementation is ready for validation.

Canonical copy-paste packets also live in `qa-templates.md`.

## Required Input To QA

- latest contract or directive revision
- exact environment targets, URLs, accounts, fixtures, and flags
- acceptance criteria and exit criteria
- exact checks or scenarios to run
- ownership map for frontend, backend, infrastructure, and QA

## QA Contract Shape

```text
TEMPLATE_VERSION: qa-contract-v1
TEST_REVISION: <revision-id>
ROLE: backend -> qa | infrastructure -> qa | frontend -> qa
GOAL: <exact validation outcome>
CHANGE_SCOPE: <changed behavior under test>
PRODUCT_SURFACE: <affected flows, routes, APIs, jobs, dashboards, or user-visible states>
ENVIRONMENT_TARGET: <environment and exact URLs or resource names>
ACCEPTANCE_CRITERIA: <explicit pass conditions>
REQUIRED_CHECKS: <exact commands, suites, or manual flows>
KNOWN_RISKS: <known gaps, deferred fixes, or areas to watch>
TEST_DATA_AND_ACCOUNTS: <fixtures, accounts, or access prerequisites>
FILE_OWNERSHIP: allowed=<qa-owned paths>; forbidden=<non-qa paths>
EXIT_CRITERIA: <ship, block, or escalate conditions>
OPEN_QUESTIONS: <unknowns or none>
```

## QA Response Shape

```text
TEMPLATE_VERSION: qa-response-v1
REPLY_TO_TEST_REVISION: <revision-id>
STATUS: passed | failed | partial | blocked
COVERAGE: <validated surface>
FAILURES: <confirmed defects or none>
BLOCKERS: <missing access/details or none>
RISK_CALLS: <residual risks or none>
VERIFIED_ENVIRONMENTS: <env list>
ARTIFACTS: <qa-owned files, screenshots, logs, or none>
DELIVERABLE: <ship/block recommendation and next owner>
```

## QA To Lead Shape

```text
TEMPLATE_VERSION: lead-response-v1
REPLY_TO_DIRECTIVE_REVISION: <active lead directive revision>
STATUS: ready | partial | blocked
UNDERSTOOD_SCOPE: <what QA validated and the release meaning>
BLOCKERS: <exact failures, access gaps, or contract gaps, or none>
REQUIRED_DECISIONS: <lead review, retest, or no-ship call, or none>
VERIFICATION_RESULTS: <qa summary, commands, environments, and artifact paths>
DELIVERABLE: <result posted to PR, next owner, and ship recommendation>
NEXT_DIRECTIVE_REQUEST: none | request-next-task
```

## Rules

- Validate against the declared contract, not unstated assumptions.
- Report exact scenario, environment, observed behavior, and expected behavior for every failure.
- Open QA-owned follow-up artifacts only when QA-owned files changed.
- Hand defects back to the owning role separately when ownership differs.
- After every QA run, send `lead-response-v1` to development lead as well as the QA result to the owning domain.
- Keep field order unchanged and use `none` when a packet field is empty.
- If test scope changes, issue a new `TEST_REVISION`.
