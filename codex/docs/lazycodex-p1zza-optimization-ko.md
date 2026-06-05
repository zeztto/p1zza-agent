# LazyCodex + p1zza-agent 최적 운영 매뉴얼

STATUS: active
LANGUAGE: Korean
SCOPE: Codex runtime
PRIMARY_CONTROL_PLANE: `p1zza-agent`
ACCELERATION_LAYER: `LazyCodex` / `omo@sisyphuslabs`

## 결론

최대 성능을 위한 선택은 둘 중 하나를 버리는 방식이 아니다.

운영 기준은 `p1zza-agent`를 primary control plane으로 두고, `LazyCodex`는 Codex 도구 성능을 높이는 acceleration layer로 제한하는 것이다.

이 조합이 가장 효율적인 이유:

- `p1zza-agent`는 role routing, packet protocol, 한국어 응답 규칙, 파일 경계, QA handoff, release discipline을 담당한다.
- `LazyCodex`는 LSP diagnostics, AST search, post-edit hooks, external docs MCP, command workflow, planner/reviewer helper agent를 제공한다.
- `LazyCodex` 기본 bundled rules를 그대로 쓰면 p1zza-agent의 canonical `AGENTS.md` / `rules/`와 운영 규칙이 겹칠 수 있다.
- 따라서 p1zza-agent 규칙은 유지하고 LazyCodex 도구만 쓰는 구성이 가장 안정적이다.

## 비교

| 항목 | p1zza-agent | LazyCodex |
| --- | --- | --- |
| 주 역할 | 운영 체계, role boundary, packet protocol | Codex plugin, hooks, MCP, workflow commands |
| 강점 | 한국어 packet-first 협업, specialist routing, canonical rules | LSP/AST 기반 탐색, post-edit diagnostics, `ulw` workflow |
| 위험 | 도구 레이어는 상대적으로 가볍다 | bundled rules가 p1zza-agent 규칙과 충돌할 수 있다 |
| 최적 위치 | primary control plane | acceleration layer |
| 사용 기준 | 모든 작업의 기본 운영 기준 | 탐색, 검증, 반복 실행, 진단 보조 |

## 선택 정책

DEFAULT_DECISION:

- `p1zza-agent` wins for behavior, ownership, handoff, language, and completion semantics.
- `LazyCodex` wins for tool leverage, diagnostics, code intelligence, and workflow acceleration.
- Combined mode wins for real work.

DO:

- 새 작업 시작 시 `p1zza-agent`의 `session-bootstrap-v1`과 role decision을 우선한다.
- repository-specific behavior는 `AGENTS.md`, `rules/**`, `skills/p1zza-*`를 source of truth로 둔다.
- `LazyCodex`의 LSP, AST, command, review, planning helper를 보조 도구로 사용한다.
- 큰 작업에서는 p1zza planning gate를 유지하고, LazyCodex command는 execution discipline을 강화하는 데만 사용한다.

DO NOT:

- LazyCodex bundled Hephaestus rule을 p1zza-agent보다 우선하지 않는다.
- p1zza-agent의 packet protocol을 LazyCodex workflow prose로 대체하지 않는다.
- `p1zza-*` skills 대신 generic LazyCodex skills를 기본 routing layer로 쓰지 않는다.
- auto-update나 telemetry가 작업 재현성 또는 privacy expectation을 흔들게 두지 않는다.

## 권장 설치 상태

검증된 권장 상태:

```toml
[features]
plugins = true
plugin_hooks = true
multi_agent = true
child_agents_md = true
goals = true
memories = true

[plugins."omo@sisyphuslabs"]
enabled = true

[plugins."omo@sisyphuslabs".mcp_servers.git_bash]
enabled = false
```

권장 hook guardrails:

```text
CODEX_RULES_DISABLE_BUNDLED=1
OMO_CODEX_DISABLE_POSTHOG=1
LAZYCODEX_AUTO_UPDATE_DISABLED=1
```

의미:

