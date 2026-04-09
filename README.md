# p1zza-agent

[![Version](https://img.shields.io/badge/version-0.4.0-blue.svg)](https://github.com/zeztto/p1zza-agent)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Reference](https://img.shields.io/badge/reference-ECC-orange.svg)](https://github.com/affaan-m/everything-claude-code)

AI-agent-friendly dual-package runtime for Claude and Codex.

REPO: `https://github.com/zeztto/p1zza-agent`
HOMEPAGE: `https://p1zza.kr`
CREATOR: `h4ppy p1zza`
VERSION: `0.4.0`
LINEAGE: fork of `Everything Claude Code (ECC)`
UPSTREAM_REFERENCE: `https://github.com/affaan-m/everything-claude-code`

## About

`p1zza-agent`는 `Everything Claude Code (ECC)`를 바탕으로 발전시킨 프로젝트입니다. Claude와 Codex를 하나의 제품 안에서 함께 운영할 수 있도록 구조를 다시 정리했고, 각 런타임이 자기 방식대로 동작하면서도 공통 규칙과 협업 방식은 맞춰지도록 설계했습니다.

`0.4.0`에서는 `customer-management` role을 추가해 customer signal을 PM/PO와 engineering으로 넘기는 정식 coordination loop를 만들었습니다. 이제 support, feedback, churn-risk, recurring user pain은 별도 role과 canonical packet을 통해 product workflow로 연결됩니다.

[한국어](#korean) | [English](#english)

---

## Korean

### 프로젝트 소개

`p1zza-agent`는 Claude 패키지와 Codex 패키지를 함께 유지하는 dual-package AI agent system입니다. 출발점은 `Everything Claude Code (ECC)` 포크이지만, 현재는 Claude 전용 구성을 넘어 Codex까지 함께 다루는 제품 구조로 정리되어 있습니다.

이 저장소의 루트는 실제 런타임이 설치되는 위치가 아니라, 제품을 유지보수하고 배포하기 위한 기준점입니다. 실제 설치는 `claude/`와 `codex/` 패키지를 통해 각각의 런타임 디렉터리로 이루어집니다.

### 0.4.0 Highlights

- `0.4.0` 에서 `customer-management` role을 Claude/Codex runtime에 추가
- Codex skill discovery에 `p1zza-customer-management` wrapper 추가
- `customer-signal-v1`, `customer-handoff-v1` packet template 추가
- customer feedback/support triage를 PM/PO/lead/QA handoff와 연결하는 canonical loop 추가
- installer 기본 version metadata를 `0.4.0` 으로 상향

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
- `customer-signal-v1`
- `customer-handoff-v1`

### Versioning

- CURRENT_VERSION: `0.4.0`
- CHANGELOG: [`CHANGELOG.md`](./CHANGELOG.md)

### Documentation Maintenance

- versioned workspace에서 `README.md` 는 최초 작성 이후에도 지속적으로 관리하는 canonical product document 입니다.
- workspace가 `README.md` 와 `CHANGELOG.md` 를 함께 정의하고 있고 version 변경, installer 변경, agent catalog 변경, shared operating semantics 변경이 있으면 같은 변경 안에서 둘을 함께 갱신해야 합니다.
- `CHANGELOG.md` 가 존재하는 workspace에서는 그것이 version log의 canonical source 이며, README는 현재 제품 상태와 사용 방식을 반영해야 합니다.

---

## English

### Product Summary

- PRODUCT: `p1zza-agent`
- TYPE: dual-package AI agent system
- LINEAGE: fork of `Everything Claude Code (ECC)`, rebuilt into a Claude + Codex product layout
- RUNTIMES: `claude/`, `codex/`
- PRODUCT_ROOT_ROLE: maintenance workspace, not a runtime package

### 0.4.0 Highlights

- `0.4.0` adds `customer-management` as a first-class coordination role in both runtimes
- adds Codex skill wrapper `p1zza-customer-management`
- introduces `customer-signal-v1` and `customer-handoff-v1` packet templates
- creates a canonical loop from customer-facing signals into PM/PO/lead/QA workflows
- bumps installer default version metadata to `0.4.0`

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
- `customer-signal-v1`
- `customer-handoff-v1`

### Versioning

- CURRENT_VERSION: `0.4.0`
- CHANGELOG: [`CHANGELOG.md`](./CHANGELOG.md)

### Documentation Maintenance

- In versioned workspaces, `README.md` is a continuously maintained canonical product document after the first release, not a one-time setup file.
- When a workspace defines both `README.md` and `CHANGELOG.md`, and version, installer flow, agent catalog, or shared operating semantics change, update both in the same change.
- When a workspace ships `CHANGELOG.md`, it remains the canonical source for version history, while `README.md` must reflect the current product state and usage.
