# Video Extension e Seamless Transitions — Seedance 2.5

**Leia este arquivo para estender um vídeo além do início/fim, ou para criar uma transição contínua entre dois vídeos distintos.** Nenhum dos dois existe no Seedance 2.0.

---

## PARTE 1 — Video Extension

Extensão cria conteúdo além da fronteira de um vídeo fonte. O aspect ratio é sempre herdado automaticamente do vídeo fonte (não configurável); a duração da extensão é configurável (ver `PARAMETERS_AND_LIMITS.md` §4).

**Regra central:** alinhe o frame de fronteira ANTES de descrever o conteúdo novo.
- Extensão **forward** (depois do vídeo original) — o primeiro frame da extensão continua o último frame do vídeo fonte.
- Extensão **backward** (antes do vídeo original) — o último frame da extensão conecta com o primeiro frame do vídeo fonte.

Além do frame de fronteira, verifique se personagens, props, fundo e eventos do segmento estendido estão corretos.

### Limites (via interface Dreamina)
- Só vídeos originais com menos de 30s são elegíveis pra extensão.
- Cada operação de extensão suporta 4–30s adicionais.
- Extensão é **aninhável** ("nesting-style"): pode estender o resultado já estendido de novo, desde que o total ainda esteja dentro de 30s antes de cada nova operação. No limite: um vídeo original de 30s + extensão de 30s = até 60s num único fluxo.

---

### 1. Extensão Forward — template básico

```
@Video 1 is the source video to extend forward.
Extend @Video 1 forward. The first frame of the extended segment directly continues from the last frame of @Video 1. Maintain continuity in <subject pose and orientation>, <prop position>, <background and spatial relationships>, <camera position and composition>, <lighting>, and <motion direction>.

Then, <describe the new action, event, camera treatment, or audio to add>.

Throughout the extension, maintain continuity in <character identity and clothing>, <key props>, <background layout>, and <axis of action>.
Keep each subject as the same continuous instance throughout: do not duplicate or split it, and keep the person's appearance or the object's number of parts stable.
```

### Exemplo
```
@Video 1 is the source video to extend forward.
Extend @Video 1 forward. The first frame of the extended segment directly continues from the last frame of @Video 1. Maintain the same locked-off medium shot, the orange paper airplane's position and orientation, the classroom-window background, the afternoon lighting, and its movement toward the right side of the frame.

Then, the orange paper airplane continues gliding toward the right and exits the frame while the white curtain beside the window sways slightly. Keep the camera and classroom background in the state established by the source video's last frame.
```

### Com referências adicionais
Defina o papel de cada material extra primeiro, e deixe claro que o vídeo fonte controla a fronteira da extensão — novas referências podem suplementar personagens/props/áudio, mas não podem sobrepor o controle do último frame sobre a imagem de abertura da extensão.
```
@Image 1 defines <Character A>'s facial features.
@Image 2 defines <Character A>'s clothing.
@Image 3 defines <key prop>'s structure and material.
@Video 1 is the source video to extend forward.
Extend @Video 1 forward. The first frame of the extended segment directly continues from the last frame of @Video 1. Maintain continuity in <boundary-frame state>.
Then, <Character A uses the key prop to complete a new action or event>.
```

---

### 2. Extensão Backward — template básico

Primeiro descreva o que acontece **antes** do vídeo fonte começar, depois defina o primeiro frame do vídeo fonte como o end state explícito do segmento estendido. Escrever só "conecte com o vídeo fonte" pode introduzir personagens/efeitos tarde demais ou fazer a imagem mudar de novo depois de alcançar o estado alvo.

```
@Video 1 is the source video to extend backward.
Extend @Video 1 backward. Before the source video begins, <describe the preceding action, event, camera treatment, or audio>.

The last frame of the extended segment naturally connects to the first frame of @Video 1: <subject pose and orientation>, <prop position>, and <background and spatial relationships>. Match the <camera position and composition>, <lighting>, and <motion direction> of @Video 1's first frame.

Throughout the extension, maintain continuity in <character identity and clothing>, <key props>, <background layout>, and <axis of action>.
Keep each subject as the same continuous instance throughout: do not duplicate or split it, and keep the person's appearance or the object's number of parts stable.
```

### Exemplo
```
@Video 1 is the source video to extend backward.
Extend @Video 1 backward. Before the source video begins, show an empty establishing shot of the same glass greenhouse. Morning mist drifts slowly near the floor, the overhead shade rises gradually, and no people are present yet.

The last frame of the extended segment naturally connects to the first frame of @Video 1. Match the greenhouse's central aisle, planting tables on both sides, glass frame, soft morning light, and locked-off wide composition. At the end, the shade is fully raised, the aisle is empty, and the leaves still sway slightly.
```

### Com referências adicionais
Declare cada material e diga explicitamente quais materiais devem aparecer **só depois** que o vídeo fonte começa — reduz o risco de personagens/props/efeitos posteriores entrarem cedo demais no segmento anterior.
```
@Image 4 defines the gray workwear of two <Exhibition Assistants>.
[...]
<Materials that should appear only after the source video begins> must not appear early in the backward extension.
```

