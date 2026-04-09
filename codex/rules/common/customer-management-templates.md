# Customer Management Templates

Canonical plain-text packets for customer signal capture and routed handoffs.

## Customer Signal

```text
TEMPLATE_VERSION: customer-signal-v1
SIGNAL_REVISION: <revision-id>
SOURCE: support | success | sales | community | interview | analytics | other
CUSTOMER_SEGMENT: <segment or unknown>
ACCOUNT_CONTEXT: <account, user, environment, or none>
PROBLEM_STATEMENT: <what the customer says is wrong or needed>
EVIDENCE: <ticket ids, quotes, screenshots, logs, links, or none>
IMPACT: <blocked workflow, churn risk, trust risk, revenue risk, or none>
FREQUENCY: single | repeated | widespread | unknown
URGENCY: critical | high | normal | low
CONFIDENCE: confirmed | likely | unclear
REQUESTED_OUTCOME: <what the customer wants>
RECOMMENDED_ROUTE: product-owner | product-manager | development-lead | qa | none
OPEN_QUESTIONS: <unknowns or none>
```

## Customer Handoff

```text
TEMPLATE_VERSION: customer-handoff-v1
HANDOFF_REVISION: <revision-id>
TARGET_ROLE: product-owner | product-manager | development-lead | qa
INPUT_SIGNAL_REVISION: <signal revision or none>
GOAL: <exact next outcome>
CUSTOMER_CONTEXT: <who is affected and why it matters>
CONFIRMED_FACTS: <verified facts only>
CUSTOMER_REPORTED_SYMPTOMS: <reported symptoms or none>
BUSINESS_IMPACT: <retention, churn, expansion, credibility, or none>
REQUESTED_ACTION: <triage, scope, investigate, validate, reply>
PRIORITY: critical | high | normal | low
OPEN_QUESTIONS: <unknowns or none>
```

## Rules

- Keep customer claims separate from verified facts.
- Keep field order unchanged.
- Do not omit fields; use `none` when empty.
- Use `customer-signal-v1` before `customer-handoff-v1` when a routed escalation starts from raw customer input.