- `CODEX_RULES_DISABLE_BUNDLED=1`: LazyCodex bundled rules는 끄고 project-local rules만 허용한다.
- `OMO_CODEX_DISABLE_POSTHOG=1`: LazyCodex telemetry network call을 비활성화한다.
- `LAZYCODEX_AUTO_UPDATE_DISABLED=1`: 새 세션에서 자동 update가 설치 상태를 바꾸지 않게 한다.

## 사용자용 설치 순서

### 1. p1zza-agent Codex package 설치

```bash
cd /path/to/p1zza-agent/codex
./install.sh
```

또는 원격 설치:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/codex/install.sh)"
```

설치 동작:

- p1zza-agent가 관리하는 `AGENTS.md`, `rules/`, `docs/`, `skills/p1zza-*`, `agents/*.md`를 갱신한다.
- LazyCodex가 설치한 `~/.codex/agents/*.toml` 같은 외부 agent 파일은 보존한다.
- 이전 p1zza-managed 파일은 `~/.p1zza-agent-backups/` 아래에 백업한다.

### 2. LazyCodex 설치

권장값은 autonomous permission을 installer가 다시 쓰지 않게 하는 방식이다.

```bash
npx --yes lazycodex-ai@4.7.5 install --no-tui --no-codex-autonomous
```

### 3. LazyCodex guardrails 확인

다음 파일을 확인한다.

```bash
rg -n 'CODEX_RULES_DISABLE_BUNDLED|OMO_CODEX_DISABLE_POSTHOG|LAZYCODEX_AUTO_UPDATE_DISABLED' \
  ~/.codex/plugins/cache/sisyphuslabs/omo/0.1.0/hooks/hooks.json
```

기대 결과:

- rules hook command에 `CODEX_RULES_DISABLE_BUNDLED=1` 포함
- telemetry hook command에 `OMO_CODEX_DISABLE_POSTHOG=1` 포함
- auto-update hook command에 `LAZYCODEX_AUTO_UPDATE_DISABLED=1` 포함

## 사용자용 명령 가이드

### 평소 작업

사용자는 기존처럼 자연어로 요청하면 된다.

```text
이 프로젝트 분석해줘.
이 기능 구현하고 검증해줘.
보안 관점으로 리뷰해줘.
배포 전 QA 체크해줘.
```

agent는 p1zza-agent 운영 규칙에 따라:

- role을 고른다.
- `session-bootstrap-v1` packet을 낸다.
- 필요하면 planning gate를 연다.
- 구현, 검증, 리뷰를 role boundary 안에서 진행한다.

### LazyCodex를 직접 쓰고 싶을 때

복잡한 plan이 필요할 때:

```text
$ulw-plan "결제 실패 재시도 기능을 안전하게 추가하는 계획을 작성해줘"
```

계획 실행 흐름을 강제하고 싶을 때:

```text
$start-work <plan-name>
```

완료 증거까지 반복 검증하고 싶을 때:

```text
$ulw-loop "검색 인덱싱 문제를 원인 분석부터 배포 검증까지 끝내줘"
```

주의:

- `$ulw-*` commands는 보조 workflow다.
- p1zza-agent packet protocol, role boundary, file-path boundary가 항상 우선한다.
- p1zza-agent가 이미 planning gate를 수행 중이면 `$ulw-plan`을 중복으로 요청하지 않는다.

## 작업 유형별 권장 운영

| 작업 유형 | 기본 owner | LazyCodex 사용 |
| --- | --- | --- |
| repo 분석 | `development-lead` 또는 `planner` | LSP/AST/search MCP로 탐색 가속 |
| frontend 구현 | `frontend-developer` | post-edit LSP diagnostics |
| CSS/layout | `frontend-designer` | comment-checker, diagnostics |
| API/DB/auth | `backend-developer` | LSP + review-work 보조 |
| CI/CD/Docker/env | `infra` | grep/AST로 config 영향 범위 확인 |
| release QA | `qa` | `ulw-loop`로 evidence loop 보조 |
| 보안 리뷰 | `security-reviewer` | external docs MCP, code search 보조 |
| 복잡한 multi-module 작업 | `development-lead` + planner | `$ulw-plan`은 보조 계획 생성에만 사용 |

## 검증 체크리스트

설치 검증:

```bash
test -d ~/.codex/plugins/cache/sisyphuslabs/omo/0.1.0
test -L ~/.local/bin/omo
test -L ~/.local/bin/omo-lsp
test -f ~/.codex/agents/explorer.toml
test -f ~/.codex/agents/plan.toml
```

command smoke:

```bash
~/.local/bin/omo --help
~/.local/bin/omo-lsp --help
~/.local/bin/omo-rules --help
```

rules guardrail smoke:

```bash
PLUGIN_ROOT="$HOME/.codex/plugins/cache/sisyphuslabs/omo/0.1.0" sh -c '
  printf %s "{\"session_id\":\"smoke\",\"transcript_path\":null,\"cwd\":\"$HOME\",\"hook_event_name\":\"SessionStart\",\"model\":\"gpt-5.5\",\"permission_mode\":\"default\",\"source\":\"startup\"}" |
  CODEX_RULES_DISABLE_BUNDLED=1 node "$PLUGIN_ROOT/components/rules/dist/cli.js" hook session-start
' | wc -c
```

기대 결과:

```text
0
```

이 값이 `0`이면 bundled Hephaestus rule이 주입되지 않는 것이다.

## 문제 해결

### p1zza-agent packet 규칙이 흐려질 때

확인:

```bash
rg -n 'CODEX_RULES_DISABLE_BUNDLED' ~/.codex/plugins/cache/sisyphuslabs/omo/0.1.0/hooks/hooks.json
```

없으면 LazyCodex bundled rules가 다시 켜졌을 수 있다. guardrail을 복구한다.

### LazyCodex가 자동 업데이트되는 것 같을 때

확인:

```bash
rg -n 'LAZYCODEX_AUTO_UPDATE_DISABLED' ~/.codex/plugins/cache/sisyphuslabs/omo/0.1.0/hooks/hooks.json
```

없으면 auto-update hook command에 `LAZYCODEX_AUTO_UPDATE_DISABLED=1`을 다시 넣는다.

### telemetry가 걱정될 때

확인:

```bash
rg -n 'OMO_CODEX_DISABLE_POSTHOG' ~/.codex/plugins/cache/sisyphuslabs/omo/0.1.0/hooks/hooks.json
```

추가로 shell profile에 넣어도 된다.

```bash
export OMO_CODEX_DISABLE_POSTHOG=1
export OMO_CODEX_SEND_ANONYMOUS_TELEMETRY=0
```

## Rollback

LazyCodex 설치 전 backup이 있으면 복구:

```bash
cp ~/.codex/backups/lazycodex-*/config.toml ~/.codex/config.toml
```

plugin cache 제거:

```bash
rm -rf ~/.codex/plugins/cache/sisyphuslabs
rm -rf ~/.codex/.tmp/marketplaces/sisyphuslabs
rm -f ~/.local/bin/omo ~/.local/bin/omo-*
rm -f ~/.codex/agents/codex-ultrawork-reviewer.toml \
      ~/.codex/agents/explorer.toml \
      ~/.codex/agents/librarian.toml \
      ~/.codex/agents/metis.toml \
      ~/.codex/agents/momus.toml \
      ~/.codex/agents/plan.toml
```

그 다음 Codex를 재시작한다.

## 운영 원칙

FINAL_POLICY:

- p1zza-agent remains canonical.
- LazyCodex remains enabled as tooling.
- LazyCodex bundled rules remain disabled.
- Telemetry and auto-update remain disabled unless the user explicitly opts in.
- p1zza installers preserve external Codex agents such as LazyCodex `*.toml` agents.
- Manual and current install evidence must stay in sync.
