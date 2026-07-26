# Template do CHARACTER BLOCK

O CHARACTER BLOCK é o parágrafo fixo, em inglês, colado word-for-word em todo prompt que use o personagem. Nunca resumir ou parafrasear — o modelo é mais sensível a variação de texto do que parece, e cada reformulação é uma chance de desviar do visual aprovado.

---

## Estrutura do bloco

```
CHARACTER CONSTRUCTION — @TAG_DO_PERSONAGEM — CRITICAL, DO NOT REINTERPRET:

[1. FORMA GERAL] O que define a silhueta: tipo de figura, proporção, o que é humano
vs. o que é elemento não-humano (prop vestível, adereço, traço não-realista).

[2. TRAÇO INEGOCIÁVEL] O elemento que nunca muda entre gerações — declarado com
ênfase (CAPS ou "CRITICAL"), com detalhe suficiente pra não sobrar espaço de
interpretação (material, posição exata, relevo/acabamento, cor exata).

[3. VARIANTE ATUAL] O que é específico desta variante/versão (roupa, acessório,
contexto) — só entra aqui o que MUDA; o que é compartilhado com outras variantes
fica no bloco base, citado por referência ("same as @TAG_BASE").

[4. VISTA TRASEIRA, SE RELEVANTE] Se o personagem aparece de costas em alguma
cena, declarar explicitamente o que essa vista mostra — é comum o modelo assumir
uma vista traseira genérica quando isso não é especificado.

Reproduce exactly as @image reference. Do not reinterpret.
[Adendo específico do traço inegociável, se fizer sentido repetir: ex. "Do not
make [o traço] smaller/simplified/flat."]
```

---

## Exemplo 1 — mascote com prop vestível (padrão Livelo)

```
CHARACTER CONSTRUCTION — @CHAR_PONTO — CRITICAL, DO NOT REINTERPRET:
@CHAR_PONTO is a human male figure wearing a large physical wearable costume prop —
a rectangular keycap-shaped block that sits on the shoulders and extends downward
covering the ENTIRE TORSO from shoulders down to WAIST/BELLY LEVEL. It is NOT a
helmet. The block's bottom edge sits at navel/waist level. Human arms hang freely
through lateral openings. Human legs and hips are fully visible below the block.

OUTFIT: full-body all-black — fitted long-sleeve top, slim trousers, black sneakers.

KEYCAP BLOCK — FRONT FACE: matte off-white cream surface, subtle black dot symbol
(·) in shallow circular low relief at center-front. Matte, not glossy.

KEYCAP BLOCK — BACK FACE: raw internal structure of a mechanical keycap — molded
plastic frame with internal ribbing, central stem mount, industrial injection-molded
aesthetic.

Reproduce exactly as @image reference. Do not reinterpret. Do not make the block
smaller or head-sized only.
```

Note o que faz esse bloco funcionar: a forma geral é definida ANTES da roupa (senão o modelo assume proporção humana comum e trata o bloco como acessório pequeno); o traço inegociável (o símbolo em relevo) tem posição, acabamento e escala descritos, não só citado; a vista traseira é documentada porque o personagem aparece de costas em algumas cenas e a estrutura interna do bloco é parte da identidade.

---

## Exemplo 2 — personagem humano realista (protagonista de série, ex. estilo "agente")

```
CHARACTER CONSTRUCTION — @AGENTE_MIB_BR — CRITICAL, DO NOT REINTERPRET:
@AGENTE_MIB_BR is a Black Brazilian man, early 30s, athletic-lean build, approx.
1.85m. Short fade haircut, well-groomed thin beard. Calm, alert expression —
default resting face shows quiet confidence, never a wide smile.

OUTFIT (default/field): matte black tailored suit, no tie, top button undone,
white dress shirt. Black leather shoes. EXCLUSIVE ACCESSORY: silver aviator
sunglasses — worn in ~80% of appearances, described explicitly whenever present
or absent in a given shot.

DISTINGUISHING MARK — CRITICAL: a thin vertical scar above the left eyebrow,
approximately 2cm, visible in close-up and medium shots. Never omit in any shot
where the face is visible at medium distance or closer.

VOICE/POSTURE CUE (for video, not stills): moves deliberately, minimal wasted
gesture, hands typically at rest or in pockets unless actively gesturing.

Reproduce exactly as @image reference. Do not reinterpret facial structure, skin
tone, or the eyebrow scar.
```

Esse exemplo mostra que o padrão do CHARACTER BLOCK generaliza pra personagem humano realista, sem prop vestível — o traço inegociável aqui é a cicatriz (um detalhe pequeno mas específico o bastante pra não ser "esquecido" pelo modelo entre gerações), e a variante (óculos presente/ausente) é tratada como estado a declarar por cena, não característica fixa.

---

## Variantes — herdar o bloco base

Quando existem múltiplas variantes do mesmo personagem, não reescreva o bloco inteiro pra cada uma — declare o que é compartilhado uma vez, e cada variante só acrescenta a diferença:

```
CHARACTER CONSTRUCTION — @SRA_PONTO_RESORT — CRITICAL, DO NOT REINTERPRET:
Same base construction as @CHAR_PONTO_LIVELO (keycap block, shoulders to waist,
glossy white front with magenta 4-petal symbol in high 3D relief, smooth glossy
back with no internal structure).

VARIANT-SPECIFIC: female figure. OUTFIT: magenta swimsuit, barefoot. EXCLUSIVE
ACCESSORY: wide-brim straw hat resting on top of the block.

Reproduce exactly as @image reference. Do not make the block head-sized only.
```

Isso mantém a família de personagens consistente entre si e reduz o tamanho de cada bloco individual.
