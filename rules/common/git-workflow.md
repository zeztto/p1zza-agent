# Git Workflow

## Commit format

```
<type>: <description>

<optional body>
```

Types: feat, fix, refactor, docs, test, chore, perf, ci

Attribution disabled globally via ~/.claude/settings.json.

## PR workflow

1. Analyze full commit history (not just latest)
2. `git diff [base-branch]...HEAD` for all changes
3. Draft comprehensive summary
4. Include test plan
5. Push with `-u` if new branch

Full dev process: [development-workflow.md](./development-workflow.md)
