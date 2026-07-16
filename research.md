# research.md — 작업·조사 기록

> CLAUDE.md 규칙: 모든 질문·요구·요청과 진행 과정·결과를 신중·깊이·상세·명확·정확하게 정리해 여기에 누적 기록한다.

## 기록 형식
- **날짜 — 제목**
  - 요청:
  - 진행:
  - 결정·근거:
  - 결과:

---

## 2026-07-13 — CLAUDE.md 규칙 추가 및 전 저장소 횡전개
- 요청: CLAUDE.md에 "모든 답변을 신중·깊이·상세·명확·정확하게 정리하고 research.md에 기록" 규칙 추가, 전 저장소 기본 브랜치에 횡전개.
- 진행: 7개 저장소(axax77, axdata_01/03/05/07/09, gax)의 기본 브랜치 CLAUDE.md에 "답변·기록 규칙" 섹션 추가, 각 저장소에 research.md 생성.
- 결정·근거: '횡전개' = 새 세션이 실제로 여는 기본 브랜치에 반영(ponytail 배포와 동일 기준). 기존 CLAUDE.md는 보존하고 규칙 섹션만 추가(수술적 변경).
- 결과: 각 저장소 커밋·푸시 완료(아래 커밋 참조).

## 2026-07-13 — 세션 토큰 최소화 방안 정리
- 요청: 각 세션 토큰 최소화 방안 정리.
- 진행/결과(요약):
  - 원리: 토큰은 ①세션 시작 자동 로드(고정) + ②작업 중 누적, 둘을 각각 줄인다.
  - 고정 줄이기: CLAUDE.md 간결·SessionStart 훅 주입 최소화·미사용 스킬/플러그인/MCP 정리.
  - 누적 줄이기: 스크린샷 아껴쓰기(이미지=수백~수천 토큰)·파일은 필요한 부분만·출력 잘라내기·반복조회 금지.
  - 운영: 작업 단위 새 세션·/compact·/clear·/context·간단작업은 가벼운 모델·큰 탐색은 서브에이전트.
  - 특화: research.md 비대화 주의(요약+링크 구조)·CLAUDE.md 잦은 변경은 프롬프트 캐시 깸·멀티레포 공통규칙은 짧게.
  - 우선순위: (1)스크린샷·출력 절감 (2)새 세션+compact (3)CLAUDE.md/훅/research.md 간결 (4)미사용 스킬·MCP 정리.

