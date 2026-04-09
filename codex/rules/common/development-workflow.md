# Development Workflow

Extends [git-workflow.md](./git-workflow.md) with pre-git process.

## Pipeline

0. **Research** (mandatory before new implementation)
   - GitHub code search first: `gh search repos`, `gh search code`
   - Library docs second: Context7, vendor docs, WebFetch, WebSearch
   - Check package registries before writing utilities
   - Prefer adopting proven approaches over net-new code

1. **Plan** → planner agent, identify deps/risks, break into phases

2. **TDD** → tdd-guide agent, RED → GREEN → REFACTOR, 80%+ coverage

3. **Review** → code-reviewer agent, fix CRITICAL/HIGH

4. **Commit** → conventional commits, see [git-workflow.md](./git-workflow.md)

5. **Pre-review** → CI passing, conflicts resolved, branch synced
