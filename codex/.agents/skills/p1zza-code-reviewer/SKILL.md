---
name: p1zza-code-reviewer
description: Use after code changes in the p1zza-agent workflow to review diffs for bugs, regressions, maintainability issues, and missing tests. Focus on actionable findings with high confidence rather than style-only feedback.
---

# p1zza-code-reviewer

## Canonical References

- `../../../agents/code-reviewer.md`
- `../../../rules/common/code-review.md`

## Workflow

1. Inspect `git diff --staged` and `git diff`; fall back to recent commits if needed.
2. Read full files for context, not only diff hunks.
3. Prioritize security, regressions, correctness, and missing tests.
4. Report only issues with strong confidence and concrete fixes.

## Output Expectations

- Findings first, ordered by severity.
- Include file path and the specific risk.
- Keep summaries brief after the findings.
- Ignore stylistic nits unless they hide a real defect.
