# Hooks

## Types

- PreToolUse: validation, parameter modification before tool execution
- PostToolUse: auto-format, checks after tool execution
- Stop: final verification at session end

## Auto-accept permissions

Enable for trusted plans. Disable for exploratory work. Never use dangerously-skip-permissions. Configure `allowedTools` in `~/.claude.json` instead.

## TodoWrite

Use for multi-step task tracking, verifying instruction understanding, real-time steering, and granular progress visibility.
