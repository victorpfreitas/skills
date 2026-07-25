# Nano Banana 2 (Gemini 3.1 Flash Image)

## Specs

- **Modelo:** Gemini 3.1 Flash Image
- **Velocidade:** ~3-5 segundos por imagem, o mais rápido dos três
- **Resolução:** 512px · 1K · 2K · 4K
- **Aspect ratios:** 1:1, 3:2, 2:3, 3:4, 4:3, 4:5, 5:4, 9:16, 16:9, 21:9 + ultra-wide 1:4, 4:1, 1:8, 8:1
- **Referências:** até 14 referências de objeto + 5 personagens por workflow
- **Forças:** velocidade, edição conversacional, fotorealismo, still de produto, storyboard/grid

## Convenção de referência

Referências são endereçadas por descrição natural, não por tag explícita (`Reference 1: identidade do personagem`, não `@Image1`). Atribua um papel primário a cada referência antes de escrever o prompt (identidade, ambiente, objeto), a mesma disciplina do `seedance-prompter` e do `SEEDREAM.md`, só que sem sintaxe de tag.

## Onde usar

- Iteração rápida em conversa, quando o resultado não precisa ser cirúrgico (ver "Decidindo a próxima tentativa" no `SKILL.md`)
- Grid/storyboard num único prompt (seção 3 do `SKILL.md`)
- Still de produto e fotorealismo geral, quando velocidade importa mais que edição em camadas

## Exemplo forte: storyboard rápido em grid

```
Create a 1x3 image grid with 3 panels, each in 16:9 format, read left to right. 
Muted documentary color grade, natural window light throughout. Subject: a woman 
in her 40s wearing a charcoal wool coat, consistent across all panels.

Panel 1 (left): Wide shot, 35mm lens, she enters a quiet kitchen at dawn, 
backlit by cold blue window light, breath faintly visible.

Panel 2 (center): Medium shot, 50mm lens, she pauses at the counter, hand 
resting on a ceramic mug, gaze fixed on the window, first warm light crossing 
her face.

Panel 3 (right): Close-up, 85mm lens, her expression softens into a small 
exhale, full golden morning light now on her face, steam rising from the mug.

Avoid: oversaturation, inconsistent coat color across panels, motion blur.
```
