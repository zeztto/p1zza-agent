---
paths:
  - "**/*.py"
  - "**/*.pyi"
---
# Python Patterns

> Extends [common/patterns.md](../common/patterns.md).

## Protocol for duck typing

```python
class Repository(Protocol):
    def find_by_id(self, id: str) -> dict | None: ...
    def save(self, entity: dict) -> dict: ...
```

## Dataclasses as DTOs

```python
@dataclass
class CreateUserRequest:
    name: str
    email: str
    age: int | None = None
```

- Context managers (`with`) for resource cleanup.
- Generators for lazy, memory-efficient iteration.

Skill: `python-patterns`
