# Camera Language Reference — Seedance 2.0

**Leia este arquivo quando precisar construir o bloco `camera:` de qualquer prompt.**

---

## 1. Vocabulário de movimentos

| Movimento | Sintaxe Seedance | Quando usar |
|---|---|---|
| Aproximação lenta | `dolly-in slow from [plano] to [plano]` | Revelação emocional, clímax |
| Afastamento | `pull-back revealing [o que é revelado]` | Contexto, solidão, escala épica |
| Acompanhamento traseiro | `rear steadicam chase locked [distância] behind subject at matching velocity` | Ação, perseguição, tensão |
| Lateral suave | `smooth gimbal lateral tracking shot` | Apresentação de personagem, ambiente |
| Arco de elevação | `crane up from eye level revealing [o que é revelado]` | Épico, contexto, fim de cena |
| Arco circular | `smooth gimbal arc shot, starting [posição] → rising to [posição] → [resolução]` | Reveal de produto, abertura dramática |
| Ângulo baixo | `low angle [altura]cm from ground, camera tilted upward [graus] degrees` | Poder, ameaça, grandiosidade |
| Whip pan | `whip pan [graus] degrees revealing [o que corta para]` | Energia, corte rápido dentro do clip |
| Rack focus | `rack focus from [foreground] to [subject]` | Desvio de atenção, revelação |
| Bullet time | `bullet time 360° orbit around [ponto de impacto/sujeito]` | VFX, ação estilizada |
| Documental | `handheld slight documentary shake, controlled stabilized motion` | Realismo, tension emocional |
| Close extremo | `dolly-in slow from medium shot to extreme close-up, rack focus on eyes` | Emoção, intensidade |

---

## 2. Câmera × Emoção (versão Seedance)

O Seedance responde a **camera como instrução de estado emocional**, não como estética. Use estas equivalências:

| Emoção do personagem | Instrução de câmera |
|---|---|
| Raiva / tensão | `handheld, jittery breathing rhythm, visible micro-tremors, irregular amplitude` |
| Calma / controle | `smooth handheld breathing, barely perceptible micro-motion, steady rhythm` |
| Tristeza / vulnerabilidade | `slow, low-position handheld, slightly downward drift, heavy breathing pace` |
| Choque / revelação | `camera starts completely static — 0.5s freeze — then imperceptibly slow push-in` |
| Ação / velocidade | `60fps, smooth velocity-matched tracking, motion blur within shutter angle only` |
| Clímax / final | `top-shot, perfectly overhead, 0.5-second freeze frame, all movement ceases` |

---

## 3. Lens selection

| Situação | Lente | Abertura |
|---|---|---|
| Close emocional extremo (rosto preenche o frame) | 85mm ou 100mm | F1.4 |
| Diálogo dois personagens | 50mm | F2.0–F2.8 |
| Wide / estabelecimento | 35mm | F4–F5.6 |
| Insert de objeto / detalhe | 85mm com focus lock | F1.4 |
| Macro (poros, gotas, tecido) | 45mm macro | F2.8 |
| Épico / paisagem | 24mm anamorphic | F8 |

> **Regra:** sempre especifique a lente se o prompt tiver close emocional ou insert — o Seedance default para focal genérico se você não declarar.

---

## 4. Qualificadores de velocidade

Use estes termos para modular o ritmo do movimento:

```
imperceptibly slow          → movimento quase invisível (≤10cm em 6s)
very slow                   → dolly contemplativo
slow                        → padrão cinematográfico
controlled                  → propositado, sem hesitação
matched velocity            → câmera = velocidade do sujeito (tracking)
rapid                       → corte interno rápido entre ângulos
```

---

## 5. Ângulos de câmera — referência rápida

```
eye level                   → neutro, próximo, íntimo
low angle (below waist)     → poder, ameaça, grandiosidade
high angle (above eye)      → vulnerabilidade, controle da cena
dutch angle (tilted)        → desorientação, psicológico
overhead / bird's eye       → mapa, escala, fim épico
POV (first-person)          → imersão, identificação
over-the-shoulder (OTS)     → diálogo, tensão relacional
```

---

## 6. Blocos de câmera prontos para copiar

### Reveal de produto / veículo
```
camera: smooth gimbal arc shot, starting low 30cm from ground → rising to hood level → pulling back to reveal full silhouette, 6-second controlled sweep.
```

### Chase / perseguição
```
camera: rear steadicam chase locked 2.5m behind subject at matching velocity, slight documentary breathing, irregular rhythm.
```

### Clímax emocional
```
camera: dolly-in slow from medium shot to extreme close-up on eyes, rack focus pulling from background to face, 85mm, F1.4.
```

### Ação multi-ângulo (Tipo C)
```
camera: rapid multi-angle system, interior close-up → exterior tracking → low ground shots, whip pans + speed ramp transitions between cuts.
```

### Establshing épico
```
camera: crane up from eye level revealing full [cityscape/landscape/scene], starting tight → wide panorama in 5 seconds.
```

---

## 7. Regras anti-fail

- **Nunca use `zoom`** → sempre movimento físico de câmera (`dolly`, `pull`, `push`, `track`)
- **`fixed_camera: true`** → desativa qualquer movimento; use só para estáticas puras
- **Movimentos contraditórios** → não combine `static` com `dolly-in` no mesmo clip
- **Shake vs. tremor** → `handheld breathing` (suave, intencional) ≠ `shaky cam` (caótico)
