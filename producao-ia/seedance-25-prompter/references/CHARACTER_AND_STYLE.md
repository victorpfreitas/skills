# Personagem e Estilo — Seedance 2.5

**Leia este arquivo para declarar personagens realistas com identidade estável e para construir a abertura de estilo do prompt.**

---

## 1. Por que isso importa

Feedback recorrente de usuários do 2.0: personagens gerados tinham "cara de IA" ou saíam parecidos como "gêmeos" quando havia mais de um na cena. O 2.5 endereça isso com um modelo base melhor, mas o prompt ainda precisa fazer a parte dele — descrever personagem com a fórmula abaixo reduz a chance de identidade genérica ou trocada.

---

## 2. Fórmula de personagem realista

```
Character = [Age/Race] + [Skin Color/Texture] + [Facial Details] + [Eyes/Soul] + [Hairstyle/Hair Color] + [Clothing/Texture] + [Body Type/Emotion/Temperament] + [Other Requirements, se houver]
```

Vale tanto para humanos realistas quanto para personagens animados — a mesma estrutura se aplica.

### [Age/Race]
`[Specific age] + [Specific nationality/race] + [Style adjective] + [Face shape noun]`

Exemplos:
```
22-year-old East Asian woman with a cold and classical bone-like face.
25-year-old United Kingdom male, with a thin and intelligent British aristocratic face.
A 26-year-old African-American woman with an extremely three-dimensional black pearl supermodel face.
```

### [Skin Color/Texture]
Evite pele lisa/branca genérica — escreva tom e textura real.
`[cool/warm tone] + [specific skin tone noun] + [skin texture adjective] + [forced fidelity suffix: retain true micro pores and skin texture]`

Exemplos:
```
Cold-toned fair skin tone, exuding a delicate and moist jade texture, retaining the true micro-pores and skin texture.
Warm honey color, with a glossy feeling after being exposed to sunlight. There are faint real freckles on the bridge of the nose, preserving fine pores and skin texture.
Rough wheat-colored skin, with a sense of wind and frost and fine lines, retaining true large pores, stubble marks, and skin texture.
```

### [Facial Details]
`[Eye shape] + [Eyebrow bone feature] + [Nose bridge feature] + [Lip shape feature] + [Jawline/Bone feature]` — combine pelo menos 3–4 pontos.

Exemplos:
```
Slender peach blossom eyes (slightly moist eye sockets), small and straight nose bridge, plump lips with a faint smile at the corners of the mouth, and a soft jawline.
Slightly upturned Danfeng eyes, highly folded three-dimensional brow bones, high and restrained nose bridge, slightly protruding cheekbones, and a clear and neat jawline like a knife.
```

### [Eyes/Soul]
`[eye adjective] + [information/metaphor conveyed by eye contact] + [underlying emotion revealed]`

Exemplos:
```
The eyes are extremely affectionate, as if there is a pool of spring water in the bottom of the eyes. The gaze is gentle and focused, revealing deep attachment and a hint of reluctance.
The eyes are extremely calm and empty, like a bottomless black hole. The gaze is sharp and oppressive, revealing a hint of elusive danger.
```

### [Hairstyle/Hair Color]
Recuse preto monótono — descreva estado, cacheado, textura, interação com o ambiente.
`[Specific hair color] + [Hair condition/texture] + [Specific hairstyle noun] + [Environmental interaction]`

Exemplos:
```
The black hair is tied into a casual and elegant classical low bun, fixed only with a plain jade hairpin. A few strands of fine black hair hang inadvertently on the edge of the cheeks, gently swaying with the breeze.
Caramel brown slightly curly long hair presents a natural fluffy, messy feeling like just waking up.
```

### [Clothing/Texture]
`[pattern/cut] + [color] + [specific clothing noun] + [fabric material/wear state] + [wearing method/detail]`

Exemplos:
```
A minimalist plain white cross-necked ancient costume, made of soft and elegant silk or light gauze with a sheen. The collar is slightly scattered.
A loose, worn-out dark brown motorcycle leather jacket with real wear creases and reflective metal zippers, paired with a washed-to-white gray T-shirt.
```

### [Body/Emotion/Temperament]
`[Skeleton/Shoulder features] + [Composition/Shot requirements] + [Character action/gaze] + [Overall atmosphere words]`. Se a descrição geral da cena já cobrir composição/plano/ação, pode omitir essa parte aqui.

Exemplo:
```
Slim figure, slender shoulders. Close-up composition of the half-body above the chest, with direct gaze towards the camera. Overall, it exudes a gentle, graceful, and affectionate classical romantic temperament.
```

---

## 3. Multi-personagem: como evitar gêmeos e troca de identidade

Quando há 2+ personagens na mesma cena, o 2.5 melhorou a estabilidade — mas o prompt ainda deve reforçar:
- Aplique a fórmula completa **separadamente** para cada personagem, nunca uma descrição genérica compartilhada.
- Nomeie cada um (`<Character A>`, `<Guide>`, `<Registrar>` etc.) e vincule cada nome a uma referência específica — ver `MULTI_REFERENCE.md`.
- Declare explicitamente: `Do not interchange the [N] characters' appearances, clothing, actions, positions, or dialogue.`

---

## 4. Declaração de estilo global (abertura do prompt)

A abertura de estilo ancora toda a geração — normalmente é a primeira frase ou um bloco `[Global Scene Setting]` / `Base Environment & Texture` no início.

### Estrutura
```
[Visual/genre style], [technical quality], [color/lighting approach], [camera language summary].
```

### Exemplos por gênero (adaptados dos exemplos oficiais)
```
Realistic nature documentary style, cinematic realistic lighting.
Cinematic, shallow depth of field (simple and blurred background), soft natural light.
High Fantasy epic style. Primary color palette of emerald green and dawn gold. Uses backlighting and side-backlighting (rim lighting).
Cyberpunk-style futuristic aesthetic. High-contrast neon dark tones, high-speed shutter to clearly capture splashing raindrops and sparks.
Top-tier Chinese ancient wuxia anime (Cel-shaded realism / 2.5D rendering), with ink-wash rendered edges.
Classic BBC Period Drama style. Primary color palette of warm gold, ivory white, and deep black. High contrast candle-lit illumination, film grain texture.
```

### Módulo de "Global Settings" para vídeos longos/multi-stage
Quando o vídeo tem vários stages (ver `LONG_VIDEO_AND_TIMESTAMPS.md`), condense o estilo num único bloco reutilizado em todo o vídeo, para evitar deriva visual entre estágios:

```
Formula: [Basic Environment and Texture] + [Visual Style] + [Shot Language] + [Character Modeling] + [Performance Core] + [Prohibited]
```

- **Basic Environment and Texture**: [time] + [place] + [atmosphere] + textura física desejada (ex.: "emphasize the ultimate real physical texture")
- **Visual Style**: [cinematic/realistic/2D etc.] + [controle de profundidade] + [método de iluminação]
- **Shot Language**: [cena/perspectiva] + [descrição detalhada]
- **Character Modeling**: use a fórmula da seção 2, ou @referência de imagem
- **Performance Core**: pontos-chave a enfatizar no filme final
- **Prohibited**: liste a partir de [som] + [legenda] + [comportamento] + [pontos fáceis de colapsar] — vira o bloco `[Negative Prompts]`
