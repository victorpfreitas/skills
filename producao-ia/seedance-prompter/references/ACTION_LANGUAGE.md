# Action Language — Intensidade e Precisão

**Leia este arquivo quando precisar descrever ações de personagens, expressões e movimento físico.**

O Seedance **não infere grau**. A diferença entre "corre" e `launches forward at maximum velocity, legs alternating furiously` é a diferença entre um vídeo vago e um vídeo cinematográfico.

---

## Princípio central

**Especificidade física > abstração emocional**

O Seedance processa instrução muscular, não sentimento. "Triste" não gera nada útil. "Jaw tightens, lower lip barely suppressed, eyes fill without blinking" gera microexpressão de cinema.

---

## 1. Ações de movimento — de vago para preciso

| Vago | Preciso |
|---|---|
| `corre` | `launches forward at maximum velocity, legs alternating furiously, arms driving hard` |
| `anda` | `moves at deliberate measured pace, each step landing with controlled weight` |
| `para` | `halts abruptly — body absorbs the stop, forward momentum redistributed through bent knees` |
| `cai` | `collapses forward in slow motion, arms failing to react in time, knees buckling first` |
| `levanta` | `rises from ground using both hands first, then straightens torso slowly against weight` |
| `vira` | `pivots 180 degrees on left heel, coat trailing half a beat behind the turn` |
| `pula` | `explodes upward from flat feet — maximum vertical extension — hang at apex for 0.3s` |
| `arrasta` | `drags left foot slightly behind right with each step, weight heavy, reluctant motion` |

---

## 2. Ações de câmera de mão / gestos

| Ação | Descrição precisa |
|---|---|
| `apanha algo` | `reaches forward 40 degrees, fingers extending fully before contact, grip deliberate` |
| `empurra` | `drives palm forward into surface with full body weight behind the movement` |
| `abre porta` | `grips handle, pulls toward body — door opens to 90 degrees, body follows through the frame` |
| `olha para cima` | `tilts head back 25 degrees, gaze rising from horizon to ceiling plane` |
| `olha para baixo` | `drops chin toward chest, eyes tracking downward without moving the torso` |
| `gesticula` | `right hand cuts horizontal arc at chest level, palm facing down, controlled emphasis` |

---

## 3. Microexpressões faciais — catálogo

Sempre escreva em inglês no prompt. Sempre especifique músculo/região.

### Tensão / raiva controlada
```
jaw tightens visibly, teeth nearly clenched, nostrils flare on exhale, eyes narrow 10 degrees
```

### Reconhecimento / realization
```
eyes widen 15%, pupils dilate slightly, brows lift asymmetrically — left higher than right
```

### Tristeza suprimida
```
lower lip barely suppressed, chin muscle tightens, eyes fill without blinking, gaze drops slightly
```

### Choque / freeze
```
face goes completely still — all micro-movement ceases — 0.5 second total freeze before any reaction begins
```

### Alívio / release
```
shoulders drop 3cm, jaw unclenches, exhale visible through slightly parted lips, eyes soften
```

### Desconfiança / suspeita
```
head tilts 5 degrees right, one eyebrow lowers while the other stays level, lips press together
```

### Determinação
```
chin drops 5 degrees, eyes fix on target without blinking, jaw set, exhale through nose only
```

### Prazer / satisfação
```
lips curve at corners — asymmetric smile, left side 2cm higher — eyes crinkle at outer edges
```

### Medo (dissimulado)
```
rapid swallow, throat moves visibly, eyes hold steady but blink rate increases to every 1.5 seconds
```

### Emoção contida
```
face maintains composure — but breath comes slightly faster, chest rises more than usual, hands still
```

---

## 4. Linguagem de performance

Para cenas de ator (não ação), use blocos de **beats numerados**:

```
① [beat 1 — estado inicial]
② [beat 2 — primeiro estímulo / reação]
③ [beat 3 — processamento interno]
④ [beat 4 — decisão / ponto de virada]
⑤ [beat 5 — resolução / novo estado]
```

Exemplo real:
```
① Roko holds the photograph with both hands, still, studying it without expression.
② His right thumb moves slowly across the faces in the photo — barely perceptible.
③ Jaw tightens. Eyes don't blink. Breathing pauses for 1 full second.
④ He sets the photograph face-down on the table with deliberate precision — not a slam, a placement.
⑤ He stands, turns away from the table, chin level, eyes forward. Expression locked.
```

---

## 5. Qualificadores de velocidade e intensidade

```
at maximum velocity          → velocidade máxima
at deliberate pace           → lento mas intencional
barely perceptible           → movimento mínimo, quase invisível
imperceptible drift          → drift de câmera/personagem quase zero
furiously                    → máxima energia muscular
controlled                   → força + precisão, sem desperdício
explosive                    → energia instantânea do zero
```

---

## 6. Descrição de personagem — como fixar identidade

O Seedance perde consistência de personagem sem âncoras físicas explícitas. Sempre declare em cada clip que usa o personagem:

```
[personagem]: [nome/função], [características físicas fixas — cabelo, roupa, traços marcantes], [postura/energia]
```

Exemplos:
```
A young man in a grey wool coat — short dark hair, slight stubble, narrow jaw.
A woman in red qipao — dark hair pinned up, gold earrings, composed posture.
A samurai in green-and-black checkered haori — young, mid-length tied hair, katana at left hip.
```

**Regra para I2V:** nunca contradiga o personagem da imagem. Se a imagem mostra homem, o prompt é homem.

---

## 7. Constraints positivos — como declarar sem negação

| Problema | Constraint positivo |
|---|---|
| Rosto deformando | `anatomically accurate facial proportions throughout` |
| Roupa mudando | `maintain exact wardrobe consistency across all frames` |
| Foco perdendo | `razor-sharp subject focus, crisp facial detail throughout` |
| Texto aparecendo | `clean frame, no overlays, no watermarks, no subtitles` |
| Personagem drift | `maintain consistent facial features and identity throughout` |
| Distorção de lente | `no barrel distortion, no fisheye, straight lines throughout` |
| Mãos deformando | `anatomically correct hand geometry, natural finger positioning` |
