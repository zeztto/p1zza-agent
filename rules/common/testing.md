# Testing

## Coverage: 80% minimum

All required: unit (functions/components), integration (APIs/DB), E2E (critical flows).

## TDD (mandatory)

1. Write test (RED) — must FAIL
2. Minimal implementation (GREEN) — must PASS
3. Refactor (IMPROVE) — verify 80%+ coverage

## Failure troubleshooting

tdd-guide agent → check isolation → verify mocks → fix implementation (not tests, unless tests are wrong).

## Structure: AAA

Arrange → Act → Assert. Descriptive names explaining behavior under test.
