# UX Design Templates

Canonical plain-text packets for UX discovery and handoff.

## UX Brief

```text
TEMPLATE_VERSION: ux-brief-v1
BRIEF_REVISION: <revision-id>
PRODUCT_SURFACE: <feature, page, flow, or journey>
TARGET_USER: <persona, segment, or unknown>
PRIMARY_GOAL: <what the user is trying to accomplish>
CURRENT_FRICTION: <observed pain, confusion, or none>
ENTRY_POINTS: <where the flow starts>
KEY_STATES: <default, loading, empty, error, success, edge states>
INTERACTION_MODEL: <steps, choices, transitions, feedback>
USABILITY_RISKS: <drop-off, ambiguity, accessibility, cognitive load, or none>
NON_GOALS: <what this brief does not solve>
RECOMMENDED_NEXT_OWNER: ui-ux-designer | frontend-designer | frontend-developer | product-owner
OPEN_QUESTIONS: <unknowns or none>
```

## UX Handoff

```text
TEMPLATE_VERSION: ux-handoff-v1
HANDOFF_REVISION: <revision-id>
TARGET_ROLE: frontend-designer | frontend-developer | product-owner | development-lead
INPUT_BRIEF_REVISION: <brief revision or none>
GOAL: <exact next outcome>
FLOW_SUMMARY: <essential journey and decision points>
STATE_REQUIREMENTS: <required states and transitions>
INTERACTION_RULES: <behavioral expectations>
VISUAL_NOTES: <visual cues, hierarchy needs, or none>
IMPLEMENTATION_NOTES: <constraints, dependencies, or none>
ACCEPTANCE_CHECKS: <experience checks or none>
OPEN_QUESTIONS: <unknowns or none>
```

## Rules

- Keep behavioral intent separate from visual styling detail.
- Keep field order unchanged.
- Do not omit fields; use `none` when empty.
- Use `ux-brief-v1` before `ux-handoff-v1` when the work starts from UX discovery or audit.
