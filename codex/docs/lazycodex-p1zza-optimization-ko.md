# LazyCodex Frontend Design Only Rollback Manual

STATUS: active
LANGUAGE: Korean
SCOPE: Codex runtime
PRIMARY_CONTROL_PLANE: `p1zza-agent`
RETAINED_LAZYCODEX_SURFACE: `lazycodex-frontend-ui-ux`

## 결론

LazyCodex 전체 acceleration layer는 더 이상 권장하지 않는다.

현재 운영 기준은 `p1zza-agent`로 롤백하고, LazyCodex에서 실제로 가치가 있었던 frontend visual-design guidance만 standalone Codex skill로 남기는 것이다.

이유:

- LazyCodex multi-agent, workflow command, hook, MCP surface는 토큰 사용량 대비 효율이 낮을 수 있다.
- p1zza-agent는 role routing, packet protocol, 한국어 응답 규칙, QA handoff, file boundary를 이미 제공한다.
- Codex 기본 frontend design output은 약할 수 있으므로 LazyCodex의 visual taste guidance만 보존한다.
- 보존 대상은 design prompt이며, LazyCodex plugin runtime은 아니다.

## 최종 정책

FINAL_POLICY:

- `p1zza-agent` remains canonical.
- LazyCodex plugin is disabled.
- LazyCodex hooks are disabled.
- LazyCodex workflow commands are not active.
- LazyCodex MCP tools are not active.
- LazyCodex `.toml` multi-agent configs are not active.
- LazyCodex telemetry and auto-update are not active.
- Only `lazycodex-frontend-ui-ux` remains as a local skill.

## 권장 Codex 설정

```toml
[features]
plugins = true
plugin_hooks = false
multi_agent = false
child_agents_md = true
goals = true
memories = true

[features.multi_agent_v2]
enabled = false
max_concurrent_threads_per_session = 1
```

`plugins = true`는 OpenAI bundled plugins와 p1zza local skills 사용을 위해 유지한다.

활성 config에 없어야 하는 항목:

```text
[marketplaces.sisyphuslabs]
[plugins."omo@sisyphuslabs"]
[hooks.state."omo@sisyphuslabs:..."]
[agents.plan]
[agents.explorer]
[agents.metis]
[agents.momus]
[agents.librarian]
[agents.codex-ultrawork-reviewer]
```

## 남기는 기능

남기는 LazyCodex 기능은 frontend design guidance뿐이다.

설치 위치:

```text
~/.codex/skills/lazycodex-frontend-ui-ux/SKILL.md
```

이 skill은 다음 작업에서만 사용한다:

- visual direction
- typography
- color system
- motion
- spatial composition
- polish and interaction states

이 skill은 다음 작업에 사용하지 않는다:

- planning workflow
- repo-wide implementation
- backend/API/database work
- code review
- task continuation
- telemetry
- auto-update
- multi-agent delegation

## p1zza와의 관계

기본 routing은 계속 p1zza-agent가 담당한다.

| 작업 | 기본 owner | LazyCodex retained guidance |
| --- | --- | --- |
| UX flow, wireframe, interaction model | `p1zza-ui-ux-designer` | 필요 없음 |
| CSS, tokens, typography, motion, layout | `p1zza-frontend-designer` | generic UI를 피해야 할 때 참조 |
| React/Next.js state, hooks, routing | `p1zza-frontend-developer` | 직접 사용하지 않음 |
| backend/API/DB/auth | `p1zza-backend-developer` | 사용하지 않음 |
| infra/CI/Docker/env | `p1zza-infra` | 사용하지 않음 |
| QA/security/code review | p1zza review/QA skills | 사용하지 않음 |

## Rollback 절차

### 1. p1zza-agent Codex package 재설치

```bash
cd /path/to/p1zza-agent/codex
./install.sh
```

이 설치는 다음을 갱신한다:

- `~/.codex/AGENTS.md`
- `~/.codex/agents/*.md`
- `~/.codex/rules/`
- `~/.codex/docs/`
- `~/.codex/skills/p1zza-*`
- `~/.codex/skills/lazycodex-frontend-ui-ux`

### 2. LazyCodex plugin registration 제거

`~/.codex/config.toml`에서 다음을 제거하거나 비활성화한다:

- `marketplaces.sisyphuslabs`
- `plugins."omo@sisyphuslabs"`
- `hooks.state."omo@sisyphuslabs:*"`
- LazyCodex `[agents.*]` entries

권장값:

```toml
[features]
multi_agent = false
plugin_hooks = false

[features.multi_agent_v2]
enabled = false
max_concurrent_threads_per_session = 1
```

### 3. LazyCodex runtime files backup 이동

삭제 대신 backup으로 이동한다:

```bash
backup="$HOME/.codex/backups/lazycodex-rollback-$(date +%Y%m%dT%H%M%S)"
mkdir -p "$backup/local-bin" "$backup/plugins-cache" "$backup/plugins-data"

mv ~/.codex/plugins/cache/sisyphuslabs "$backup/plugins-cache/" 2>/dev/null || true
mv ~/.codex/plugins/data/omo-sisyphuslabs "$backup/plugins-data/" 2>/dev/null || true
mv ~/.local/bin/omo* "$backup/local-bin/" 2>/dev/null || true
```

## 검증 체크리스트

Config 검증:

```bash
rg -n 'omo@sisyphuslabs|sisyphuslabs|hooks\\.state\\.\"omo|\\[agents\\.(plan|explorer|metis|momus|librarian|codex-ultrawork-reviewer)\\]' ~/.codex/config.toml
```

기대 결과:

```text
no output
```

Feature flag 검증:

```bash
rg -n 'multi_agent = false|plugin_hooks = false|enabled = false|max_concurrent_threads_per_session = 1' ~/.codex/config.toml
```

Standalone skill 검증:

```bash
test -f ~/.codex/skills/lazycodex-frontend-ui-ux/SKILL.md
test -f ~/.codex/skills/p1zza-frontend-designer/SKILL.md
```

LazyCodex active runtime 제거 검증:

```bash
test ! -d ~/.codex/plugins/cache/sisyphuslabs
test ! -d ~/.codex/plugins/data/omo-sisyphuslabs
test ! -e ~/.local/bin/omo
test ! -e ~/.local/bin/omo-lsp
test ! -e ~/.local/bin/omo-rules
```

## 복구

LazyCodex 전체 plugin을 다시 켜야 할 때만 backup에서 복구한다.

```bash
cp ~/.codex/backups/lazycodex-rollback-*/config.toml.before ~/.codex/config.toml
mv ~/.codex/backups/lazycodex-rollback-*/plugins-cache/sisyphuslabs ~/.codex/plugins/cache/
mv ~/.codex/backups/lazycodex-rollback-*/plugins-data/omo-sisyphuslabs ~/.codex/plugins/data/
mv ~/.codex/backups/lazycodex-rollback-*/local-bin/omo* ~/.local/bin/
```

복구 후에는 Codex를 재시작한다.
