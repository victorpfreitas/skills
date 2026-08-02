# Character and Style — Seedance 2.5

**Read this file to declare realistic characters with a stable identity, and to build the prompt's style opening.**

---

## 1. Why this matters

Recurring feedback from 2.0 users: generated characters had an "AI look" or came out looking like "twins" when there was more than one in the scene. 2.5 addresses this with a better base model, but the prompt still needs to do its part — describing a character with the formula below reduces the chance of a generic or swapped identity.

---

## 2. Realistic character formula

```
Character = [Age/Race] + [Skin Color/Texture] + [Facial Details] + [Eyes/Soul] + [Hairstyle/Hair Color] + [Clothing/Texture] + [Body Type/Emotion/Temperament] + [Other Requirements, if any]
```

This applies both to realistic humans and to animated characters — the same structure applies.

### [Age/Race]
`[Specific age] + [Specific nationality/race] + [Style adjective] + [Face shape noun]`

Examples:
```
22-year-old East Asian woman with a cold and classical bone-like face.
25-year-old United Kingdom male, with a thin and intelligent British aristocratic face.
A 26-year-old African-American woman with an extremely three-dimensional black pearl supermodel face.
```

### [Skin Color/Texture]
Avoid generic smooth/white skin — write real tone and texture.
`[cool/warm tone] + [specific skin tone noun] + [skin texture adjective] + [forced fidelity suffix: retain true micro pores and skin texture]`

Examples:
```
Cold-toned fair skin tone, exuding a delicate and moist jade texture, retaining the true micro-pores and skin texture.
Warm honey color, with a glossy feeling after being exposed to sunlight. There are faint real freckles on the bridge of the nose, preserving fine pores and skin texture.
Rough wheat-colored skin, with a sense of wind and frost and fine lines, retaining true large pores, stubble marks, and skin texture.
```

### [Facial Details]
`[Eye shape] + [Eyebrow bone feature] + [Nose bridge feature] + [Lip shape feature] + [Jawline/Bone feature]` — combine at least 3–4 points.

Examples:
```
Slender peach blossom eyes (slightly moist eye sockets), small and straight nose bridge, plump lips with a faint smile at the corners of the mouth, and a soft jawline.
Slightly upturned Danfeng eyes, highly folded three-dimensional brow bones, high and restrained nose bridge, slightly protruding cheekbones, and a clear and neat jawline like a knife.
```

### [Eyes/Soul]
`[eye adjective] + [information/metaphor conveyed by eye contact] + [underlying emotion revealed]`

Examples:
```
The eyes are extremely affectionate, as if there is a pool of spring water in the bottom of the eyes. The gaze is gentle and focused, revealing deep attachment and a hint of reluctance.
The eyes are extremely calm and empty, like a bottomless black hole. The gaze is sharp and oppressive, revealing a hint of elusive danger.
```

### [Hairstyle/Hair Color]
Reject flat monochrome black — describe condition, curl, texture, interaction with the environment.
`[Specific hair color] + [Hair condition/texture] + [Specific hairstyle noun] + [Environmental interaction]`

Examples:
```
The black hair is tied into a casual and elegant classical low bun, fixed only with a plain jade hairpin. A few strands of fine black hair hang inadvertently on the edge of the cheeks, gently swaying with the breeze.
Caramel brown slightly curly long hair presents a natural fluffy, messy feeling like just waking up.
```

### [Clothing/Texture]
`[pattern/cut] + [color] + [specific clothing noun] + [fabric material/wear state] + [wearing method/detail]`

Examples:
```
A minimalist plain white cross-necked ancient costume, made of soft and elegant silk or light gauze with a sheen. The collar is slightly scattered.
A loose, worn-out dark brown motorcycle leather jacket with real wear creases and reflective metal zippers, paired with a washed-to-white gray T-shirt.
```

### [Body/Emotion/Temperament]
`[Skeleton/Shoulder features] + [Composition/Shot requirements] + [Character action/gaze] + [Overall atmosphere words]`. If the general scene description already covers composition/shot/action, you can omit this part here.

Example:
```
Slim figure, slender shoulders. Close-up composition of the half-body above the chest, with direct gaze towards the camera. Overall, it exudes a gentle, graceful, and affectionate classical romantic temperament.
```

---

## 3. Multiple characters: avoiding twins and identity swaps

When there are 2+ characters in the same scene, 2.5 improved stability — but the prompt should still reinforce:
- Apply the full formula **separately** for each character, never a shared generic description.
- Name each one (`<Character A>`, `<Guide>`, `<Registrar>`, etc.) and link each name to a specific reference — see `MULTI_REFERENCE.md`.
- Explicitly declare: `Do not interchange the [N] characters' appearances, clothing, actions, positions, or dialogue.`

---

## 4. Global style declaration (prompt opening)

The style opening anchors the whole generation — usually it's the first sentence or a `[Global Scene Setting]` / `Base Environment & Texture` block at the start.

### Structure
```
[Visual/genre style], [technical quality], [color/lighting approach], [camera language summary].
```

### Examples by genre (adapted from official examples)
```
Realistic nature documentary style, cinematic realistic lighting.
Cinematic, shallow depth of field (simple and blurred background), soft natural light.
High Fantasy epic style. Primary color palette of emerald green and dawn gold. Uses backlighting and side-backlighting (rim lighting).
Cyberpunk-style futuristic aesthetic. High-contrast neon dark tones, high-speed shutter to clearly capture splashing raindrops and sparks.
Top-tier Chinese ancient wuxia anime (Cel-shaded realism / 2.5D rendering), with ink-wash rendered edges.
Classic BBC Period Drama style. Primary color palette of warm gold, ivory white, and deep black. High contrast candle-lit illumination, film grain texture.
```

### "Global Settings" module for long/multi-stage videos
When the video has several stages (see `LONG_VIDEO_AND_TIMESTAMPS.md`), condense the style into a single block reused throughout the video, to avoid visual drift between stages:

```
Formula: [Basic Environment and Texture] + [Visual Style] + [Shot Language] + [Character Modeling] + [Performance Core] + [Prohibited]
```

- **Basic Environment and Texture**: [time] + [place] + [atmosphere] + the desired physical texture (e.g. "emphasize the ultimate real physical texture")
- **Visual Style**: [cinematic/realistic/2D etc.] + [depth-of-field control] + [lighting method]
- **Shot Language**: [scene/perspective] + [detailed description]
- **Character Modeling**: use the formula from section 2, or an @image reference
- **Performance Core**: key points to emphasize in the final film
- **Prohibited**: list from [sound] + [subtitles] + [behavior] + [points prone to collapse] — becomes the `[Negative Prompts]` block
