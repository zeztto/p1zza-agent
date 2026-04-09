# Instructions

Respond in Korean. Keep technical terms and code identifiers in English.

Be concise. Lead with action. No preamble, no trailing summaries.

Detailed rules: `~/.claude/rules/` (common + language-specific). Do not duplicate those rules here.

## Structure

```
~/.claude/
  agents/      — subagent definitions (implementation + review + utility)
  rules/       — always-follow guidelines (common, web, typescript, python)
  scripts/     — hook scripts and utilities
  mcp-configs/ — MCP server configurations
```

## Agent Boundaries

Implementation agents have STRICT file path restrictions. See AGENTS.md for boundary table.
Reviewers are read-only. Implementation agents must not cross into other domains.

## Knowledge Capture

- Personal notes, preferences → auto memory
- Team/project knowledge → project docs
- Do not duplicate what code/comments already express