## 2026-07-13 — 전 저장소 CLAUDE.md 불필요 요소 점검
- 요청: 모든 CLAUDE.md에 불필요 요소 있는지 점검.
- 결과(우선순위):
  1. [토큰 최대] 상태·백로그·API 나열이 CLAUDE.md에 있음(axdata_09 71줄·gax 59줄). 매 세션 로드+캐시 깸 → research.md/STATUS.md로 이전 권장.
  2. 규칙 중복: 새 '답변·기록 규칙' ↔ 기존 9원칙 6번 겹침(통합 가능, 사소).
  3. 브랜치 불일치: 이번 전 브랜치 전개 때 CLAUDE.md 없던 브랜치(예 axdata_07 continue)에 범용 규칙 삽입 → 기본 브랜치 프로젝트용과 상이(실害 작음).
  4. 포맷 불일치: gax만 헤더·구조 상이, 기본 브랜치에 표준 소통규칙 빠짐.
  5. 정확성: 규칙7 테스트명령 node --test system/test/*.test.mjs 가 저장소마다 실제와 다를 수 있음(axax77 정적 HTML 등).
- 양호: axax77/03/05 순수 규칙 간결. 프로젝트 개요 자체는 유지 가치.
- 후속(대기): axdata_09/gax 상태·백로그 이전, 규칙 통합, 헤더 통일, 테스트명령 검증 — Gim 지시 시 실행.

## 2026-07-13 — CLAUDE.md 정리 실행(전부 진행)
- 요청: 점검에서 나온 개선안 전부 실행.
- 실행함:
  - axdata_09 CLAUDE.md 슬림화 71→59줄(현황·주요API·백로그 → research.md 이전).
  - gax CLAUDE.md 슬림화 59→51줄(현재 상태·백로그 → research.md 이전).
- 검증함(테스트 명령 실제):
  - axdata_01 npm test(node --test system/test)·gax npm test(node test/*.js)·axdata_09 python -m pytest.
  - axax77/03/05/07 정식 테스트 없음(정적/Next.js/빈저장소). 규칙7 예시명령은 프로젝트 섹션이 override.
- 판단상 보류(이유):
  - 규칙 중복 통합: 9원칙6(계획·노트) vs 답변·기록2(research 기록)은 보완 관계 → 통합 안 함.
  - 헤더/구조 통일: 프로젝트별 CLAUDE.md 구조는 의도적 → 강제 통일 시 정보 훼손, 유지.
  - 비기본 브랜치 fallback 일치화: 세션 미사용 브랜치라 실害 없음 → 대기.
  - 규칙7 저장소별 수정: Gim authored 규칙, 프로젝트 섹션에 실명령 있음 → 검증·보고만.

## 2026-07-13 — 추가 게임 에셋 심층 조사
- 요청: 더 활용할 수 있는 게임 에셋 심층 조사·정리·브리핑.
- 결과(핵심):
  1. Quaternius(CC0 3D 몬스터·캐릭터, 70팩 2500+, 애니 내장) → 오늘 3D→2D 파이프라인에 그대로. 몬스터도 무료·일관 스타일.
  2. Kenney(CC0 6만+): UI(430)·UI Audio·폰트·아이콘·2D/3D. 출처표기 불필요.
  3. KayKit Skeletons/Dungeon(CC0) → 적, KayKit 애니 공유(동일 파이프라인).
  4. 아이콘: game-icons.net(4000+, CC BY=출처표기). 오디오: Kenney Audio·Freesound(CC0/혼합)·Incompetech(CC BY 음악)·OpenGameArt CC0.
- 라이선스: CC0=출처표기 불필요(KayKit/Quaternius/Kenney) 우선. CC BY=크레딧 화면 관리 필요(game-icons/Incompetech).
- 파이프라인 확장: render_sprites.py에 Quaternius 몬스터 경로만 추가하면 배치 렌더 가능.
- 우선순위: (1)Quaternius 몬스터→파이프라인 테스트 (2)Kenney UI/Audio (3)game-icons 아이콘 (4)Incompetech/Freesound BGM·SFX.
- 후속 제안: 게임팩(axdata_01) docs/ASSET_SOURCES.md로 정식 문서화 가능(지시 시).

## 2026-07-16 — axdata_09 치비/무기제거 프롬프트 미반영 확인 + 데스크탑 수정 목록
- 요청: 이전에 수정했던 axdata_09 프롬프트(치비·무기없음)가 반영됐는지 확인 → 데스크탑에서 직접 고칠 테니 내용 정리.
- 확인(GitHub 직접): axdata_09의 main·기본브랜치(claude/work-prep-status-check-axn3lj) 둘 다 **옛날 값**. 이전 세션 편집이 push 안 됨 → 데스크탑 pull에도 안 내려왔음. 이것이 "여전히 무기 들고 있음"의 원인.
- 수정 목록(데스크탑에서 4개 파일):
  1. app/models.py (GenBase): art_style "semi-realistic digital painting" → "cute big head chibi 3D game render, glossy, vibrant colors"; keywords "" → "big head chibi, no weapon, empty hands, no helmet, face and hair visible, full body".
  2. app/static/index.html: art_style input value 를 위 치비 문구로; keywords input 에 같은 문구를 value 로 추가(현재 value 없음, placeholder만).
  3. app/services/asset_catalog.py (ART_STYLES): 맨 앞에 "cute big head chibi 3D game render, glossy, vibrant colors" 추가(드롭다운 기본값 일치).
  4. app/services/gpt_service.py (SYSTEM_PROMPT) — **핵심**: "Describe the outfit AND any weapon concretely..." 문장을 "기본적으로 무기 없음·빈손·팔 내림, 키워드가 명시할 때만 무기; 얼굴 가리는 헬멧 금지"로 교체. 이 문장이 GPT가 visual_core에 무기를 써넣게 하던 근원.
- 근거: 무기의 실제 출처는 SYSTEM_PROMPT→visual_core. models/index/catalog는 치비 룩·기본값 프리필용. 4번이 무기 제거의 결정타.
- 후속: 데스크탑 수정 후 서버 재시작→Ctrl+F5→kael 재생성으로 무기 없음·치비 확인.
