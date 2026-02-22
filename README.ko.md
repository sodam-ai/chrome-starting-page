🌏 [한국어](README.ko.md) | [English](README.md)

# Chrome Starting Page Dashboard v1.0

> 나만의 크롬 시작 페이지 대시보드 — Node.js 기반 로컬 서버로 동작하며, 외부 서비스 의존 없이 내 컴퓨터에서만 실행됩니다.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Node.js](https://img.shields.io/badge/Node.js-≥18-339933?logo=node.js&logoColor=white)](https://nodejs.org)
[![No Dependencies](https://img.shields.io/badge/Dependencies-None-brightgreen)](package.json)

## 📋 개요

로컬 Node.js 서버에서 실행되는 완전한 기능의 크롬 시작 페이지 대시보드입니다. 모든 데이터는 내 컴퓨터에만 저장되며, 외부 서버 전송이나 계정 가입이 필요 없습니다. 북마크 관리, 메모, 할 일, 달력, 습관 추적 등 다양한 기능을 커스터마이즈 가능한 글래스모피즘(Glassmorphism) UI로 제공합니다.

원본 프로젝트 [chrome-starting-page](https://github.com/sodam-AI/chrome-starting-page)를 포크하여 대규모 업그레이드하였습니다.

## ✨ 주요 기능

- **스포트라이트 검색** — 북마크, 할 일, 메모, D-Day를 한 번에 검색, 초성 검색 지원 (`Ctrl+F`)
- **키워드 검색** — `yt 검색어`, `nv 검색어`, `gh 검색어`로 YouTube, 네이버, GitHub 즉시 검색
- **멀티 카드 시스템** — 북마크, 메모장, 할 일, 달력, 습관 카드를 드래그 앤 드롭으로 관리
- **멀티 페이지** — 카드를 여러 페이지로 나누어 탭으로 전환
- **스마트 북마크** — 브라우저에서 드래그 추가, 중복 검사, NEW 뱃지, 카드 간 이동
- **테마 엔진** — 다크/라이트/자동, 8종 강조 색상, 글래스 효과 프리셋, 배경 슬라이드쇼
- **자동 백업** — 스마트 보존 정책 (7일 전체 → 30일 일별 → 자동 삭제, 최대 50개)
- **오프라인 지원** — Service Worker 캐싱으로 서버 중단 시에도 열람 가능
- **날씨 & D-Day** — 현재 날씨 표시, 중요한 날짜까지 카운트다운
- **포모도로 타이머** — 내장 집중 타이머 + 통계
- **프로필 관리** — 여러 설정을 저장하고 전환
- **완전 무의존** — 순수 Node.js 내장 모듈만 사용, npm 패키지 없음

## 🛠️ 기술 스택

| 분류 | 기술 |
|---|---|
| 서버 | Node.js ≥ 18 (내장 모듈만 사용, npm 패키지 없음) |
| 프론트엔드 | 바닐라 JavaScript + CSS (프레임워크 없음) |
| 데이터 저장 | 로컬 JSON 파일 (`data/` 디렉토리) |
| 캐싱 | Service Worker |
| 포트 | 1111 (변경 가능) |

## 📦 사전 요구 사항

- **Node.js** v18 이상 — [LTS 버전 다운로드](https://nodejs.org)
- 설치 확인: 터미널에서 `node -v` 입력 → `v18.x.x` 이상이면 OK

## 🚀 설치

### Windows (권장: 자동 설치)

1. 프로젝트 폴더를 원하는 위치에 배치합니다 (예: `C:\Users\내이름\Dashboard`)
2. `setup_windows.bat` 파일을 더블클릭합니다
3. 완료 메시지가 나타나면 `http://localhost:1111` 로 접속합니다

자동 설치가 하는 일: Node.js 확인 → 백그라운드 서버 시작 → Windows 시작 프로그램 등록

### macOS (권장: 자동 설치)

```bash
cd ~/Dashboard
chmod +x setup_mac.sh       # 실행 권한 부여 (최초 1회)
./setup_mac.sh
```

자동 설치가 하는 일: Node.js 확인 → macOS LaunchAgent 등록 → 서버 즉시 시작

### Linux

```bash
cd ~/Dashboard
node server.js
```

자동 시작을 원하면 systemd 서비스를 등록합니다:

```bash
sudo tee /etc/systemd/system/dashboard.service << EOF
[Unit]
Description=Chrome Starting Page Dashboard
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$HOME/Dashboard
ExecStart=$(which node) server.js
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable dashboard
sudo systemctl start dashboard
```

### 수동 실행 (모든 플랫폼)

```bash
cd /path/to/Dashboard
node server.js
```

터미널에 `[Dashboard v7.2] http://localhost:1111/` 이 표시되면 준비 완료입니다.

## 💻 사용 방법

### 크롬 시작 페이지 설정

1. 크롬 주소창에 `chrome://settings/onStartup` 입력
2. **"특정 페이지 또는 페이지 모음 열기"** 선택
3. **"새 페이지 추가"** 클릭 → `http://localhost:1111` 입력

선택사항: [New Tab Redirect](https://chromewebstore.google.com/detail/new-tab-redirect/icpgjfneehieebagbmdbhnlpiopdcmna) 확장 프로그램을 설치하고 리다이렉트 URL을 `http://localhost:1111`로 설정하면 새 탭에서도 대시보드가 표시됩니다.

### 키보드 단축키

| 단축키 | 기능 |
|---|---|
| `/` 또는 `Ctrl+K` | 검색창 포커스 |
| `S` | 설정 열기 |
| `E` | 편집 모드 토글 |
| `T` | 테마 전환 (다크/라이트) |
| `Ctrl+F` | 스포트라이트 검색 (전체 북마크/할 일/메모/D-Day 검색) |
| `1`~`9` | 첫 번째 카드의 n번째 북마크 바로 열기 |

### 검색

- **기본 검색**: 검색창에 입력 후 Enter (Google/Naver/YouTube 등 전환 가능)
- **키워드 검색**: `yt 검색어`, `nv 검색어`, `gh 검색어`, `g 검색어`, `tw 검색어`, `map 검색어`
- **스포트라이트**: `Ctrl+F`로 통합 검색 (초성 검색 지원: `ㅈㅁ` → "지메일")
- **명령어**: 스포트라이트에서 `>` 입력 후 `todo`, `timer`, `edit`, `focus` 등 실행

### 북마크 관리

- **추가**: 편집 모드에서 + 버튼, 또는 브라우저 URL을 카드 위로 드래그
- **정렬**: 드래그하여 순서 변경
- **이동**: 다른 카드 위로 드래그하여 카테고리 이동
- **삭제**: 마우스 호버 → × 클릭 (Undo 지원)
- **중복 검사**: 설정 → 데이터 → "중복 URL 검사"
- **NEW 뱃지**: 새로 추가된 북마크에 7일간 NEW 표시 후 자동 제거

### 카드 종류

- **북마크 카드** — 즐겨찾기 링크 모음
- **메모장 카드** — 간단한 메모 (여러 개 생성 가능)
- **할 일 카드** — 우선순위, 태그, 마감일, 반복 설정 (여러 개 생성 가능)
- **달력 카드** — 월간/주간 달력과 일정 관리
- **습관 카드** — 일일 습관 체크리스트

### 카드 관리

- **추가/제거**: 하단 + 버튼 / 카드 × 버튼 (Undo 지원)
- **접기/펼치기**: 카드 제목 클릭 (상태 유지)
- **크기 변경**: 편집 모드에서 1x/2x 전환
- **순서 변경**: 좌측 ⠿ 핸들 드래그
- **색상 설정**: 편집 모드에서 카드별 배경색 지정

### 설정 (`S` 키)

- **테마**: 다크/라이트/자동, 강조 색상 8종
- **글래스 효과**: 투명도, 블러 강도, 프리셋 (투명/기본/불투명)
- **배경**: 단색, 이미지 업로드, 슬라이드쇼
- **날씨**: 도시 이름 입력으로 현재 날씨 표시
- **검색**: 기본 검색 엔진 변경, 커스텀 키워드 검색
- **D-Day**: 중요한 날짜까지 남은 일수 표시
- **데이터**: 내보내기/가져오기, 프로필 관리, 중복 URL 검사, 휴지통

## ⚙️ 작동 방식

대시보드는 포트 1111에서 경량 Node.js HTTP 서버를 실행하여 정적 파일을 제공하고, 데이터 저장을 위한 REST API를 제공합니다. 모든 사용자 데이터는 `data/` 디렉토리에 JSON 파일로 저장됩니다. 프론트엔드는 순수 바닐라 JavaScript와 CSS로 구성되어 빌드 과정, 번들링, 프레임워크가 필요 없습니다.

핵심 아키텍처 결정사항:
- **npm 의존성 제로** — 서버는 Node.js 내장 `http`, `fs`, `path` 모듈만 사용
- **Service Worker** — 서버 중단 시에도 오프라인 접근을 위한 페이지 캐싱
- **스마트 백업** — 주기적 자동 백업 + 최근 백업 유지/오래된 백업 자동 정리
- **3단계 파비콘** — Google Favicon → DuckDuckGo → 자동 생성 컬러 글자 아이콘

## 📁 프로젝트 구조

```
Dashboard/
├── data/                       ← 모든 사용자 데이터 (자동 관리)
│   ├── bookmarks.json          ← 북마크
│   ├── config.json             ← 설정
│   ├── notes.json              ← 메모
│   ├── todos.json              ← 할 일
│   ├── events.json             ← 일정
│   ├── ddays.json              ← D-Day
│   ├── usage.json              ← 사용 통계
│   ├── trash.json              ← 휴지통
│   ├── pomo-stats.json         ← 포모도로 통계
│   ├── icons/                  ← 업로드한 아이콘
│   ├── profiles/               ← 프로필 데이터
│   └── backups/                ← 자동 백업 (스마트 보존)
├── assets/                     ← 배경 이미지, PWA 아이콘
├── server.js                   ← 서버 (포트 변경 시에만 수정)
├── index.html                  ← 화면 구조
├── style.css                   ← 스타일 (테마, 글래스 효과, 애니메이션)
├── script.js                   ← 기능 로직 (2,800+ 줄)
├── restart.bat                 ← 서버 재시작 (Windows)
├── run_server_background.bat   ← 백그라운드 실행 (시작 프로그램용)
├── setup_windows.bat           ← Windows 자동 설치
└── setup_mac.sh                ← macOS 자동 설치
```

## 🔒 보안

- 모든 데이터는 로컬에만 저장 — 외부로 전송하지 않습니다
- 시스템 레지스트리를 수정하지 않습니다
- 프로젝트 폴더 밖에 글로벌 설정 파일이나 숨겨진 폴더를 만들지 않습니다
- 서버는 `localhost:1111`에서만 수신 — 다른 기기에서 접근 불가
- 대기 시 메모리 사용량 약 15MB
- 인터넷 연결 없이도 동작 (날씨 위젯 제외)

## 🔧 문제 해결

| 증상 | 원인 | 해결법 |
|---|---|---|
| "포트 1111이 이미 사용 중" | 이전 서버가 실행 중 | `restart.bat` 더블클릭 (Windows) 또는 프로세스 종료 |
| 서버가 실행되지 않음 | Node.js 미설치 | `node -v`로 확인 후 [nodejs.org](https://nodejs.org)에서 설치 |
| 페이지가 표시되지 않음 | URL 프로토콜 오류 | `http://localhost:1111` 사용 (https가 아닌 http) |
| 데이터가 저장되지 않음 | 서버 연결 끊김 | 서버 재시작; `data/` 폴더 쓰기 권한 확인 |
| 아이콘이 표시되지 않음 | 파비콘 로딩 실패 | 자동 폴백: Google → DuckDuckGo → 컬러 글자 아이콘 |

## 🗑️ 완전 제거

이 프로그램은 프로젝트 폴더 + 자동 시작 등록 두 가지만 제거하면 됩니다. 시스템 레지스트리, 글로벌 설정 파일, 숨겨진 폴더 등에 아무것도 남기지 않습니다.

**Windows:**
```bash
# 1. 자동 시작 제거
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Dashboard_StartPage.lnk"
# 2. 서버 종료
taskkill /f /im node.exe
# 3. 프로젝트 폴더 삭제
# 4. chrome://settings/onStartup에서 http://localhost:1111 제거
```

**macOS:**
```bash
launchctl unload ~/Library/LaunchAgents/com.dashboard.startpage.plist
rm ~/Library/LaunchAgents/com.dashboard.startpage.plist
rm -rf ~/Dashboard
```

**Linux (systemd):**
```bash
sudo systemctl stop dashboard && sudo systemctl disable dashboard
sudo rm /etc/systemd/system/dashboard.service && sudo systemctl daemon-reload
rm -rf ~/Dashboard
```

## 🙏 감사의 말

- 원본 프로젝트: [sodam-AI/chrome-starting-page](https://github.com/sodam-AI/chrome-starting-page)

## 📄 라이선스

이 프로젝트는 MIT 라이선스를 따릅니다 — 자세한 내용은 [LICENSE](LICENSE) 파일을 참고하세요.
