# p1zza-agent

[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)](https://github.com/sungwoonchun/p1zza-agent)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Reference](https://img.shields.io/badge/reference-ECC-orange.svg)](https://github.com/affaan-m/everything-claude-code)

[한국어](#한국어) | [English](#english)

---

## 한국어

**Claude와 Codex에서 모두 동작하도록 정리한 dual-package AI agent system입니다.**

`p1zza-agent`는 하나의 제품 루트 아래에 `claude/`와 `codex/` 패키지를 함께 유지합니다. 공통 운영 semantics는 맞추되, 각 런타임의 실제 entrypoint와 설치 대상은 분리합니다.

### 핵심 포인트

- `claude/`와 `codex/`를 함께 관리하는 product workspace
- Codex와 Claude 각각에 맞는 runtime package 제공
- agent, rule, skill, handoff packet semantics를 양쪽에서 일관되게 유지
- 루트 설치기 하나로 `Claude`, `Codex`, `Claude + Codex` 설치 지원
- Codex는 `~/.codex/AGENTS.md`와 `~/.agents/skills/p1zza-*`를 사용
- Claude는 `~/.claude/CLAUDE.md`를 중심으로 동작

### Product Root와 Runtime의 차이

이 저장소의 루트는 runtime package가 아니라 **제품 루트**입니다.

- 루트 [AGENTS.md](./AGENTS.md): 이 저장소를 Codex에서 직접 열고 작업할 때 쓰는 product-level 안내
- 루트 [CLAUDE.md](./CLAUDE.md): 이 저장소를 Claude에서 직접 열고 작업할 때 쓰는 product-level 안내
- 실제 runtime entrypoint:
  - Claude: `claude/CLAUDE.md`
  - Codex: `codex/AGENTS.md` + `codex/.agents/skills/`

즉, 루트의 `AGENTS.md`와 `CLAUDE.md`는 설치 대상 runtime 파일이 아니라, **이 저장소 자체를 개발할 때의 루트 안내 파일**입니다.

### 빠른 시작

```bash
# 1. clone
git clone https://github.com/sungwoonchun/p1zza-agent.git
cd p1zza-agent

# 2. install
./install.sh
```

원격 설치:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh)"
```

비대화식 설치:

```bash
curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=claude P1ZZA_AUTO_CONFIRM=1 bash

curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=codex P1ZZA_AUTO_CONFIRM=1 bash

curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=both P1ZZA_AUTO_CONFIRM=1 bash
```

### 설치 결과

- Claude target: `~/.claude`
- Codex root: `~/.codex`
- Codex skills: `~/.agents/skills/p1zza-*`

중요:

- `~/.claude`에는 Claude runtime 자산이 설치됩니다.
- `~/.codex`에는 Codex runtime 자산이 설치됩니다.
- `~/.codex`의 canonical entrypoint는 `AGENTS.md`입니다.
- `CLAUDE.md`는 `~/.codex`에 설치하지 않습니다.

### 프로젝트 구조

```text
p1zza-agent/
├── AGENTS.md      # product root guide for Codex
├── CLAUDE.md      # product root guide for Claude
├── README.md
├── install.sh     # unified installer
├── claude/        # Claude runtime package
└── codex/         # Codex runtime package
```

패키지 내부 구조:

```text
claude/
├── CLAUDE.md
├── AGENTS.md
├── agents/
├── rules/
├── scripts/
├── mcp-configs/
└── install.sh

codex/
├── AGENTS.md
├── .agents/skills/
├── agents/
├── rules/
├── docs/
└── install.sh
```

### 운영 원칙

- 공통 packet semantics는 양 패키지에서 동일하게 유지합니다.
- shared 운영 규칙을 바꿀 때는 `claude/`와 `codex/`를 함께 갱신합니다.
- 구현 에이전트의 경로 경계와 handoff protocol은 runtime마다 동일한 의미를 갖습니다.

Canonical packet set:

- `lead-directive-v1`
- `lead-response-v1`
- `lead-review-v1`
- `qa-contract-v1`
- `qa-response-v1`
- `frontend-contract-v1`
- `frontend-response-v1`

### 언제 루트 파일이 필요한가

루트 파일은 설치용 runtime 자산이 아니라 다음 상황에서 필요합니다.

- 저장소 루트를 Codex로 직접 열어 패키지 구조를 수정할 때
- 저장소 루트를 Claude로 직접 열어 installer나 shared semantics를 정리할 때
- `claude/`와 `codex/`를 동시에 유지보수할 때 product-level 안내가 필요할 때

### 참고

- 이전 README의 구조와 메시지를 바탕으로 정리했습니다.
- 문서 톤과 섹션 구성은 [Everything Claude Code](https://github.com/affaan-m/everything-claude-code)를 참고했습니다.

---

## English

**A dual-package AI agent system for both Claude and Codex.**

`p1zza-agent` keeps `claude/` and `codex/` in one product workspace. Shared operating semantics stay aligned, while each runtime keeps its own entrypoint, installation target, and runtime-specific assets.

### Highlights

- Product workspace that manages both `claude/` and `codex/`
- Separate runtime packages for Claude and Codex
- Shared agent, rule, skill, and packet semantics across both runtimes
- One unified installer for `Claude`, `Codex`, or `Claude + Codex`
- Codex uses `~/.codex/AGENTS.md` and `~/.agents/skills/p1zza-*`
- Claude uses `~/.claude/CLAUDE.md` as its runtime entrypoint

### Product Root vs Runtime Package

The repository root is a **product root**, not a runtime package.

- Root [AGENTS.md](./AGENTS.md): product-level guidance when this repository is opened directly in Codex
- Root [CLAUDE.md](./CLAUDE.md): product-level guidance when this repository is opened directly in Claude
- Actual runtime entrypoints:
  - Claude: `claude/CLAUDE.md`
  - Codex: `codex/AGENTS.md` + `codex/.agents/skills/`

So the root `AGENTS.md` and `CLAUDE.md` are not runtime install artifacts. They are repository-level guidance files for maintaining this project itself.

### Quick Start

```bash
git clone https://github.com/sungwoonchun/p1zza-agent.git
cd p1zza-agent
./install.sh
```

Remote install:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh)"
```

Non-interactive install:

```bash
curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=claude P1ZZA_AUTO_CONFIRM=1 bash

curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=codex P1ZZA_AUTO_CONFIRM=1 bash

curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=both P1ZZA_AUTO_CONFIRM=1 bash
```

### Install Outputs

- Claude target: `~/.claude`
- Codex root: `~/.codex`
- Codex skills: `~/.agents/skills/p1zza-*`

Important:

- `~/.claude` receives the Claude runtime package.
- `~/.codex` receives the Codex runtime package.
- The canonical Codex entrypoint is `~/.codex/AGENTS.md`.
- `CLAUDE.md` is not installed into `~/.codex`.

### Repository Layout

```text
p1zza-agent/
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── install.sh
├── claude/
└── codex/
```

Package layout:

```text
claude/
├── CLAUDE.md
├── AGENTS.md
├── agents/
├── rules/
├── scripts/
├── mcp-configs/
└── install.sh

codex/
├── AGENTS.md
├── .agents/skills/
├── agents/
├── rules/
├── docs/
└── install.sh
```

### Operating Model

- Shared packet semantics must remain aligned across both packages.
- When shared operating behavior changes, update `claude/` and `codex/` together.
- Path boundaries and handoff semantics should mean the same thing in both runtimes.

Canonical packet set:

- `lead-directive-v1`
- `lead-response-v1`
- `lead-review-v1`
- `qa-contract-v1`
- `qa-response-v1`
- `frontend-contract-v1`
- `frontend-response-v1`

### Why the Root Files Exist

The root files matter when:

- you open the repository root directly in Codex
- you open the repository root directly in Claude
- you are maintaining both runtime packages together

### Credits

- Messaging and section structure were rebuilt with the previous project README as the local baseline.
- Presentation and README flow were informed by [Everything Claude Code](https://github.com/affaan-m/everything-claude-code).
