# Keyframes, Storyboard e Blockout — Seedance 2.5

**Leia este arquivo para first/last frame com referências extras, sequência de múltiplos keyframes, grids de storyboard, referências de blockout (white model), e One-Click Video.**

---

## 1. First e Last Frame com referências adicionais

Em modo multimodal, não é preciso trocar pra um modo separado de "first/last frame" — basta declarar na primeira linha que `@Image 1` é o first frame e `@Image 2` é o last frame. O sistema trava o aspect ratio de saída na primeira imagem (duração é configurada na plataforma/API). **First e last image devem usar o mesmo aspect ratio** — descompasso pode esticar o último frame. Imagens adicionais ainda podem definir personagens, props, cenas e materiais.

### Template
```
@Image 1 is the first frame. It defines the opening composition, subject position, pose, prop state, scene, and camera direction.
@Image 2 is the last frame. It defines the ending composition, subject position, pose, prop state, scene, and camera direction.
@Image 3 defines <Subject A>'s <appearance, clothing, structure, or material>. Do not change the first-frame composition defined by @Image 1 or the last-frame composition defined by @Image 2.

<Describe one continuous action or event>.

The video begins naturally from the first frame defined by @Image 1 and reaches the last frame defined by @Image 2 after the continuous action.
Between the first and last frames, maintain continuity in <character identity, prop structure and ownership, scene layout, and camera direction>.
```

### Exemplo
```
@Image 1 is the first frame. It defines the opening composition, character positions, poses, tabletop prop states, perfume-workshop scene, and camera direction.
@Image 2 is the last frame. It defines the ending composition, character positions, poses, tabletop prop states, perfume-workshop scene, and camera direction.
@Image 3 defines <Perfumer>'s face, hairstyle, and dark green apron. Do not change the first-frame composition defined by @Image 1 or the last-frame composition defined by @Image 2.

Starting from the first-frame pose, <Perfumer> picks up a dropper and <Glass Perfume Bottle>, drips amber fragrance oil into the bottle, swirls it gently, closes the stopper, places the finished bottle in the center of the table, and naturally reaches the last frame defined by @Image 2.
```

Descreva cada imagem-âncora separadamente. Nunca combine numa frase tipo "@Images 1 and 2 are the first and last frames". Outras referências devem suplementar só os atributos que especificam — nunca substituir a composição first/last.

---

## 2. Sequência de múltiplos keyframes

Quando imagens separadas definem diferentes estágios de um processo, comece com "Use @Image 1 through @Image N as keyframes in this order", depois descreva o estado-chave que cada imagem representa. Imagens independentes de keyframe costumam ser mais fáceis de alinhar do que vários frames combinados numa grade só. Elas controlam ordem de estágio e estados-chave — não reproduzem cada frame exatamente.

### Template
```
Use @Image 1 through @Image N as keyframes in this order.
@Image 1 is the first frame. It defines <opening composition, subject position, pose, prop state, and camera direction>.
@Image 2 defines the second keyframe: <visible end state of Stage 1>.
@Image 3 defines the third keyframe: <visible end state of Stage 2>.
@Image N is the last frame. It defines <ending composition, subject position, pose, prop state, and camera direction>.

The video passes through the states defined by @Image 1, @Image 2, @Image 3, and @Image N in order, using continuous action to transition naturally between stages.
Maintain continuity in <subject identity, prop structure and ownership, scene layout, lighting, and axis of action> throughout.
```

---

## 3. Storyboard Grids

Uma grade de storyboard comunica a história geral, ordem de planos e composições aproximadas. **Não é** feita pra reprodução estrita de cada detalhe em cada painel.

- Prefira **no máximo 15 painéis**.
- Use line art limpo ou diagramas simples, minimize labels de texto.
- Declare ordem de leitura, depois descreva pra cada painel: ação do sujeito, tamanho de plano/movimento de câmera, estilo visual final, áudio.

### Template
```
@Image 1 provides an <N-panel storyboard grid> for shot order and approximate composition. Read it <left to right, top to bottom>. Do not use the grid's <line-art style, text labels, or placeholder characters>.
@Image 2 defines <Subject A>'s <appearance and clothing>.
@Image 3 defines <key prop or scene>'s <structure, material, or lighting>.

Shot 1: <shot size, subject action, and scene state>.
Shot 2: <shot size, subject action, camera movement, or transition>.
...
Shot N: <closing action and final visible state>.

The final video uses <visual style>. Audio includes <dialogue, ambience, action sound effects, or music>.
```

