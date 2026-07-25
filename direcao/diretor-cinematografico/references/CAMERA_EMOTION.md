# Camera–Emotion Sync

**A câmera é o duplo emocional do personagem focal.** Movimento de câmera, lente e duração devem ser escolhidos pela emoção do personagem — não pelo que parece "cinematográfico". Raiva recebe handheld nervoso. Calma recebe respiração suave. Choque congela. Esta é a regra mais violada em AI video — corrija explicitamente em cada prompt.

---

## 1. Mapa movimento × emoção

| Emoção do personagem focal | Tipo de câmera | Como escrever no prompt (EN) |
|---|---|---|
| **Raiva / tensão / no limite** | Handheld breathing, **jittery, unstable** — broken breath rhythm, visible vertical/horizontal twitches | `CAMERA: HANDHELD. Nervous breathing jitter — irregular vertical/horizontal micro-shakes. NO stabilizer.` |
| **Calma / controle / confiança** | Handheld breathing, **smooth** — steady breath, regular micro-amplitude | `CAMERA: HANDHELD. Smooth, controlled breathing motion — barely perceptible regular micro-drift. NO stabilizer.` |
| **Tristeza / vulnerabilidade** | Handheld, **slow, low** — lower breath frequency, slight downward drift | `CAMERA: LOW HANDHELD. Slow breathing rhythm, gentle downward drift. Weighted, heavy quality.` |
| **Choque / revelação** | Static + slow push-in ou pull-out — freeze no início, depois movimento muito lento | `CAMERA: STATIC. Holds completely still for 0.5 sec — then extremely slow push-in. Total movement under 15cm.` |
| **Ação** | 60fps, 180° shutter — movimento claro, motion blur dentro do range do shutter | `CAMERA: 60fps, 180° shutter. Clean motion blur, no ghosting beyond shutter range.` |
| **Beat final / veredicto** | Top-shot freeze 0.3–0.5 sec — diretamente de cima, tempo congela | `CAMERA: STRICT TOP SHOT. 0.3–0.5 sec freeze frame. All subjects frozen. Time stops.` |

---

## 2. Arcos emocionais dentro de um único plano

Se a emoção **muda** ao longo de um take contínuo (ex: personagem vai de raiva → controle), a câmera muda de forma síncrona. Escreva em fases explícitas, amarradas aos beats numerados do ator:

```
CAMERA — beats ①②: nervous handheld, jittery irregular breathing shake.

CAMERA — beats ③④: handheld gradually stabilizes — amplitude shrinks, rhythm regularizes.

CAMERA — beats ⑤⑥⑦: smooth controlled breathing only — barely visible micro-drift.
```

Cada fase da câmera deve corresponder a um beat numerado de atuação (① ② ③...) para que o modelo saiba quando transicionar.

---

## 3. Seleção de lente

| Uso | Lente | Abertura |
|---|---|---|
| Close-up emocional extremo (testa ao queixo preenche o quadro) | **85mm** ou **100mm** | F1.4 |
| Diálogo mid-shot, two-shot | **50mm** | F2.0 – F2.8 |
| Wide / estabelecimento | **35mm** | F4 – F5.6 |
| Insert / detalhe de objeto | **50mm** ou **85mm** com foco travado no objeto | F1.4 |
| Macro (poros, gotas, tecido) | **45mm macro** | F2.8 |

**Proibir distorção óptica** em todo prompt que usa lente wide ou rápida:
```
No barrel distortion, no pincushion distortion, no fisheye effect, no wide-angle warping.
Straight lines must be straight. Frame geometry must be clean.
```

**Bokeh / shallow DOF** para inserts emocionais — usar F1.4 e travar foco:
```
⚠️ Focus plane strictly locked on [object/character] — NO focus drift, NO rack focus, NO autofocus jump.
```

---

## 4. Dolly / track moves

Para dolly muito lento (insert / close-up de objeto), especifique **distância e tempo exatos**:
```
Total camera movement across the entire Xs: approximately 10–15cm only.
Speed slow enough to be barely perceptible. NO zoom. NO sudden push or pull.
```

Nunca escreva `zoom`. Sempre escreva movimento físico de câmera (`dolly`, `track`, `crane`, `push-in`, `pull-out`).

---

## 5. Regras de duração de plano

| Tipo de plano | Duração |
|---|---|
| Flash establishing (split-second wide) | **0.3 – 0.5 seg** (fração de segundo, NÃO 1 segundo) |
| Uma linha de diálogo, duração média | **3 – 7 seg** |
| Reação sem palavras (com arco emocional) | **5 – 10 seg** |
| Insert / wide / freeze | **0.3 – 2 seg** |
| Close-up emocional com arco completo (5–7 beats) | **8 – 15 seg** |

---

## 6. Templates copy-paste

### 6.1 — Extreme tight close-up de diálogo (85mm, F1.4)

```
LENS: 85mm (or 100mm) telephoto. F1.4 shallow DOF.
FRAMING: Strict extreme tight close-up — forehead to chin fills the frame.
⚠️ CAMERA: HANDHELD. Full breathing drift throughout — real-photographer heartbeat feeling.
Camera actively follows character's face — any subtle turn, lift, or drop, camera micro-adjusts to reframe.
BACKGROUND: Completely defocused into soft color blobs and bokeh highlights.
```

### 6.2 — Insert em objeto (foco travado)

```
LENS: 50mm or 85mm prime. F1.4 shallow DOF.
⚠️ FOCUS: Locked on [object] from frame 1 to last frame — NO drift, NO rack focus, NO autofocus jump.
Only [object] is sharp. Everything else: heavy bokeh, blurred color blobs.
CAMERA: [angle]. Extremely slow dolly [direction] — total movement ~10–15cm across entire Xs. NO zoom.
```

### 6.3 — Wide / establishing flash (split-second)

```
LENS: 35mm wide. Wide shot / establishing shot.
⚠️ DURATION: Strictly 0.3–0.5 seconds — split-second spatial flash only, not a full composition hold.
[Positions of all key elements in frame.]
ACTION: [moment] — then immediate hard cut to next shot. No transition, no fade, no hold.
```

### 6.4 — Top-shot freeze final

```
CAMERA: Strict top-shot, directly overhead.
0.3–0.5 sec freeze frame. All subjects frozen. Time stops.
```

---

## 7. Movimentos proibidos

- `NO zoom` — movimento físico de câmera apenas
- `NO stabilizer` quando handheld — breathing deve ser visível
- `NO shake besides intentional handheld breathing`
- `NO over-movement` — se o roteiro é íntimo, a câmera é íntima
