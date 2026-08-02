# Câmera e Cinematografia — Seedance 2.5

**Leia este arquivo para construir o bloco de câmera e usar termos cinematográficos com precisão.**

---

## 1. Linguagem básica de câmera (suportada diretamente)

| Tipo | Termos comuns suportados |
|---|---|
| Tamanho de plano | extreme wide shot, wide shot, medium shot, close-up, extreme close-up |
| Movimento de câmera | push in, pull out, pan, lateral move, follow shot, orbit, dive, dolly out, tilt up, handheld shake |
| Posição/ponto de vista | low angle, overhead view, first-person view |

Esses termos podem ir direto no prompt sem necessidade de tradução em "efeito visível" — mas se o termo for incomum ou tiver múltiplas interpretações, sempre declare a quem se aplica, como a imagem muda e o resultado visível esperado (ver seção 3).

---

## 2. Técnicas populares de câmera

Podem ser usadas diretamente no prompt. Se o frame tem múltiplos sujeitos, ainda declare qual sujeito a câmera segue/orbita e onde o movimento começa e termina.

| Técnica | O que especificar |
|---|---|
| One-take shot (plano-sequência) | Os sujeitos, espaços e eventos que a câmera contínua atravessa, em ordem |
| Dolly zoom | O tamanho do sujeito a preservar e se o fundo parece se aproximar ou afastar |
| Aerial view | Altura de visão, direção de movimento e área ambiental a revelar |
| FPV | Caminho de voo/travessia em primeira pessoa, velocidade e curvas |
| Bullet time | A ação a congelar/desacelerar e a direção de órbita da câmera |
| Handheld camera | O sujeito sendo seguido e a quantidade de tremor |
| Bounce speed ramp | Onde a ação acelera, desacelera, ou "quica", e seu estado final de repouso |

---

## 3. Termos incomuns de cinematografia

Para um termo nichado, com uso inconsistente na indústria, ou que o modelo pode não reconhecer, mantenha o termo e traduza para uma mudança visual diretamente observável:

```
Cinematography Term + Target Subject + Visual Change + Foreground/Background Relationship + Direction or Speed
```

Exemplo:
```
Rack focus: shift focus smoothly from the leaves in the foreground to the person in the background. The leaves gradually blur while the person's face changes from soft to sharp.
```

Para uma transição precisa, também declare o horário de gatilho, o objeto que oclui, a direção da câmera, o método de transição, e a composição/tendência de movimento que deve continuar depois.

### Exemplos de referência rápida
```
Shallow-depth-of-field portrait: keep <Pastry Chef>'s eyes and face sharp while the glass jars and lights in the background become soft, circular bokeh.

Tracking shot: move horizontally at the same speed as <Skateboarder>, keeping the subject sharp while the roadside wall forms horizontal motion blur from right to left.

Golden hour: warm, low-angle sunlight enters from behind and to the left of <Hiker>, casting long shadows across the mountain ridge.

Natural vignette: darken the four corners gradually while keeping the brightness and skin tone of <Pianist> in the center natural, without a black border.

Whip-pan transition: at 5 seconds, move the camera rapidly to the left. Cut when the foreground bookshelf fully covers the frame, then continue moving left at a similar speed in the next scene.
```

Valores de abertura, distância focal e obturador podem ser incluídos, mas o resultado visível pretendido costuma ser mais claro do que só um valor numérico isolado.

---

## 4. Câmera × Emoção

O modelo responde à câmera como instrução de estado emocional, não só estética. Use como ponto de partida (compatível com a lógica já validada no skill 2.0):

| Emoção do personagem | Instrução de câmera |
|---|---|
| Raiva / tensão | handheld, jittery breathing rhythm, visible micro-tremors, irregular amplitude |
| Calma / controle | smooth handheld breathing, barely perceptible micro-motion, steady rhythm |
| Tristeza / vulnerabilidade | slow, low-position handheld, slightly downward drift, heavy breathing pace |
| Choque / revelação | camera starts completely static — brief freeze — then imperceptibly slow push-in |
| Ação / velocidade | smooth velocity-matched tracking, motion blur within shutter angle only |
| Clímax / final | top-shot, perfectly overhead, brief freeze frame, all movement ceases |

---

## 5. Cuts e transições dentro de um mesmo clip

Para descrever um corte dentro do mesmo prompt (não confundir com transição entre dois vídeos — isso é `VIDEO_EXTENSION_AND_TRANSITIONS.md`):

```
[Transition Type Guide]: use a "[nome da transição]" no ponto de corte (proibir corte rígido, proibir objetos aparecendo do nada).
[Basic constraint requirement]: mantenha sensação de respiração/duração coordenada. Plano A mostra [X], então transiciona naturalmente pro Plano B, onde [Y].
[Cutting logic requirement]: reforce a troca natural de cena; opcionalmente descreva a mudança de composição (ex.: close muda pra medium shot).
```

Você também pode listar opções e deixar o modelo escolher: *"Please choose the most suitable one according to the style of this film from the transition methods such as [natural shot switching/mask transition/ink transition/similar object transition]."*

Ver `VIDEO_EXTENSION_AND_TRANSITIONS.md` §Cuts para a tabela completa de tipos de transição (fade, stacking, whip pan, mask, similar object, etc.) com quando usar cada uma.

---

## 6. Regras anti-fail (herdadas do 2.0, ainda válidas)

- **Nunca use `zoom`** genérico → sempre movimento físico de câmera (`dolly`, `pull`, `push`, `track`).
- **Movimentos contraditórios** → não combine `static`/`fixed camera` com movimento de câmera no mesmo clip.
- Sempre declare a lente/distância focal se o prompt tem close emocional ou insert de detalhe — sem isso o modelo usa focal genérico.
- **Shake vs. tremor** → `handheld breathing` (suave, intencional) ≠ `shaky cam` (caótico); especifique qual você quer.
