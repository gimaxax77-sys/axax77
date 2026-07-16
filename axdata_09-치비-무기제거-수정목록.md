<!-- axdata_09 캐릭터 프롬프트를 치비·무기없음 기본값으로 바꾸는 수정 지시서 -->
# axdata_09 — 치비 / 무기없음 프롬프트 수정 지시서

> 데스크탑(원격제어) 세션 전달용. 아래 4개 파일을 그대로 고치면 됩니다.
> **무기가 나오는 진짜 원인은 ④번(GPT 프롬프트)** 입니다. ①~③은 치비 룩과 화면 기본값 미리채움용입니다.

## 배경 (왜 지금 안 되고 있었나)
- 이전 세션에서 파일을 고쳤지만 **GitHub에 push되지 않은 채 세션이 끝났습니다.**
- 그래서 데스크탑에서 `update.bat`으로 pull 받아도 **옛날 코드만** 내려왔고, 결과가 "여전히 무기 들고 있음"이었습니다.
- 확인: `main` 브랜치와 기본 브랜치(`claude/work-prep-status-check-axn3lj`) **둘 다 옛날 값**입니다. 아래 수정은 이 두 브랜치 중 **세션이 실제로 여는 브랜치**에 하면 됩니다(보통 기본 브랜치).

---

## ① `app/models.py` — 클래스 `GenBase`

```python
# ── 바꾸기 전 ──
art_style: str = Field("semi-realistic digital painting", description="아트 스타일")
keywords: str = Field("", description="추가 키워드(쉼표)")

# ── 바꾼 후 ──
art_style: str = Field("cute big head chibi 3D game render, glossy, vibrant colors", description="아트 스타일")
keywords: str = Field("big head chibi, no weapon, empty hands, no helmet, face and hair visible, full body", description="추가 키워드(쉼표)")
```

---

## ② `app/static/index.html` — 입력칸 기본값 (기본 정보 그룹 안)

```html
<!-- 아트 스타일: value 교체 -->
<!-- 바꾸기 전 -->
<input name="art_style" type="text" class="mt6" value="semi-realistic digital painting" />
<!-- 바꾼 후 -->
<input name="art_style" type="text" class="mt6" value="cute big head chibi 3D game render, glossy, vibrant colors" />
```

```html
<!-- 추가 키워드: value 새로 추가 (지금은 placeholder만 있고 value 없음) -->
<!-- 바꾸기 전 -->
<input name="keywords" type="text" placeholder="예: 얼음, 늑대" />
<!-- 바꾼 후 -->
<input name="keywords" type="text" value="big head chibi, no weapon, empty hands, no helmet, face and hair visible, full body" placeholder="예: 얼음, 늑대" />
```

---

## ③ `app/services/asset_catalog.py` — `ART_STYLES` 리스트 맨 앞에 한 줄 추가

```python
ART_STYLES = [
    "cute big head chibi 3D game render, glossy, vibrant colors",   # ← 이 줄 추가 (맨 위)
    "semi-realistic digital painting",
    "anime cel shading",
    "watercolor illustration",
    # ...(나머지 그대로)
]
```

---

## ④ `app/services/gpt_service.py` — `SYSTEM_PROMPT` (★핵심 · 무기 제거)

찾을 문장 (현재 이 문장이 GPT에게 무기를 그려 넣으라고 지시함):

```
Describe the
outfit AND any weapon concretely so both clearly match the genre (e.g. wuxia
swords = slender jian or curved dao, NOT western broadswords; sci-fi = energy
weapons, NOT medieval swords).
```

아래로 **교체**:

```
Describe the OUTFIT concretely to match the genre. By DEFAULT the character
holds NO weapon and keeps empty, relaxed hands with arms lowered naturally at
the sides (weapons and props are generated separately), UNLESS the brief's
keywords explicitly ask for a held weapon. Do NOT add a full face-hiding
helmet; keep the face and hair fully visible.
```

---

## 수정 후 확인 순서
1. 파일 4개 저장 → 서버 재시작 (`stop.bat` → `start.bat`, 또는 `update.bat`).
2. 브라우저에서 **Ctrl+F5** (강력 새로고침).
3. 화면 확인: **아트 스타일 칸 = 치비 문구**, **추가 키워드 칸 = 무기없음 문구**가 미리 채워져 있어야 함.
4. **kael 재생성** → 무기 없음 + 큰머리 치비인지 확인.
5. 확인되면 커밋·push (다른 기기가 pull로 받도록).

## 참고 (선택 — 안 고쳐도 됨)
- `gpt_service.py`의 `_ENTITY_GUIDE["character"]`에 `무기(weapon)` 문구가 남아 있는데, 이건 **도감 설정 텍스트(정보란)** 에만 쓰이고 **그림에는 영향이 없습니다.** 굳이 안 고쳐도 됩니다.