### Exemplo
```
@Image 1 provides a four-panel pottery-making storyboard for shot order and approximate composition. Read it left to right, top to bottom. Do not use the storyboard's line-art style or text labels.
@Image 2 defines <Ceramic Artist>'s face, short hair, and dark gray apron.

Shot 1: a wide shot establishes a quiet pottery studio with <Ceramic Artist> seated at the wheel.
Shot 2: a side medium shot shows both hands shaping the rotating clay as the cup body takes form.
Shot 3: a close-up shows fingers refining the rim and handle joint while slip moves slowly over the fingertips.
Shot 4: a medium close-up shows the fired <Blue-Glazed Cup> placed on a wooden shelf as <Ceramic Artist> withdraws both hands.
```

---

## 4. Referências de Blockout (white model / green screen source)

Blockout se divide em duas categorias — sempre identifique qual antes de escrever o prompt:

| Tipo | Melhor para | Requisito de material | Foco do prompt |
|---|---|---|---|
| **Coarse blockout** | Geometria simples que faz preview de ação, trajeto, blocking, câmera, cortes | Relações claras entre formas + sequência de ação completa; imagens de personagem/prop/cena podem ser adicionadas | Mapear cada sujeito do blockout e declarar qual informação temporal/espacial herdar |
| **Fine blockout** | Modelagem completa que precisa de novos personagens, materiais, cores, cenas, estilo | Modelo completo e limpo — evite linhas de trajeto, eixos de coordenada, frustums de câmera | Preservar estrutura/ação/tratamento de câmera enquanto define os atributos a re-renderizar |

### 4.1 Coarse Blockout

Mapeia trajetos, direção de movimento, blocking, entradas/saídas, caminho de câmera, pontos de corte, mudanças de luz e ritmo de som. Mapeie cada objeto geométrico separadamente pro sujeito/prop final. Imagens adicionais podem definir a aparência.

| Informação do blockout | O que declarar no prompt |
|---|---|
| Trajeto | Trajetória da ação, direção de movimento, blocking do sujeito, ordem de entrada/saída |
| Movimento de câmera | Posição, caminho, direção e mudanças de velocidade da câmera |
| Luz | Direção da luz, mudanças de brilho, e quando ocorrem |
| Cortes | Posições de corte e sujeito/composição antes/depois de cada corte |
| Áudio | Se herda diálogo, música, ambiente ou SFX de ação |

Prefira geometria simples com relações claras. Braços, asas e outros apêndices só quando a sequência de ação está completa — caso contrário podem causar movimento rígido ou interpretação estrutural equivocada.

#### Template
```
@Video 1 is a coarse blockout reference. It provides only <motion paths, subject blocking, camera position, camera movement, cuts, lighting changes, sound rhythm, or spatial relationships>. Do not use its blockout appearance, materials, or scene.

<Blockout Subject A> in @Video 1 corresponds to <Subject A>.
<Blockout Subject B or geometric prop> in @Video 1 corresponds to <Subject B or key prop>.
@Image 1 defines <Subject A>'s <appearance, clothing, or structure>.

<Subject> completes <primary action or event> in <scene>.
Keep <motion path, blocking, camera movement, cuts, lighting, or sound rhythm> from @Video 1.
The final video uses <characters, scene, materials, and visual style>.
```

#### Exemplo
```
@Video 1 is a coarse blockout reference. It provides only the character's walking path, cart direction, locked-off camera, one push-in, and two cuts. Do not use its gray geometry or empty scene.

The tall cylinder in @Video 1 corresponds to <Guide>.
The rectangular block in @Video 1 corresponds to <Mobile Display Cart>.
@Image 1 defines <Guide>'s face, blue uniform, and name badge.
@Image 2 defines <Mobile Display Cart>'s white metal frame and clear cover.

<Guide> pushes <Mobile Display Cart> along the curved wall, stops in front of the central display, and opens the clear cover.
Keep the walking path, subject blocking, push-in direction, and cut points from @Video 1.
```

### 4.2 Fine Blockout

Já contém estruturas completas de personagem/prop/cena. Use pra trocar materiais, cores, aparência de personagem, cena ou estilo visual geral, mantendo estrutura/ação/câmera. Mantenha o blockout limpo — remova linhas de trajeto, eixos, controllers, frustums de câmera e outros marcadores de produção.

