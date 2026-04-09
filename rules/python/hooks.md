---
paths:
  - "**/*.py"
  - "**/*.pyi"
---
# Python Hooks

> Extends [common/hooks.md](../common/hooks.md).

## PostToolUse

- **black** + **ruff format**: auto-format `.py` on Write|Edit.
- **mypy** or **pyright**: type-check on Write|Edit.
- Warn on `print()` in edited files. Use `logging` instead.
