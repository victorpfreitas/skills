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

## Strength 2: grounded editing

The model understands where each element sits in the frame and what it is. This lets you lock a specific element and edit only that, without regenerating the whole scene:

```
In the reference image, keep the woman, the chair, and the window light 
exactly as they are. Change only the ceramic mug on the table to a matte 
black steel thermos, same scale and position. Do not alter anything else 
in the frame.
```

## Recommended prompt structure: SPACE

Suggested order (the model has a reasoning engine that interprets out-of-order prompts reasonably well, but all 5 elements need to be present):

1. **S**ubject: subject and action
2. **P**alette & style: color palette and visual style
3. **A**rrangement: spatial composition
4. **C**amera & light: angle, lens, direction and quality of light
5. **E**xtra detail: material, texture, exact text when there is any

**Avoid subjective adjectives** ("elegant", "beautiful"). Replace them with an observable descriptor: color temperature, material finish, shadow direction. This is the same "specific > vague" logic used in `seedance-prompter`, except Seedream punishes empty adjectives even harder.

## Text in the prompt

Quote the exact text, never imply it. State the target language, a simple font style ("bold sans-serif", "thin serif"), and the position. Generate at 2K for crisp typography.

## Strong example: surgical edit with layers

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
