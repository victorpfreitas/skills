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

Reproduce exactly as @image reference. Do not reinterpret facial structure, skin
tone, or the eyebrow scar.
```

This example shows the CHARACTER BLOCK pattern generalizes to a realistic human character with no wearable prop — here the non-negotiable trait is the scar (a small but specific enough detail that the model won't "forget" it across generations), and the variant (glasses present/absent) is treated as a per-shot state to declare, not a fixed characteristic. Since this character appears in video, its full speech/movement/stillness lock is written separately below — see "Voice & Movement Lock."

---

## Voice & Movement Lock — for characters that appear in video or speak

The CHARACTER BLOCK above locks how a character *looks*. It says nothing about how they sound or move — and without that, every video prompt that uses the character reinvents its performance from scratch, which drifts exactly like an unlocked visual trait does. If the character will only ever appear in stills, skip this section entirely.

Write three short, quotable descriptors — each one should be copy-pasteable, verbatim, straight into a `seedance-prompter`/`seedance-25-prompter` dialogue or action line, or into `diretor-cinematografico`'s micro-beat direction (`references/MICRO_BEATS.md`). Vague adjectives ("confident," "cool") don't survive that trip — they get reinterpreted every time. Physical, audible specifics do.

```
VOICE & MOVEMENT LOCK — @CHARACTER_TAG:

SPEECH: [register/pace/cadence + a locked exclusion]. Example: "speaks in
short, unhurried sentences, never trails off mid-thought, never raises
volume even when angry — anger shows in pace, not pitch."

MOVEMENT: [how it moves through space + what its hands/body do while
idle]. Example: "deliberate economy of motion, no wasted gesture, hands
default to stillness at the sides or in pockets, never fidgets."

STILLNESS: [what it does when nothing is being asked of it — often more
revealing than the movement line]. Example: "when waiting, weight
settles fully onto one leg, gaze holds on whatever it's looking at
without wandering, never checks a phone or looks away first."
```

**The lock works the same way the visual trait does — name what it excludes, not just what it includes.** "Speaks quietly" is weak — every character can be made to speak quietly for one line. "Never raises volume even when angry — anger shows in pace, not pitch" is a lock, because it tells the model what to do *instead* when the obvious choice (shouting) would break the character. Write the "never" clause for every field, the same as `SPEECH`/`MOVEMENT`/`STILLNESS` do above.

### Example — filled in for @AGENTE_MIB_BR (continuing from Example 2 above)

```
VOICE & MOVEMENT LOCK — @AGENTE_MIB_BR:

SPEECH: measured, low register, sentences end firmly with no trailing
uptalk. Never explains twice — says a thing once, waits. Never swears,
never raises volume; irritation shows as a longer pause before
answering, not as tone.

MOVEMENT: deliberate, minimal wasted gesture, weight centered and
grounded. Never rushes even under pressure — pace of movement stays
constant regardless of the scene's urgency.

STILLNESS: hands at rest or in pockets, chin level, gaze tracks
whatever's relevant without darting. Never crosses arms, never taps
feet or fingers.
```

This is what makes the character sound and move the same way in a calm dialogue scene and in an action scene — the performance locks travel with the character exactly like the wardrobe does.

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
