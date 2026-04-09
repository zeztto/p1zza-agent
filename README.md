# p1zza-agent

[![Version](https://img.shields.io/badge/version-0.2.0-blue.svg)](https://github.com/zeztto/p1zza-agent)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

AI-agent-friendly dual-package runtime for Claude and Codex.

REPO: `https://github.com/zeztto/p1zza-agent`
HOMEPAGE: `https://p1zza.kr`
CREATOR: `h4ppy p1zza`
VERSION: `0.2.0`

[한국어](#korean) | [English](#english)

---

## Korean

### Product Summary

- PRODUCT: `p1zza-agent`
- TYPE: dual-package AI agent system
- RUNTIMES: `claude/`, `codex/`
- PRODUCT ROOT: repository root is maintenance workspace, not a runtime package

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

- Shared semantics stay aligned across `claude/` and `codex/`.
- Canonical packet set stays unchanged across runtimes.
- Runtime-specific entrypoints and installation targets stay separate.
- Project documentation must be AI-agent-friendly: explicit paths, deterministic structure, low ambiguity, packet-first when useful.

Canonical packets:

- `lead-directive-v1`
- `lead-response-v1`
- `lead-review-v1`
- `qa-contract-v1`
- `qa-response-v1`
- `frontend-contract-v1`
- `frontend-response-v1`

### Versioning

- CURRENT_VERSION: `0.2.0`
- CHANGELOG: [`CHANGELOG.md`](./CHANGELOG.md)

---

## English

### Product Summary

- PRODUCT: `p1zza-agent`
- TYPE: dual-package AI agent system
- RUNTIMES: `claude/`, `codex/`
- PRODUCT ROOT: repository root is a maintenance workspace, not a runtime package

### Canonical Paths

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

- Shared semantics must stay aligned across `claude/` and `codex/`.
- The canonical packet set should remain identical across runtimes.
- Runtime-specific entrypoints and installation targets remain separate.
- Project documentation must be AI-agent-friendly: explicit paths, deterministic structure, low ambiguity, and packet-first when useful.

### Versioning

- CURRENT_VERSION: `0.2.0`
- CHANGELOG: [`CHANGELOG.md`](./CHANGELOG.md)
