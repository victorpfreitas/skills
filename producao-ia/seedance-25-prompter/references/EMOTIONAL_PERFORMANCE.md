# Direção Emocional e Performance Observável — Seedance 2.5

**Leia este arquivo para dirigir atuação de personagem — como converter emoção abstrata em algo que o modelo consegue de fato renderizar.**

---

## 1. Princípio central

Palavras de emoção como "tenso", "quente", "opressivo" comunicam uma direção geral, mas deixam a performance aberta demais pra interpretação. Para controle estável de atuação, adicione cues diretamente visíveis ou audíveis: movimento dos olhos, tensão da sobrancelha, movimento da boca, respiração, direção do olhar, movimento das mãos.

Não é necessário listar todo detalhe facial. Para uma única transição emocional, 2–4 cues claros já bastam. Use estágios disparados por evento só quando a emoção muda várias vezes.

---

## 2. Transição emocional única — estrutura padrão

```
The overall emotion shifts from <starting emotion> to <ending emotion>.
After <triggering event>, <subject> first shows <immediate observable reaction>.
Then, <eyes, brows, mouth, breathing, gaze, or hand movement> gradually <changes>.
Finally, <subject> expresses <target emotion> through <restrained or explicit outward behavior>.
```

---

## 3. Emoção multi-estágio — progressão por eventos de gatilho

Use quando a emoção muda várias vezes ao longo do clip/estágio:

```
When <subject> hears or sees <first triggering event>, <first observable reaction>.
When <second triggering event> occurs, <change in expression, gaze, or breathing>.
After confirming <critical information>, the emotion that <subject> tries to restrain or conceal gradually becomes visible through <observable behavior>.
Finally, <subject's final action, expression, or manner of speaking>.
```

### Exemplo oficial
```
Applause marking the end of the performance comes from behind the stage. The young actor's fingers suddenly stop on the program, the gaze turns slowly toward the curtain, and the shoulders remain tense.

After confirming that the curtain call is over, the actor exhales softly. The shoulders gradually relax, a restrained smile appears, and the eyes slowly well with tears, but the actor never turns to leave.
```

---

## 4. Catálogo de microexpressões (herdado e válido no 2.5)

Sempre escreva em inglês, sempre especifique músculo/região.

```
Tensão / raiva controlada: jaw tightens visibly, teeth nearly clenched, nostrils flare on exhale, eyes narrow 10 degrees
Reconhecimento: eyes widen 15%, pupils dilate slightly, brows lift asymmetrically — left higher than right
Tristeza suprimida: lower lip barely suppressed, chin muscle tightens, eyes fill without blinking, gaze drops slightly
Choque / freeze: face goes completely still — all micro-movement ceases — brief total freeze before any reaction begins
Alívio: shoulders drop, jaw unclenches, exhale visible through slightly parted lips, eyes soften
Desconfiança: head tilts 5 degrees, one eyebrow lowers while the other stays level, lips press together
Determinação: chin drops slightly, eyes fix on target without blinking, jaw set, exhale through nose only
Medo dissimulado: rapid swallow, throat moves visibly, eyes hold steady but blink rate increases
```

---

## 5. Exemplo de produção real (30s, transição única sustentada)

Do guia oficial — mostra como estender uma única transição emocional ao longo de um vídeo de 29s usando estágios com gatilho + reação observável, sem repetir a mesma nota emocional:

```
Stage 1 (0-3s) [Questioning]: direct gaze, no tears yet, brows slightly furrowed, whispers softly.
Stage 2 (3-10s) [Resignation]: gaze shifts away, eyelids droop, brief smile that instantly fades, one controlled breath.
Stage 3 (11-17s) [Remembering]: camera pushes in, gaze slowly scans the other person's face, eye rims reddish but tears held back, jaw tightens.
Stage 4 (18-23s) [Regret]: eyes lower, first tear falls without warning, brows slowly relax, faint head shake.
Stage 5 (24-29s) [Letting Go]: extreme close-up, gentle smile forms, second tear slides, restrained trembling voice line, smile freezes on face.
```

Cada estágio muda **um** eixo observável por vez (olhar → respiração/sorriso → lágrima → alívio) — não empilhe várias mudanças físicas no mesmo estágio.

---

## 6. Como combinar com Negative Prompts

Performance contida se beneficia especialmente de negative prompts pra evitar exagero — o modelo, sem restrição, tende a "sobre-atuar":
```
[Negative Prompts]: No exaggerated crying, no fast cuts, no large body movements, no runny nose, no premature dropping of tears.
```
