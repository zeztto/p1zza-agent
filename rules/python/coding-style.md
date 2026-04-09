---
paths:
  - "**/*.py"
  - "**/*.pyi"
---
# Python Coding Style

> Extends [common/coding-style.md](../common/coding-style.md).

- PEP 8. Type annotations on all signatures.
- Immutability: `@dataclass(frozen=True)` or `NamedTuple`. Never mutate in place.

```python
@dataclass(frozen=True)
class User:
    name: str
    email: str

class Point(NamedTuple):
    x: float
    y: float
```

- Format: **black**. Imports: **isort**. Lint: **ruff**.

Skill: `python-patterns`
