---
paths:
  - "**/*.py"
  - "**/*.pyi"
---
# Python Testing

> Extends [common/testing.md](../common/testing.md).

- Framework: **pytest**. Coverage: `pytest --cov=src --cov-report=term-missing`.
- Categorize with `pytest.mark`:

```python
@pytest.mark.unit
def test_calculate_total(): ...

@pytest.mark.integration
def test_database_connection(): ...
```

Skill: `python-testing`
