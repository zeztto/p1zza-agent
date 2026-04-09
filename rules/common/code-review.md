# Code Review

## Mandatory triggers

After writing/modifying code, before shared-branch commits, security-sensitive changes, architectural changes, before merging PRs.

## Pre-review

CI passing, conflicts resolved, branch up-to-date with target.

## Checklist

- Readable, well-named
- Functions <50 lines, files <800 lines
- No nesting >4 levels
- Errors handled explicitly
- No hardcoded secrets, no debug statements
- Tests exist, coverage >= 80%

## Security review → use security-reviewer agent

Triggers: auth/authz, user input, DB queries, file ops, external APIs, crypto, payments.

## Severity

CRITICAL (block) → HIGH (warn) → MEDIUM (info) → LOW (note)

## Approval

Approve: no CRITICAL/HIGH. Block: CRITICAL found.

## Agent dispatch

General → code-reviewer. Security → security-reviewer. Language-specific → typescript-reviewer, python-reviewer, go-reviewer, rust-reviewer.

## Common catches

Security: hardcoded creds, SQL injection, XSS, path traversal, CSRF missing.
Quality: large functions/files, deep nesting, missing error handling, mutation, missing tests.
Performance: N+1 queries, missing pagination, unbounded queries, missing caching.

Related: [testing.md](testing.md), [security.md](security.md), [git-workflow.md](git-workflow.md), [agents.md](agents.md)
