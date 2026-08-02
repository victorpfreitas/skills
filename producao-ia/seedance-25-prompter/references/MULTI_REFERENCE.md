# Multi-Referência — Mapeamento e Seleção por Cena

**Leia este arquivo sempre que houver 2+ materiais de referência (imagem/vídeo/áudio), e obrigatoriamente quando houver múltiplos personagens/props/cenas.**

---

## 1. Por que isso existe

O 2.5 suporta até 50 materiais de referência (ver `PARAMETERS_AND_LIMITS.md`). Com esse volume, o objetivo **não é** colocar toda referência numa frase só — é definir a relação entre personagens, props, cenas, ações e áudio, e deixar claro quais materiais usar em cada cena.

**Regra de ouro:** mapeamentos de material precisam estar escritos no prompt. Não confie só em labels de texto dentro das imagens, e não deixe o modelo inferir qual pessoa/prop/cena cada material representa.

Ordem de trabalho: **Define Each Material's Role → Map Subjects → Group by Type → Create Subject Profiles → Select References by Scene**

---

## 2. Template de papel de referência (caso simples)

```
@Image 1 defines <subject>'s <appearance, clothing, structure, or material>.
@Video 1 defines <motion, camera movement, or pacing>.
@Audio 1 defines <character or sound type>'s <voice, dialogue, ambience, or music>.
<Subject> completes <primary action or event> in <scene>.
```

### Exemplo
```
@Image 1 defines the ceramic artist's facial features, hairstyle, and dark green apron. Do not use the image background.
@Image 2 defines the wooden workbench, window placement, and morning light of the pottery studio. Do not use the people in the image.
@Video 1 defines the pacing of throwing clay with both hands, lifting the cup, and placing it down. Do not use the person's identity, clothing, or scene from the video.
```

Sempre que uma referência puder trazer algo indesejado (fundo, composição, outras pessoas), declare explicitamente "Do not use X".

### Múltiplas vistas do mesmo sujeito
```
@Image 1 defines the front view of the same folding desk lamp.
@Image 2 defines the left-side structure of the same folding desk lamp.
@Image 3 defines the right-side structure of the same folding desk lamp.
@Image 4 defines the rear structure of the same folding desk lamp.
All four images define one folding desk lamp. The output must contain only one lamp throughout.
```

### Vídeo blockout como referência de movimento
Quando um vídeo de referência já define movimento, câmera e sequência com precisão, declare só quais atributos herdar — não repita a ação inteira em texto (repetir pode competir com a própria referência). Um blockout video fornece principalmente movimento/estrutura espacial; o prompt ainda precisa definir sujeitos, cena, ação e estilo visual pretendidos (ver `KEYFRAMES_STORYBOARD_BLOCKOUT.md` para blockout completo).

---

## 3. Passo 1 — Nomeie e mapeie cada sujeito individualmente

```
<Character A> corresponds to @Image 1. Use only the appearance, hairstyle, and clothing.
<Character B> corresponds to @Image 2. Use only the appearance, hairstyle, and clothing.
<Prop A> corresponds to @Image 3. Use only the structure, material, and color.
<Scene A> references @Image 4. Use only the spatial layout, architecture, and lighting. Do not use the people in the image.
```

**Nunca** escreva algo como "@Images 1 through 4 define four characters respectively" — isso não declara qual imagem corresponde a qual personagem.

---

## 4. Passo 2 — Agrupe materiais por tipo

```
[Characters]
<Conservator> corresponds to @Image 1. Use only the appearance, hairstyle, and clothing.
<Registrar> corresponds to @Image 2. Use only the appearance, hairstyle, and clothing.
Do not interchange the characters' appearances, clothing, actions, positions, or dialogue.

[Props]
<Sample Case> corresponds to @Image 5 and belongs only to <Conservator>.
<Record Board> corresponds to @Image 6 and belongs only to <Registrar>.

[Scenes]
<Conservation Lab> references @Image 7. Use only the space, materials, and lighting.
<Gallery> references @Image 8. Use only the space, materials, and lighting.

[Motion and Audio]
@Video 1 defines the motion of <Conservator> opening <Sample Case>. Do not use the person or scene from the video.
@Audio 1 defines <Guide>'s voice and specified dialogue.
```

---

## 5. Passo 3 — Subject Profile centralizado

Quando o mesmo personagem usa várias referências ao longo de múltiplas cenas, crie um perfil único pra ele evitar contaminação entre cenas:

```
[Subject Profile: Conservator]
Appearance and clothing: @Image 1.
Fixed prop: <Sample Case> from @Image 5.
Locations: <Conservation Lab> and <Gallery>.
Motion references: the case-opening motion from @Video 1 and the sample-placement motion from @Video 2.
Do not use: other characters' clothing. Do not give this character <Record Board> or guide equipment.
```

---

## 6. Passo 4 — Selecione referências por cena

Não é preciso (nem desejável) usar todos os materiais ao mesmo tempo. Declare por cena quais materiais estão ativos:

```
Scene 1 | Inspection in the Conservation Lab
Use: <Conservator>, <Sample Case>, <Conservation Lab>, and the case-opening motion from @Video 1.
Event: <Conservator> opens <Sample Case> at the workbench and inspects the sample inside.
End state: <Conservator> remains on the inner side of the workbench. <Sample Case> stays beside the conservator's right hand, on the left side of the frame.

Scene 2 | Registration in the Gallery
Use: <Registrar>, <Record Board>, and <Gallery>.
Event: <Registrar> checks the number on <Record Board> beside the display case.
End state: <Registrar> still holds <Record Board> with both hands. No other character enters the display-case area.
```

O objetivo de multi-referência é ajudar o modelo a **escolher** o material certo para a cena atual — não fazer todo material aparecer ao mesmo tempo.

---

## 7. Checklist rápido antes de gerar

- [ ] Cada sujeito distinto tem nome + referência mapeada individualmente (nunca "as imagens definem X personagens")
- [ ] Cada referência tem "use apenas X" e, quando relevante, "do not use Y"
- [ ] Materiais agrupados por tipo ([Characters]/[Props]/[Scenes]/[Motion and Audio]) se houver 3+ referências
- [ ] Subject Profile criado para personagens que aparecem em múltiplas cenas/estágios
- [ ] Referências selecionadas por cena/estágio, não empilhadas todas juntas
- [ ] Regra explícita de não-troca entre personagens quando há 2+ na mesma cena
