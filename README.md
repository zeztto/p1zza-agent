# p1zza-agent

[![Version](https://img.shields.io/badge/version-0.3.0-blue.svg)](https://github.com/zeztto/p1zza-agent)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Reference](https://img.shields.io/badge/reference-ECC-orange.svg)](https://github.com/affaan-m/everything-claude-code)

AI-agent-friendly dual-package runtime for Claude and Codex.

REPO: `https://github.com/zeztto/p1zza-agent`
HOMEPAGE: `https://p1zza.kr`
CREATOR: `h4ppy p1zza`
VERSION: `0.3.0`
LINEAGE: fork of `Everything Claude Code (ECC)`
UPSTREAM_REFERENCE: `https://github.com/affaan-m/everything-claude-code`

## About

`p1zza-agent`는 `Everything Claude Code (ECC)`를 바탕으로 발전시킨 프로젝트입니다. Claude와 Codex를 하나의 제품 안에서 함께 운영할 수 있도록 구조를 다시 정리했고, 각 런타임이 자기 방식대로 동작하면서도 공통 규칙과 협업 방식은 맞춰지도록 설계했습니다.

`0.3.0` 준비 단계에서는 product coordination layer를 확장하는 데 집중했습니다. `product-manager`와 `product-owner`를 추가해 제품 방향, release scope, backlog readiness, acceptance criteria를 engineering coordination과 분리해서 다룰 수 있게 했습니다.

[한국어](#korean) | [English](#english)

---

## Korean

### 프로젝트 소개

`p1zza-agent`는 Claude 패키지와 Codex 패키지를 함께 유지하는 dual-package AI agent system입니다. 출발점은 `Everything Claude Code (ECC)` 포크이지만, 현재는 Claude 전용 구성을 넘어 Codex까지 함께 다루는 제품 구조로 정리되어 있습니다.

이 저장소의 루트는 실제 런타임이 설치되는 위치가 아니라, 제품을 유지보수하고 배포하기 위한 기준점입니다. 실제 설치는 `claude/`와 `codex/` 패키지를 통해 각각의 런타임 디렉터리로 이루어집니다.

### 0.3.0 Highlights

- `0.3.0` 준비 범위에서 `product-manager` 와 `product-owner` agent를 추가
- Codex skill discovery에 `p1zza-product-manager`, `p1zza-product-owner` wrapper 추가
- product scope/roadmap 과 backlog/acceptance 를 분리해 `development-lead` overload를 줄이는 방향으로 조정
- shared auto-dispatch 와 coordination registry에 product 계층을 반영
- installer 기본 version metadata를 `0.3.0` 으로 상향

### Canonical Paths

- Claude entrypoint: `claude/CLAUDE.md`
- Codex entrypoint: `codex/AGENTS.md`
- Claude install target: `~/.claude/`
- Codex install target: `~/.codex/`
- Codex skills target: `~/.codex/skills/p1zza-*`

주의:

- `~/.codex/skills/p1zza-*` 가 Codex의 canonical skill path 입니다.
- `~/.codex/.agents/skills/` 는 legacy 또는 experimental path로만 취급합니다.
- 루트 `AGENTS.md`, `CLAUDE.md` 는 저장소 유지보수용 안내이며 runtime install artifact가 아닙니다.

### Package Layout

```text
p1zza-agent/
├── AGENTS.md
├── CLAUDE.md
├── CHANGELOG.md
├── README.md
├── install.sh
├── claude/
│   ├── CLAUDE.md
│   ├── AGENTS.md
│   ├── agents/
│   ├── rules/
│   ├── scripts/
│   ├── mcp-configs/
│   └── install.sh
└── codex/
    ├── AGENTS.md
    ├── CLAUDE.md
    ├── skills/
    ├── agents/
    ├── rules/
    ├── docs/
    └── install.sh
```

### Install

일반적으로는 저장소를 clone한 뒤 루트 installer를 실행하면 됩니다.

```bash
git clone https://github.com/zeztto/p1zza-agent.git
cd p1zza-agent
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

### Operating Rules

이 프로젝트는 `claude/`와 `codex/` 사이의 공통 운영 semantics를 최대한 맞추되, 실제 entrypoint와 설치 경로는 런타임에 맞게 분리하는 원칙을 따릅니다. 또한 문서는 사람이 읽기 쉬워야 하지만, 유지보수와 설치 기준이 흔들리지 않도록 AI 에이전트가 해석하기에도 충분히 명확하게 작성합니다.

Canonical packets:

- `lead-directive-v1`
- `lead-response-v1`
- `lead-review-v1`
- `qa-contract-v1`
- `qa-response-v1`
- `frontend-contract-v1`
- `frontend-response-v1`

### Versioning

- CURRENT_VERSION: `0.3.0`
- CHANGELOG: [`CHANGELOG.md`](./CHANGELOG.md)

---

## English

### Product Summary

- PRODUCT: `p1zza-agent`
- TYPE: dual-package AI agent system
- LINEAGE: fork of `Everything Claude Code (ECC)`, rebuilt into a Claude + Codex product layout
- RUNTIMES: `claude/`, `codex/`
- PRODUCT_ROOT_ROLE: maintenance workspace, not a runtime package

### 0.3.0 Highlights

- `0.3.0` adds `product-manager` and `product-owner` as first-class product coordination agents
- adds Codex skill wrappers `p1zza-product-manager` and `p1zza-product-owner`
- separates product scope and roadmap framing from backlog readiness and acceptance ownership
- updates shared auto-dispatch and coordination guidance for product-layer work
- bumps installer default version metadata to `0.3.0`

### Canonical Paths

- SCOPE: runtime/package reference
- Claude entrypoint: `claude/CLAUDE.md`
- Codex entrypoint: `codex/AGENTS.md`
- Claude install target: `~/.claude/`
- Codex install target: `~/.codex/`
- Codex skills target: `~/.codex/skills/p1zza-*`

Notes:

- `~/.codex/skills/p1zza-*` is the canonical Codex skill path.
- `~/.codex/.agents/skills/` is treated as a legacy or experimental path only.
- Root `AGENTS.md` and `CLAUDE.md` are repository-maintenance guides, not runtime install artifacts.

### Install

- DEFAULT_FLOW: clone repo, run root installer

```bash
git clone https://github.com/zeztto/p1zza-agent.git
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

### Operating Rules

- SHARED_SEMANTICS: keep aligned across `claude/` and `codex/`
- CANONICAL_PACKETS: keep identical across runtimes
- RUNTIME_SEPARATION: keep runtime-specific entrypoints and install targets separate
- DOC_POLICY: write project docs to stay low-ambiguity and agent-readable

Canonical packets:

- `lead-directive-v1`
- `lead-response-v1`
- `lead-review-v1`
- `qa-contract-v1`
- `qa-response-v1`
- `frontend-contract-v1`
- `frontend-response-v1`

### Versioning

- CURRENT_VERSION: `0.3.0`
- CHANGELOG: [`CHANGELOG.md`](./CHANGELOG.md)