Boundary frames se conectam naturalmente no nível visual — isso não significa pixel-idêntico. Revise os dois lados da fronteira e o segmento estendido completo.

---

## PARTE 2 — Seamless Video Transitions (entre DOIS vídeos)

Diferente de extensão (que trabalha em UM vídeo), transição sem costura gera conteúdo de ponte contínuo **entre dois vídeos distintos** já existentes.

```
Before Video → After Video → Trigger Action → Camera Movement → Visual Transformation → Arrival State → Audio
```

### Template básico
```
@Video 1 is the before-transition clip. Use its <ending subject, action, composition, camera direction, and audio>.
@Video 2 is the after-transition clip. Use its <opening subject, composition, camera direction, and audio>.

Keep <character identity, product structure, scene, and primary action> stable in the original portions of @Video 1 and @Video 2.

At the end of @Video 1, <subject or foreground object> triggers the transition through <action>.
The camera <movement direction and speed change>, while <shape, material, light, or space> gradually transforms into <corresponding element> at the start of @Video 2.
The transition ends naturally at @Video 2's opening composition, preserving continuity in <subject position, camera direction, and motion trend>.
Audio transitions smoothly from <before audio> to <after audio>.
```

### Exemplo
```
@Video 1 is the before-transition clip. Use its rainy night street, red umbrella, slow push-in, and rain sound.
@Video 2 is the after-transition clip. Use its circular gallery skylight, upward camera movement, and quiet interior reverberation.

At the end of @Video 1, the red umbrella approaches the camera and gradually fills the entire frame, triggering the transition.
The camera continues moving forward. The umbrella's circular edge gradually becomes the skylight's metal ring, and the red fabric transitions into white daylight passing through the skylight.
The transition ends naturally at @Video 2's upward-looking opening composition, with the camera movement changing smoothly from forward motion to an upward rise.
The rain gradually fades into footsteps reverberating inside the gallery.
```

### Métodos de transição e o que especificar

| Método | O que especificar |
|---|---|
| Dive / movimento reverso | Direção da câmera, mudança de velocidade, quando a próxima cena começa |
| Rotação de personagem | Pose, direção de rotação, como roupa/fundo mudam continuamente |
| Oclusão de primeiro plano | Quando o objeto de primeiro plano preenche o frame e a composição que segue |
| Morph de objeto | Formas correspondentes, materiais, e o processo de transformação |
| Push/pull ou mudança de foco | Movimento de câmera, alvo de foco, relação espacial contínua |

**Meta da transição sem costura é continuidade visual e sonora** — o prompt pode pedir para preservar o conteúdo primário dos dois vídeos fonte, mas a ponte gerada não é um corte pixel-idêntico.

---

## PARTE 3 — Tipos de corte/transição dentro de um clip (referência de biblioteca)

Use essa tabela tanto para cortes dentro de um mesmo prompt (`CAMERA_AND_CINEMATOGRAPHY.md` §5) quanto para guiar o "trigger action" de uma seamless transition entre dois vídeos.

| Tipo | O que é | Quando usar |
|---|---|---|
| **Natural shot switching** | Como um corte seco, mas exige "sensação de respiração" e duração coordenada — não é hard cut abrupto | Maioria das narrativas convencionais |
| **Fade in/fade out** | Imagem escurece/clareia totalmente entre planos | Início/fim de vídeo, passagem de tempo |
| **Stacking (dissolve)** | Uma imagem vai ficando transparente enquanto a outra surge, sobrepondo por 1–2s | Memória, sonho, passagem lenta de tempo, transição lírica |
| **White flash / black flash** | Tela pisca branco/preto e corta pra próxima cena | Impacto visual, sincronizado com batida/som, alta energia |
| **Erase** | Imagem B "empurra"/apaga a imagem A a partir de uma direção, como porta deslizante | Estilo retrô, mudança óbvia de local |
| **Mask transition** | Câmera avança e é bloqueada por um objeto (parede, costas, pilar), tela fica preta, próxima cena revelada ao puxar da escuridão | Salto espacial/dimensional |
| **Similar object transition** | Último frame de um plano é extremamente similar em forma/contorno/cor ao primeiro frame do próximo | Montagem — ex.: lua cheia vira espuma de café circular |

Cada tipo tem a mesma fórmula: `[Transition Type Guide] + [Basic constraint requirement] + [Cutting/transition logic requirement]` — declare o tipo, a coordenação de respiração/duração, e o resultado de composição esperado.

---

## Checklist

- [ ] Extension: frame de fronteira alinhado ANTES de descrever conteúdo novo
- [ ] Extension: aspect ratio não configurado manualmente (herdado do vídeo fonte)
- [ ] Extension backward: materiais que só devem aparecer após o vídeo fonte estão marcados como tal
- [ ] Transition: os dois vídeos (`@Video 1`/`@Video 2`) têm papel de "before"/"after" declarado
- [ ] Transition: ação de gatilho, movimento de câmera e estado de chegada estão todos descritos
- [ ] Não prometi resultado pixel-idêntico — apenas continuidade visual/sonora
