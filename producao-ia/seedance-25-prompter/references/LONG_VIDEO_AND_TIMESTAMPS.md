# Vídeo Longo, Stages e Timestamps — Seedance 2.5

**Leia este arquivo para vídeos de 30s+ (estágios), vídeo longo nativo (30–180s), ou quando precisar de controle de timestamp preciso.**

---

## 1. Quando usar cada abordagem

| Situação | Abordagem |
|---|---|
| Clip único, uma ação, sem necessidade de handoff crítico de tempo | Fórmula central simples (`PROMPT_FORMULA_AND_SYNTAX.md`) — não force timestamps |
| Vídeo de até ~30s com múltiplos eventos/mudanças de estado | **Stages** (seção 2) |
| Vídeo de 30–180s numa geração só | **Long Video mode** (seção 4) — modo dedicado na plataforma, não precisa segmentar manualmente |
| Handoff/entrada/saída/transição precisa em um segundo específico | **Timestamps de precisão** (seção 3), combinado com stages |

---

## 2. Vídeos com múltiplos eventos: organize por Stages

Quando o vídeo contém vários eventos, divida a história em estágios consecutivos. Cada estágio recebe **apenas uma** mudança de estado primária, e declare o que precisa estar diretamente visível ao final desse estágio.

### Template
```
[Generation Goal]
Generate a <video type>. The central subject is <subject>, and the primary event is <story summary>.

[Stage 1]
Initial state: <initial state of characters, props, and scene>.
Primary event: <one primary action or event>.
End state: <character positions, prop ownership, or visible scene state>.

[Stage 2]
Continue from the previous stage: <state that must remain unchanged>.
Primary event: <one primary action or event>.
End state: <observable state>.

[Stage 3]
Primary event: <closing event>.
End state: <final visible state>.

[Maintain Consistency]
Keep <character identity, number of characters, clothing, prop ownership, spatial direction, and audio relationships> consistent.
```

### Exemplo oficial
```
[Generation Goal]
Generate an instructional video showing a flower shop's order-packing process. <Florist> and <Store Assistant> arrange, wrap, and hand off a bouquet together.

[Stage 1]
Initial state: <Florist> stands behind the workbench. Loose flower stems, scissors, and wrapping paper lie on the tabletop.
Primary event: <Florist> arranges the stems and trims them to length.
End state: <Florist> holds the bouquet in the left hand, and the scissors are back on the right side of the workbench.

[Stage 2]
Continue from the previous stage: both characters retain the same identities and clothing, and <Florist> still holds the bouquet.
Primary event: <Store Assistant> unfolds the wrapping paper. <Florist> places the bouquet inside and ties it with a green ribbon.
End state: the wrapped bouquet lies flat in the center of the workbench, with the ribbon bow facing the camera.

[Stage 3]
Primary event: <Store Assistant> picks up the bouquet and places it on the pickup shelf.
End state: the bouquet is centered on the pickup shelf, and both characters stand behind the workbench inspecting the finished order.

[Maintain Consistency]
Keep <Florist> and <Store Assistant>'s identities, clothing, workbench orientation, scissors position, and bouquet ownership consistent.
```

---

## 3. Timestamps e controle de ritmo

Para narrativas comuns, use estágios por padrão. Use precisão de segundo **só** quando precisar controlar um handoff crítico, entrada/saída, transição, ou beat explícito. Timestamps demais viram ruído — não use pra forçar frequência de ações (ex.: não peça "complete três ações em um segundo").

| Padrão | Exemplo |
|---|---|
| Faixa de tempo | `0-3 seconds... 3-7 seconds... 7-12 seconds...` |
| Ponto de tempo exato | `At 5 seconds, the camera whip-pans rapidly to the left and completes the transition.` |
| Tempo relativo | `Three seconds after the character presses the button, the room lights gradually turn off.` |

**Regras:**
- Faixas de tempo devem ser consecutivas e não sobrepostas — representam um **orçamento de tempo** para o evento, não um ponto de corte exato. A ação pode ocorrer um pouco antes ou depois da fronteira.
- Faixa com pouco conteúdo dá mais liberdade ao modelo; faixa com conteúdo demais pode causar corte excessivo ou eventos omitidos.
- Timestamps melhoram a probabilidade de eventos críticos se alinharem, mas **não garantem** sobreposição quadro a quadro.