#### Template
```
@Video 1 is a fine blockout reference. Preserve <subject structure, action, spatial layout, camera position, camera movement, and cuts>. Do not use its original gray materials or empty background.
@Image 1 defines <subject>'s <character appearance, material, color, or surface details>.
@Image 2 defines <scene>'s <space, materials, lighting, or visual style>.

Re-render <subject> from @Video 1 as <final subject>, and re-render the scene as <final scene>.
Keep <structure, action, camera treatment, and spatial relationships> from @Video 1. Use <materials, colors, and style>.
```

#### Exemplo
```
@Video 1 is a fine blockout reference. Preserve the kinetic sculpture's complete structure, three-ring rotation relationship, pedestal position, orbiting camera movement, and cuts. Do not use the gray materials or empty background.
@Image 1 defines the outer ring's brushed-brass material.
@Image 2 defines the inner blades' translucent blue-glass material.

Re-render the ring structure from @Video 1 as a kinetic sculpture made of brass and blue glass, and re-render the scene as a contemporary art gallery.
Keep the structure, rotation rhythm, orbiting camera movement, and cuts from @Video 1.
```

Isso também cobre a capacidade nova de **controle profissional de white model**: mesmo lógica, aplicada a lens scheduling complexo, storyboard design ou trajetória de blocking/movimento.

---

## 5. One-Click Video (organizar imagens soltas num vídeo coeso)

Pra transformar múltiplas imagens (ou imagens + um vídeo de estilo-referência) num vídeo completo com ritmo e empacotamento visual consistente. Declare o papel de cada material, ordem das imagens, quantidade de movimento, ritmo de edição, tratamento visual e áudio. **Nunca** escreva só "transforme esses materiais em vídeo".

```
Material Roles → Image Order → Motion Amount → Editing Style → Visual Treatment → Audio
```

### Template
```
[Material Roles]
@Image 1 is used for <character, product, scene, or opening image>.
@Image 2 is used for <character, product, scene, or process image>.
@Video 1 is used only for <editing rhythm, transitions, subtitle treatment, or music style>. Do not use its character identities or scene (optional).

[Arrangement]
Show the images in <upload order, a specified order, or a model-selected thematic order>.
<State the character, product, location, and event relationships that must remain consistent>.

[Image Motion]
Apply <subtle live motion, parallax, push-in/pull-out, lateral movement, or local action> to each image.
Keep <subject appearance, product structure, text, or background relationships> stable.

[Final Style]
Use <editing rhythm, transition style, subtitle or graphic treatment, and color style>.

[Audio]
Include <dialogue, ambience, sound effects, or music>.
```

### Exemplo (resumido)
```
[Material Roles]
@Image 1 is used for the night-market entrance and opening environment.
@Image 2 is used for <Traveler> walking along the street.
@Video 1 is used only for light editing rhythm, hand-drawn stickers, and transition style. Do not use its character identities or locations.

[Arrangement]
Show @Image 1 through @Image 6 in order to form a complete sequence: arrival, street exploration, dinner, riverside walk, and group photo.
Keep the three friends' appearances and clothing consistent. Do not mix their identities.

[Image Motion]
Use slow push-ins and subtle parallax for environment images. Add only natural blinking, head turns, glass-raising, and slight clothing movement to character images.

[Final Style]
Use an upbeat travel-video rhythm. Connect scenes with natural occlusion and similar colors.

[Audio]
Retain night-market chatter, light dish sounds, and riverside wind, with upbeat but unobtrusive instrumental music.
```

Se a ordem das imagens importa, declare a sequência exata. Se o modelo pode organizar livremente, diga que pode agrupar por tema. Com múltiplos personagens/produtos, continue nomeando e vinculando cada um separadamente (ver `MULTI_REFERENCE.md`).

---

## Checklist

- [ ] First/last frame: cada imagem-âncora descrita separadamente, nunca combinada numa frase
- [ ] First/last frame: mesmo aspect ratio nas duas imagens
- [ ] Multi-keyframe: ordem declarada explicitamente ("Use @Image 1 through @Image N as keyframes in this order")
- [ ] Storyboard: ≤15 painéis, ordem de leitura declarada, estilo do grid explicitamente descartado do output final
- [ ] Blockout: identifiquei coarse vs fine antes de escrever
- [ ] Blockout coarse: cada objeto geométrico mapeado individualmente pro sujeito real
- [ ] Blockout fine: material limpo, sem marcadores de produção residuais no prompt
- [ ] One-click video: papéis de material, ordem, movimento, estilo e áudio todos declarados — não pedi "transforme em vídeo" genérico
