---
paths:
  - "**/*.py"
  - "**/*.pyi"
---
# Python Security

> Extends [common/security.md](../common/security.md).

## Secrets

`dotenv` + `os.environ`. Never hardcode. Fail on missing keys.

```python
from dotenv import load_dotenv
load_dotenv()
api_key = os.environ["API_KEY"]  # KeyError if absent
```

## Scanning

`bandit -r src/` for static security analysis.

Skill: `django-security` (Django projects)
