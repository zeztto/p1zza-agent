# Performance

## Model selection

- Haiku 4.5: lightweight agents, frequent invocation, worker agents
- Sonnet 4.6: main dev work, orchestration, complex coding
- Opus 4.5: complex architecture, deep reasoning, research

## Context window

Avoid last 20% for: large refactoring, multi-file features, complex debugging.
Safe in high utilization: single-file edits, docs, simple fixes.

## Extended thinking

Enabled by default (31,999 tokens). Toggle: Option+T / Alt+T. Budget: `MAX_THINKING_TOKENS=10000`.

For complex tasks: enable thinking + Plan Mode + multi-critique rounds + split-role sub-agents.

## Build failure → build-error-resolver agent → analyze → fix incrementally → verify each fix.
