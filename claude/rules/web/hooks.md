Extends [common/hooks.md](../common/hooks.md).

# Web Hooks

Use project-local tooling only. No remote one-off package execution.

## PostToolUse (order: format > lint > type check)

```json
{ "matcher": "Write|Edit", "command": "pnpm prettier --write \"$FILE_PATH\"" }
```
```json
{ "matcher": "Write|Edit", "command": "pnpm eslint --fix \"$FILE_PATH\"" }
```
```json
{ "matcher": "Write|Edit", "command": "pnpm tsc --noEmit --pretty false" }
```
```json
{ "matcher": "Write|Edit", "command": "pnpm stylelint --fix \"$FILE_PATH\"" }
```

## PreToolUse

Block writes >800 lines:

```json
{
  "matcher": "Write",
  "command": "node -e \"let d='';process.stdin.on('data',c=>d+=c);process.stdin.on('end',()=>{const i=JSON.parse(d);const c=i.tool_input?.content||'';const lines=c.split('\\n').length;if(lines>800){console.error('[Hook] BLOCKED: File exceeds 800 lines ('+lines+' lines)');console.error('[Hook] Split into smaller modules');process.exit(2)}console.log(d)})\""
}
```

## Stop

```json
{ "command": "pnpm build" }
```
