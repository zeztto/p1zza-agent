# p1zza-agent

[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)](https://github.com/sungwoonchun/p1zza-agent)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Based on ECC](https://img.shields.io/badge/based%20on-ECC%20v1.10-orange.svg)](https://github.com/affaan-m/everything-claude-code)

[English](#english) | [한국어](#한국어)

---

## English

**Lightweight, opinionated fork of [Everything Claude Code (ECC)](https://github.com/affaan-m/everything-claude-code).**

p1zza-agent strips ECC down to the essentials — 22 agents, 28 rules, 1 MCP, 14 hooks — removing 10+ unused languages, 20+ MCPs, and all enterprise overhead. Every document is optimized for AI agent consumption, not human reading. Implementation agents have strict file-path boundaries to prevent cross-domain contamination.

### What's Different from ECC

| | ECC v1.10 | p1zza-agent v0.1.0 |
|---|---|---|
| Agents | 47 (all reviewers) | 22 (4 implementation + 8 review + 10 utility) |
| Languages | 13 rule sets | 3 (TypeScript, Python, Web) |
| MCP servers | 27 | 1 (Context7) |
| Hooks | 31 | 14 |
| ECC plugin dependency | Required | None (fully standalone) |
| Agent role boundaries | None | Strict file-path restrictions |
| Document style | Human-readable | AI-agent optimized |

### Features

- **4 Implementation Agents** with strict domain boundaries
  - `frontend-developer` — React/Next.js components, hooks, state, routing
  - `frontend-designer` — CSS, animations, tokens, layout, typography
  - `backend-developer` — APIs, server logic, database, auth
  - `infra` — CI/CD, Docker, deployment, environment config
- **8 Review Agents** — frontend, accessibility, code, TypeScript, Python, security, database, performance
- **10 Utility Agents** — planner, architect, TDD guide, build resolver, E2E runner, and more
- **Strict Role Boundaries** — frontend agents cannot touch backend code and vice versa
- **Handoff Protocol** — agents delegate to the right specialist automatically
- **14 Quality Hooks** — git safety, commit quality, console.log detection, format/typecheck on stop
- **1 MCP** — Context7 for live library documentation (free, no API key)

### Quick Start

```bash
# 1. Clone
git clone https://github.com/sungwoonchun/p1zza-agent.git
cd p1zza-agent

# 2. Install (backs up existing ~/.claude/ automatically)
./install.sh

# 3. Restart Claude Code
claude
```

That's it. 22 agents, 28 rules, 14 hooks, and Context7 MCP are ready.

### What's Inside

```
p1zza-agent/
├── CLAUDE.md                  # Global instructions for Claude
├── AGENTS.md                  # Agent dispatch rules + role boundaries
├── settings.json              # Hooks, permissions, preferences
├── settings.local.json        # Local overrides
├── install.sh                 # One-command installer
│
├── agents/                    # 22 specialized agents
│   ├── frontend-developer.md  #   React/Next.js implementation
│   ├── frontend-designer.md   #   CSS/animation/design tokens
│   ├── backend-developer.md   #   API/server/DB implementation
│   ├── infra.md               #   CI/CD/Docker/deployment
│   ├── frontend-reviewer.md   #   Frontend code review
│   ├── accessibility-reviewer.md  # WCAG 2.1 AA audit
│   ├── code-reviewer.md       #   General code review
│   ├── typescript-reviewer.md  #   TS/JS specific review
│   ├── python-reviewer.md     #   Python specific review
│   ├── security-reviewer.md   #   Security vulnerability scan
│   ├── ...                    #   + 12 more utility agents
│
├── rules/                     # 28 rule files
│   ├── common/                #   10 language-agnostic rules
│   ├── web/                   #   7 frontend/web rules
│   ├── typescript/            #   5 TS/JS rules
│   └── python/                #   5 Python rules
│
├── mcp-configs/               # 1 MCP server
│   └── mcp-servers.json       #   Context7 (live docs lookup)
│
└── scripts/                   # 31 hook scripts + utilities
    ├── hooks/                 #   20 hook scripts
    └── lib/                   #   11 shared utilities
```

### Agent Role Boundaries

Implementation agents have **strict file-path restrictions**:

| Agent | Allowed | Blocked |
|---|---|---|
| `frontend-developer` | components/, hooks/, pages/, app/ | api/, server/, prisma/, *.py, *.css tokens |
| `frontend-designer` | *.css, styles/, tokens/, theme/ | api/, server/, hooks/, *.py, tests/ |
| `backend-developer` | api/, server/, prisma/, services/ | components/, pages/, hooks/, *.css |
| `infra` | Dockerfile, .github/, deploy/, configs | components/, api/, services/, app code |

Review agents are read-only and cannot modify code.

### Customization

**Add a language**: Create `rules/<language>/` with `coding-style.md`, `hooks.md`, `patterns.md`, `security.md`, `testing.md`.

**Add an agent**: Create `agents/<name>.md` with YAML frontmatter (`name`, `description`, `tools`, `model`) and add to `AGENTS.md` registry.

**Add an MCP**: Edit `mcp-configs/mcp-servers.json`.

### Credits

This project is a lightweight fork of **[Everything Claude Code (ECC)](https://github.com/affaan-m/everything-claude-code)** by [@affaan-m](https://github.com/affaan-m) and contributors. ECC is the comprehensive, full-featured original — p1zza-agent is an opinionated subset optimized for web + TS + Python workflows with strict agent boundaries.

### License

MIT — same as the original ECC project.

---

## 한국어

**[Everything Claude Code (ECC)](https://github.com/affaan-m/everything-claude-code)의 경량화 포크.**

p1zza-agent는 ECC에서 핵심만 추출합니다 — 22개 에이전트, 28개 규칙, 1개 MCP, 14개 훅. 10개 이상의 미사용 언어, 20개 이상의 MCP, 엔터프라이즈 오버헤드를 모두 제거했습니다. 모든 문서는 AI 에이전트가 효율적으로 처리하도록 최적화되어 있습니다. 구현 에이전트는 엄격한 파일 경로 제한으로 크로스 도메인 오염을 방지합니다.

### ECC와 차이점

| | ECC v1.10 | p1zza-agent v0.1.0 |
|---|---|---|
| 에이전트 | 47개 (리뷰어만) | 22개 (구현 4 + 리뷰 8 + 유틸리티 10) |
| 언어 | 13개 규칙 세트 | 3개 (TypeScript, Python, Web) |
| MCP 서버 | 27개 | 1개 (Context7) |
| 훅 | 31개 | 14개 |
| ECC 플러그인 의존성 | 필수 | 없음 (완전 독립) |
| 에이전트 역할 경계 | 없음 | 엄격한 파일 경로 제한 |
| 문서 스타일 | 사람 가독성 | AI 에이전트 최적화 |

### 주요 기능

- **4개 구현 에이전트** — 엄격한 도메인 경계
  - `frontend-developer` — React/Next.js 컴포넌트, 훅, 상태, 라우팅
  - `frontend-designer` — CSS, 애니메이션, 토큰, 레이아웃, 타이포그래피
  - `backend-developer` — API, 서버 로직, 데이터베이스, 인증
  - `infra` — CI/CD, Docker, 배포, 환경 설정
- **8개 리뷰 에이전트** — 프론트엔드, 접근성, 코드, TypeScript, Python, 보안, DB, 성능
- **10개 유틸리티 에이전트** — 플래너, 아키텍트, TDD 가이드, 빌드 해결 등
- **엄격한 역할 경계** — 프론트엔드 에이전트가 백엔드 코드를 절대 수정 불가
- **핸드오프 프로토콜** — 에이전트 간 자동 위임
- **14개 품질 훅** — git 안전, 커밋 품질, console.log 감지, 종료 시 포맷/타입체크
- **1개 MCP** — Context7 (라이브 라이브러리 문서, 무료, API 키 불필요)

### 빠른 시작

```bash
# 1. 클론
git clone https://github.com/sungwoonchun/p1zza-agent.git
cd p1zza-agent

# 2. 설치 (기존 ~/.claude/는 자동 백업)
./install.sh

# 3. Claude Code 재시작
claude
```

### 에이전트 역할 경계

구현 에이전트는 **엄격한 파일 경로 제한**이 있습니다:

| 에이전트 | 허용 | 차단 |
|---|---|---|
| `frontend-developer` | components/, hooks/, pages/, app/ | api/, server/, prisma/, *.py |
| `frontend-designer` | *.css, styles/, tokens/, theme/ | api/, server/, hooks/, *.py |
| `backend-developer` | api/, server/, prisma/, services/ | components/, pages/, *.css |
| `infra` | Dockerfile, .github/, deploy/ | 애플리케이션 소스 코드 전체 |

### 커스터마이징

**언어 추가**: `rules/<언어>/` 디렉토리에 `coding-style.md`, `hooks.md`, `patterns.md`, `security.md`, `testing.md` 생성.

**에이전트 추가**: `agents/<이름>.md`에 YAML frontmatter 작성 후 `AGENTS.md` 레지스트리에 등록.

**MCP 추가**: `mcp-configs/mcp-servers.json` 편집.

### 크레딧

이 프로젝트는 [@affaan-m](https://github.com/affaan-m)과 기여자들이 만든 **[Everything Claude Code (ECC)](https://github.com/affaan-m/everything-claude-code)**의 경량화 포크입니다. ECC는 포괄적이고 모든 기능을 갖춘 원본이며, p1zza-agent는 web + TS + Python 워크플로에 최적화된 의견이 담긴 서브셋입니다.

### 라이선스

MIT — 원본 ECC 프로젝트와 동일.
