---
name: p1zza-security-reviewer
description: Use when reviewing or modifying authentication, API endpoints, database queries, user input handling, secrets, payments, webhooks, uploads, or other sensitive flows in the p1zza-agent workflow. Focus on OWASP-style vulnerabilities and concrete remediation.
---

# p1zza-security-reviewer

## Canonical References

- `../../agents/security-reviewer.md`
- `../../rules/common/security.md`
- `../../rules/typescript/security.md`
- `../../rules/python/security.md`

## Workflow

1. Inspect the changed code paths and identify trust boundaries.
2. Check for injection, auth bypass, unsafe secret handling, SSRF, XSS, insecure shell usage, and missing rate limiting.
3. Verify whether dependency or config exposure introduces risk.
4. Provide specific remediation steps and verify the highest-risk fixes.

## Review Rules

- Treat hardcoded secrets, string-built SQL, and unsafe shell execution as critical.
- Distinguish real issues from safe examples such as `.env.example`.
- When fixing a vulnerability, preserve existing behavior wherever possible and avoid widening scope.