### Exemplo de uso de faixa de tempo
```
0-5 seconds: Show an empty wooden display table. A hand places a white ceramic plate on it. End state: the hand has left the frame, and only the white plate remains in the center of the table.
5-10 seconds: Remove the white plate, then place a clear glass on the table. End state: only the clear glass remains in the center of the table.
10-15 seconds: Remove the clear glass, then place a green ceramic vase on the table. End state: only the green vase remains in the center of the table.
```

---

## 4. Long Video mode (30–180s numa geração só)

Modo dedicado na plataforma ("Long Video"), diferente de encadear extensões manualmente. Suporta seleção livre entre 30–180s.

### Fórmula de produção para vídeo longo
```
Complete prompt = [Global Parameters] + [Creatives Description] + [One-sentence Overview] + [Specific Plot Description] + [Global Supplement (End)]
```

- **Global Parameters** — por causa da duração longa, vale reforçar no início do texto quantos minutos/segundos e qual aspect ratio, mesmo já configurado na plataforma.
- **Creatives Description** — número da referência (ordem de upload) + propósito específico.
- **One-sentence Overview** — Subject + Location + Event + Theme/Style + Special Camera Movement.
- **Specific Plot Description** — timeline/storyline com blocos ➕ positivos e ➖ negativos (ver `PROMPT_FORMULA_AND_SYNTAX.md` §2).
- **Global Supplement (End)** — reforce elementos/detalhes que precisam persistir o vídeo inteiro (posição de câmera, ambiente, som/atmosfera geral, luz), e reforce restrições globais (sem legenda, sem BGM).

### Exemplo (vídeo de 3 minutos, cat vlog)
```
Full length 3 minutes, @image1 cat working vlog, video aspect ratio 16:9, a day as a waiter with an orange cat as the main character, it goes from waking up brushing teeth and washing face, riding an electric scooter to a street-side small shop, arriving at work early morning wiping tables and clocking in, welcoming guests guiding them to seats and handing menus, scene reference @image6-10, overall restaurant reference @image11, he carefully delivers meals to the tables of customers @image2345, taking a nap and secretly nibbling on dried fish during lunch break, collecting dried fish tips and clearing tables in the evening, finally closing up and curling up to rest by the window, riding the electric scooter, returning to the room reference @image12, washing up, eating, sleeping. No subtitles throughout, no background music.
```

### Exemplo (vídeo de 1 minuto, café retrô, com faixas de tempo detalhadas)
```
Video duration 1 minute, aspect ratio 16:9, cinematic realistic picture quality, retro healing style. On a rainy afternoon, a fixed camera records the steaming coffee on the table of a retro cafe.

0s-20s (Quiet opening): fixed camera on wooden coffee table, hot steam rising, checkered glass window with drizzle outside. No shake, no characters entering frame, no hard cuts.
20s-40s (Detail push-in): camera pushes in extremely slowly toward the coffee cup. A golden fallen leaf sticks to the outside of the glass. No complex physical collisions, no object deformation, no text.
40s-60s (Focus shift and fade out): focus shifts smoothly from cup to rain scene outside, picture gradually darkens with the sound of rain. No flicker, no abrupt transitions.

Picture and light/shadow: maintain high-level contrast between indoor warm yellow light and outdoor cold rainy night throughout.
Sound and restrictions: only real natural white noise (rain on glass, subtle ambient sounds). No background music globally, no subtitles globally.
```

---

## 5. Video Extension como continuação (visão geral)

Extensão (forward/backward) é uma ferramenta separada de continuidade, não Long Video mode — ver `VIDEO_EXTENSION_AND_TRANSITIONS.md` para o fluxo completo (alinhamento de boundary frame, nested extension até 60s).

---

## 6. Checklist

- [ ] Cada estágio tem exatamente uma mudança de estado primária
- [ ] Cada estágio declara um end state observável
- [ ] Bloco `[Maintain Consistency]` presente no fechamento
- [ ] Timestamps só onde há handoff crítico — não onde estágios genéricos bastam
- [ ] Faixas de tempo consecutivas, sem sobreposição
- [ ] Para Long Video mode: parâmetros globais reforçados no texto, além de configurados na plataforma
