# p1zza-agent

[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)](https://github.com/sungwoonchun/p1zza-agent)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

Claude와 Codex에서 모두 사용할 수 있도록 정리한 `p1zza-agent` 제품 루트입니다.

## Packages

- [`claude/`](./claude): Claude Code 패키지
- [`codex/`](./codex): Codex 패키지
- [`docs/`](./docs): migration 및 운영 문서
- [`install.sh`](./install.sh): 통합 설치 스크립트

## Install

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh)"
```

대상까지 바로 지정하는 비대화식 설치도 가능합니다.

```bash
curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=claude P1ZZA_AUTO_CONFIRM=1 bash

curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=codex P1ZZA_AUTO_CONFIRM=1 bash

curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh | \
  P1ZZA_INSTALL_MODE=both P1ZZA_AUTO_CONFIRM=1 bash
```

저장소를 이미 clone한 경우에는 기존 방식으로도 설치할 수 있습니다.

```bash
cd p1zza-agent
./install.sh

cd claude
./install.sh

cd ../codex
./install.sh
```

설치 메뉴:

1. `Claude`
2. `Codex`
3. `Claude + Codex`
4. `exit`

기존 설정은 백업 후 덮어쓸 수 있습니다.

- Claude target: `~/.claude`
- Codex root: `~/.codex`
- Codex skills: `~/.agents/skills/p1zza-*`

## Product Layout

```text
p1zza-agent/
├── claude/     # Claude runtime package
├── codex/      # Codex runtime package
├── docs/       # migration and handoff notes
├── install.sh  # unified installer
├── LICENSE
└── README.md
```

## Notes

- root는 제품 루트입니다.
- 실제 runtime 자산은 `claude/`와 `codex/` 아래에 있습니다.
- Claude와 Codex는 같은 packet semantics를 유지해야 합니다:
  - `lead-directive-v1`
  - `lead-response-v1`
  - `lead-review-v1`
  - `qa-contract-v1`
  - `qa-response-v1`
  - `frontend-contract-v1`
  - `frontend-response-v1`
