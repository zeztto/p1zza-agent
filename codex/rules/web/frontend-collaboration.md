# Frontend Collaboration

Use this when backend or infrastructure work hands requirements to frontend work.

## Source Of Truth

- Frontend consumes backend and infrastructure contracts; it does not invent them.
- If API, auth, environment, caching, or deployment behavior is missing or ambiguous, frontend must raise a change request instead of guessing.
- Backend owns API and auth semantics. Infrastructure owns environment, URL, header, caching, CDN, proxy, and deployment constraints.

## Contract Packet

```text
TEMPLATE_VERSION: frontend-contract-v1
CONTRACT_REVISION: <revision-id>
CONTRACT_STATUS: stable | draft | blocked
ROLE: backend -> frontend | infrastructure -> frontend
GOAL: <exact frontend outcome>
PRODUCT_SURFACE: <affected pages, flows, components, user-visible states>
API_CONTRACT: <endpoints, methods, params, headers, status codes, examples>
AUTH_CONTRACT: <session rules, guards, cookie/token behavior>
DATA_SHAPES: <canonical fields, enums, nullability, pagination, sorting>
ERROR_CASES: <known failures and intended UI handling>
ENVIRONMENT: <URLs, domains, flags, CORS/caching/CSP constraints, preview/staging/prod notes>
MOCKING_RULES: <allowed, forbidden, or temporary mocks and expiry conditions>
FILE_OWNERSHIP: allowed=<frontend paths>; forbidden=<backend/infra paths>
ACCEPTANCE_CHECKS: <exact frontend checks to run>
OPEN_QUESTIONS: <unknowns or none>
```

## Frontend Response Packet

```text
TEMPLATE_VERSION: frontend-response-v1
REPLY_TO_CONTRACT_REVISION: <revision-id>
STATUS: ready | partial | blocked
UNDERSTOOD_SCOPE: <one-paragraph summary>
BLOCKERS: <missing or conflicting details or none>
CHANGE_REQUESTS: <smallest contract change needed or none>
ASSUMPTIONS_USED: <only packet-approved assumptions or none>
VERIFICATION_RESULTS: <checks run and exact failures, if any>
DELIVERABLE: <completed work, remaining gap, next owner>
```

## Rules

- Keep file ownership explicit.
- Do not patch backend or infrastructure files just to unblock frontend unless the handoff explicitly allows it.
- If `CONTRACT_STATUS` is `draft` or `blocked`, do not present the feature as complete unless the remaining gap is explicitly accepted.
- Use exact endpoint names, field names, header names, environment names, and absolute file paths.
