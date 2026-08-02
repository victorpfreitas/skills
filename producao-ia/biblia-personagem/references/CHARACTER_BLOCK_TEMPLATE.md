# CHARACTER BLOCK Template

The CHARACTER BLOCK is the fixed paragraph, in English, pasted word-for-word into every prompt that uses the character. Never summarize or paraphrase — the model is more sensitive to text variation than it seems, and every rewording is a chance to drift away from the approved look.

---

## Block structure

```
CHARACTER CONSTRUCTION — @CHARACTER_TAG — CRITICAL, DO NOT REINTERPRET:

[1. OVERALL FORM] What defines the silhouette: type of figure, proportion,
what is human vs. what is a non-human element (wearable prop, accessory,
non-realistic trait).

[2. NON-NEGOTIABLE TRAIT] The element that never changes across generations —
declared with emphasis (CAPS or "CRITICAL"), with enough detail to leave no
room for interpretation (material, exact position, relief/finish, exact
color).

[3. CURRENT VARIANT] What is specific to this variant/version (outfit,
accessory, context) — only what CHANGES goes here; whatever is shared with
other variants stays in the base block, cited by reference ("same as
@BASE_TAG").

[4. BACK VIEW, IF RELEVANT] If the character appears from behind in any
scene, explicitly declare what that view shows — the model commonly defaults
to a generic back view when this isn't specified.

Reproduce exactly as @image reference. Do not reinterpret.
[Trait-specific addendum, if worth repeating: e.g. "Do not
make [the trait] smaller/simplified/flat."]
```

---

## Example 1 — mascot with a wearable prop (pattern generalized from the Livelo campaign)

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

Note what makes this block work: the overall form is defined BEFORE the outfit (otherwise the model assumes a common human proportion and treats the block as a small accessory); the non-negotiable trait (the raised symbol) has its position, finish, and scale described, not just named; the back view is documented because the character appears from behind in some scenes and the block's internal structure is part of the identity.

---

## Example 2 — realistic human character (series protagonist, e.g. "agent" style)

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

This example shows the CHARACTER BLOCK pattern generalizes to a realistic human character with no wearable prop — here the non-negotiable trait is the scar (a small but specific enough detail that the model won't "forget" it across generations), and the variant (glasses present/absent) is treated as a per-shot state to declare, not a fixed characteristic.

---

## Variants — inherit the base block

When multiple variants of the same character exist, don't rewrite the whole block for each one — declare what's shared once, and each variant only adds the difference:

```
CHARACTER CONSTRUCTION — @SRA_PONTO_RESORT — CRITICAL, DO NOT REINTERPRET:
Same base construction as @CHAR_PONTO_LIVELO (keycap block, shoulders to waist,
glossy white front with magenta 4-petal symbol in high 3D relief, smooth glossy
back with no internal structure).

VARIANT-SPECIFIC: female figure. OUTFIT: magenta swimsuit, barefoot. EXCLUSIVE
ACCESSORY: wide-brim straw hat resting on top of the block.

Reproduce exactly as @image reference. Do not make the block head-sized only.
```

This keeps the character family consistent with itself and reduces the size of each individual block.
