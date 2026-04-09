# Security

## Pre-commit checklist

- No hardcoded secrets (API keys, passwords, tokens)
- All user inputs validated
- SQL injection: parameterized queries only
- XSS: sanitized HTML
- CSRF protection enabled
- Auth/authz verified
- Rate limiting on endpoints
- Error messages leak no sensitive data

## Secrets

Never in source. Use env vars or secret manager. Validate at startup. Rotate any exposed.

## If security issue found

STOP → security-reviewer agent → fix CRITICAL → rotate exposed secrets → scan codebase for similar.
