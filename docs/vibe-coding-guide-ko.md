# p1zza-agent 쉬운 사용 가이드

대상: 한국어로 바이브 코딩을 하는 사용자
목표: 어렵지 않게 `p1zza-agent`를 써서 문서, 역할 추가, 리뷰, 릴리스 작업까지 진행하기

## 이 서비스가 하는 일

`p1zza-agent`는 Claude와 Codex에서 공통 규칙으로 일하게 만든 AI agent system입니다.

쉽게 말하면:

- 역할을 나눠서 일합니다.
- 바뀐 내용을 문서와 버전 로그까지 같이 관리합니다.
- 리뷰, PR, merge, 로컬 runtime 동기화까지 한 흐름으로 진행할 수 있습니다.

## 가장 쉬운 시작 방법

### 1. 설치하기

```bash
git clone https://github.com/zeztto/p1zza-agent.git
cd p1zza-agent
./install.sh
```

원격 설치도 가능합니다.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zeztto/p1zza-agent/main/install.sh)"
```

### 2. 하고 싶은 일을 한 문장으로 말하기

예시:

- `0.6.0에서 performance-marketer role을 추가합시다.`
- `README.md도 같이 업데이트해줘.`
- `클로드팀에 보낼 검수 패킷 메시지를 작성해줘.`
- `코덱스 코드리뷰를 하고 PR 머지까지 진행해줘.`

### 3. 리뷰를 꼭 거치기

보통 아래 순서로 가면 편합니다.

1. 구현
2. 코드리뷰
3. Claude 팀 검증
4. commit / PR / merge
5. 설치 runtime 동기화

## 자주 쓰는 요청 예시

### 새 role 추가

```text
0.6.0 버전에서 performance-marketer role을 추가합시다.
README.md와 CHANGELOG.md도 같이 업데이트하세요.
```

### Claude 팀 검수 요청

```text
클로드팀에 보낼 검수 패킷 메시지를 작성하세요.
```

### Codex 리뷰 요청

```text
코덱스 코드리뷰 기능으로 현재 변경사항을 리뷰하세요.
```

### 머지까지 요청

```text
리뷰 결과를 처리한 뒤 커밋, PR, 머지까지 진행하세요.
```

### 로컬 환경 동기화 요청

```text
로컬 환경도 동기화를 합시다.
```

## 알아두면 좋은 개념 4가지

### role

각 에이전트의 담당 역할입니다. 예를 들면 `product-manager`, `ui-ux-designer`, `qa` 같은 식입니다.

### packet

에이전트끼리 주고받는 정해진 형식의 메시지입니다. 사람이 길게 설명하지 않아도 되도록 도와줍니다.

### review

구현이 끝났다고 바로 머지하지 않고, 문제를 먼저 찾는 단계입니다.

### runtime sync

저장소에서 바뀐 내용을 실제 `~/.claude/`, `~/.codex/` 환경에 반영하는 단계입니다.

## 잘 쓰는 팁

- 한 번에 한 목표를 분명하게 말하면 더 잘 움직입니다.
- `README.md`, `CHANGELOG.md` 업데이트도 같이 요청하면 누락이 줄어듭니다.
- 릴리스 작업이면 `몇 버전인지`를 먼저 말해주면 좋습니다.
- Claude 팀 검증이 필요한 변경인지 먼저 확인하면 흐름이 깔끔합니다.

## 추천 진행 문장

처음에는 아래 문장만 써도 충분합니다.

```text
0.5.1 버전으로 튜토리얼 문서를 추가합시다.
AI 에이전트용 문서와 한국어 사용자용 쉬운 문서를 각각 작성하고,
README.md와 CHANGELOG.md도 같이 업데이트하세요.
```
