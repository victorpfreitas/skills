# Seedream 5.0 Pro (ByteDance)

## Specs

- **Aspect ratio:** faixa extremamente flexível, 1:16 a 16:1. Presets comuns: 1:1, 4:3, 3:4, 4:5, 16:9, 9:16, 2:3, 3:2, 21:9
- **Resolução:** nativa 2K, upscale até 4K pra impressão ou trabalho digital de alto padrão
- **Referências:** até 10 imagens
- **Texto:** renderiza em 14 idiomas (incluindo árabe e outros com suporte RTL), com letterform nativo correto
- **Forças:** edição cirúrgica sem regenerar o resto do frame, camadas editáveis, infográfico denso, fotorealismo de pele e luz

## Convenção de referência (diferente do Nano Banana e do Seedance)

Referências são endereçadas **por descrição de conteúdo**, nunca por índice. Escreva "o caderno de couro marrom", não "a primeira referência" ou "Reference 1", principalmente quando o conjunto de referências muda de uma tentativa pra outra e o índice deixaria de bater com o conteúdo certo.

## Diferencial 1: layer separation

Seedream consegue decompor uma imagem gerada em 10+ camadas PNG transparentes editáveis, prontas pra abrir em Figma ou Photoshop. Peça isso explicitamente no prompt quando o objetivo final é um arquivo de design, não só uma imagem:

```
Generate a product hero shot of a matte ceramic teapot on a linen tablecloth, 
soft window light from the left, editorial food photography style. 
Deliver as separated layers: background, tablecloth, teapot body, teapot 
highlights/reflections, steam, foreground shadow, each as an independent 
transparent PNG layer ready for compositing.
```

## Diferencial 2: edição fundamentada (grounded editing)

O modelo entende onde cada elemento está no frame e o que ele é. Isso permite travar um elemento específico e editar só ele, sem regenerar a cena inteira:

```
In the reference image, keep the woman, the chair, and the window light 
exactly as they are. Change only the ceramic mug on the table to a matte 
black steel thermos, same scale and position. Do not alter anything else 
in the frame.
```

## Estrutura de prompt recomendada: SPACE

Ordem sugerida (o modelo tem um reasoning engine que interpreta razoavelmente bem fora de ordem, mas os 5 elementos precisam estar presentes):

1. **S**ubject: sujeito e ação
2. **P**alette & style: paleta e estilo visual
3. **A**rrangement: composição espacial
4. **C**amera & light: ângulo, lente, direção e qualidade de luz
5. **E**xtra detail: material, textura, texto exato quando houver

**Evite adjetivo subjetivo** ("elegante", "bonito"). Substitua por descritor observável: temperatura de cor, acabamento de material, direção de sombra. É a mesma lógica de "específico > vago" que já usamos no `seedance-prompter`, só que o Seedream pune ainda mais o adjetivo vazio.

## Texto no prompt

Cite o texto exato entre aspas, nunca implique. Declare o idioma-alvo, um estilo de fonte simples ("bold sans-serif", "thin serif") e a posição. Gere a 2K pra tipografia nítida.

## Exemplo forte: edição cirúrgica com camadas

```
Subject: a minimalist skincare bottle on a marble surface, morning light 
from a window at 45 degrees left. Palette: warm ivory and soft grey, muted 
saturation. Arrangement: bottle centered, one dry eucalyptus sprig to the 
right, negative space above for text placement. Camera: eye-level, 85mm 
equivalent, shallow depth of field. Extra detail: label text reads 
"NUMBER FIVE" in a thin serif font, engraved-style, placed on the bottle's 
front face.

Deliver as separated layers: background, marble surface, bottle body, 
label, eucalyptus sprig, cast shadow.
```
