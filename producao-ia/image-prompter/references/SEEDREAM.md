# Seedream 5.0 Pro (ByteDance)

## Specs

- **Aspect ratio:** extremely flexible range, 1:16 to 16:1. Common presets: 1:1, 4:3, 3:4, 4:5, 16:9, 9:16, 2:3, 3:2, 21:9
- **Resolution:** native 2K, upscale up to 4K for print or high-end digital work
- **References:** up to 10 images
- **Text:** renders in 14 languages (including Arabic and other RTL-supported scripts), with correct native letterforms
- **Strengths:** surgical editing without regenerating the rest of the frame, editable layers, dense infographics, photorealistic skin and light

## Reference convention (different from Nano Banana and Seedance)

References are addressed **by content description**, never by index. Write "the brown leather notebook", not "the first reference" or "Reference 1" — especially when the reference set changes from one attempt to another and the index would no longer match the right content.

## Strength 1: layer separation

Seedream can decompose a generated image into 10+ editable transparent PNG layers, ready to open in Figma or Photoshop. Ask for this explicitly in the prompt when the final goal is a design file, not just an image:

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
