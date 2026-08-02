# Video Editing — Editar um Vídeo Já Existente

**Leia este arquivo quando o usuário já tem um vídeo gerado (ou real) e quer modificar algo nele, sem regerar do zero.** Isso não existe no Seedance 2.0.

---

## 1. Regra central: defina o "sole editing master"

Antes de qualquer coisa, defina o vídeo fonte como a **única autoridade de edição** — ele é quem controla personagens, cena, ações, composição, movimento de câmera, oclusões, áudio e ordem de eventos, exceto onde o prompt explicitamente pede mudança.

O output preserva automaticamente aspect ratio e aproximadamente a duração do vídeo de entrada — **nenhum dos dois é configurável separadamente** nesse workflow (ver `PARAMETERS_AND_LIMITS.md` §4). O processamento de frame de entrada pode gerar diferença de até ~0.3s, geralmente por causa do tratamento de frames de transição — o conteúdo geral e a ordem dos eventos permanecem substancialmente inalterados.

---

## 2. Padrão geral de edição

```
[Edit Goal]
Edit @Video 1. Within <the entire video or a specific time range>, <add, remove, replace, or adjust> <visual object, region, or audio category>.

[Source Video Role]
@Video 1 is the sole editing master. It defines <characters, scene, actions, composition, camera movement, occlusion relationships, audio, and event order>.

[Target Material Role]
@Image 1 or @Audio 1 defines <specified attributes of the target object or sound>.

[Edit Scope]
Modify only <object, region, time range, or audio category>.

[Content to Preserve]
Keep <visual content, motion, audio, and timing relationships that must not change> from @Video 1.
```

### Exemplo (mudança de luz numa região/tempo específico)
```
[Edit Goal]
Edit @Video 1. Only from 4-7 seconds, change the cool blue light on the right wall to warm orange light.

[Source Video Role]
@Video 1 is the sole editing master. It defines the character, room layout, actions, composition, camera movement, audio, and event order.

[Edit Scope]
Change only the light color on the right wall and the area it illuminates. Allow the character's skin tone to respond naturally to the environmental light.

[Content to Preserve]
Keep the character's identity, clothing, expression, position, motion, room structure, camera movement, dialogue, and ambience from @Video 1.
```

---

## 3. Substituição de sujeito (subject replacement)

```
[Edit Goal]
Edit @Video 1. Change only <original object> to <target object>.

[Source Video Role]
@Video 1 is the sole editing master. It defines the original scene, camera position, camera movement, motion path, occlusion relationships, and event order.

[Target Reference Role]
@Image 1 defines <target object>'s <appearance, structure, or material>. Do not use <irrelevant background, people, or composition>.

[Edit Scope]
Modify only <specific object and area>. The entire video contains <number> target object(s). Do not modify <content to preserve>.

[Timeline Inheritance]
<Target object> inherits every appearance, motion, occlusion, and exit of <original object>, including timing, duration, path, and speed changes.

Except for the object or area explicitly modified above, keep all other people, props, scene content, camera movements, cuts, and event order from @Video 1 unchanged.
```

### Exemplo
```
[Edit Goal]
Edit @Video 1. Replace only the yellow folding desk lamp with the white folding desk lamp in @Image 1.

[Source Video Role]
@Video 1 is the sole editing master. It defines the desk, books, hand movements, camera position, camera movement, occlusion relationships, and event order.

[Target Reference Role]
@Image 1 defines only the white folding desk lamp's appearance, structure, and material. Do not use the image's background, composition, or other objects.

[Edit Scope]
Keep exactly one white folding desk lamp throughout the video. Replace only the original yellow folding desk lamp. Do not modify the books, desk, hands, or background.

[Timeline Inheritance]
The white folding desk lamp inherits every appearance, lamp-arm rotation, hand occlusion, and exit of the original yellow folding desk lamp, including timing, path, and speed changes.
```

---

## 4. Substituição de fundo (background replacement — inclui green screen)

```
[Edit Goal]
Edit @Video 1. Replace only <original background area> with <target environment> from @Image 1.

[Source Video Role]
@Video 1 is the sole editing master. It defines the people, foreground objects, actions, composition, camera movement, and event order.

[Target Reference Role]
@Image 1 defines only <target environment>'s spatial layout, materials, depth of field, ambient color, and lighting direction. Do not use the people or foreground objects in the image.

[Edit Scope]
Modify only <background outside the subject's silhouette>. Do not modify <subject identity, facial features, hairstyle, clothing, expression, position, size, or motion>.

[Timeline Inheritance]
Keep the character actions and occlusion relationships from @Video 1. Except for the object or area explicitly modified above, keep all other people, props, scene content, camera movements, cuts, and event order from @Video 1 unchanged.
```

### Exemplo
```
@Video 1 is the sole editing master. It defines the people, actions, composition, camera treatment, and event order.
@Image 1 provides only the spatial layout, depth of field, ambient color, and lighting direction of a daylit glass greenhouse. Do not use the people in the image.
Replace only the light gray background outside the person's silhouette in @Video 1 with the daylit glass greenhouse from @Image 1.
Keep the person's identity, facial features, hairstyle, clothing, expression, position, size, and arm-raising motion from @Video 1.
```

Essa mesma lógica cobre **edição de green screen** (capacidade nova do 2.5): o "background outside the subject's silhouette" é exatamente o que se troca por chroma key / composição em pós.

---

## 5. Edição de áudio

Diálogo, idioma, timbre, música e SFX podem ser editados separadamente. Declare o falante/categoria de som, a mudança pretendida, e o que precisa permanecer inalterado.

```
Edit @Video 1. Remove only the original background music. Keep the character dialogue, lip sync, ambience, and action sound effects; preserve the visuals, camera treatment, and editing rhythm from @Video 1.

Edit @Video 1. Change <Presenter>'s spoken language to natural American English while preserving the dialogue content and speaking times. Keep all other character voices, background music, ambience, and visuals from @Video 1.
```

Essa é a capacidade oficial de "separação/remoção de BGM": pedir remoção de música mantendo voz e demais elementos (legenda inclusa) do vídeo original.

---

## 6. Smart Edit / Edit with Marks (interface, não prompt puro)

No app Dreamina, há dois modos de entrada pra este mesmo tipo de edição:

- **Smart Edit** — descreve a edição só em texto, sem marcação visual na tela.
- **Edit with Marks / Video Editing (pós-geração)** — o usuário desenha marcação (caixa, seta, ponto) sobre o frame indicando a área, depois escreve o prompt de edição. Isso gera automaticamente um label de timestamp (`⏱️00:00 Video Frame Labeling`) que se soma à instrução de texto.

Ambos usam os mesmos princípios de prompt acima (sole editing master, edit scope, content to preserve) — a marcação visual só substitui a necessidade de descrever a região em palavras.

---

## 7. Checklist

- [ ] `[Source Video Role]` declara @Video 1 como sole editing master
- [ ] `[Edit Scope]` restringe explicitamente o que muda — nunca deixe implícito
- [ ] `[Content to Preserve]` lista o que NÃO pode mudar
- [ ] Se há referência de imagem/áudio alvo, papel dela está isolado ("do not use background/other objects")
- [ ] Não tentei configurar aspect ratio/duração separadamente — sei que estão travados no vídeo fonte
- [ ] Para substituição de objeto: usei `[Timeline Inheritance]` pra herdar timing/path/velocidade do objeto original
