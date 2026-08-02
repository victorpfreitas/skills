# Troubleshooting — Character Coming Out Different

Symptom → likely cause → fix. Consult before trying again with the same prompt.

---

### The character looks "almost" the same, but something is subtly off

**Likely cause:** the CHARACTER BLOCK was summarized or paraphrased instead of pasted word-for-word.
**Fix:** go back to the original block in the bible and paste it exactly as written, without trying to "shorten it to sound more natural" — text variation is what opens room for the model to reinterpret.

### Distinguishing trait (symbol, scar, mark) disappeared or got weaker

**Likely cause:** the trait was described without enough emphasis, or is only mentioned once in the middle of a long paragraph.
**Fix:** isolate the trait in its own sentence, in CAPS or with "CRITICAL", and repeat the requirement in the prompt's closing line (e.g. "Do not omit the scar", "Do not make the symbol flat").

### A 3D/relief element came out flat or printed

**Likely cause:** the description didn't specify the physical finish (relief, self-shadowing, specular highlight) — it only described shape/color.
**Fix:** explicitly declare "in high physical 3D relief, casts its own shadow, has specular highlight" — without this the model tends to treat any mark/symbol as a flat printed pattern on the surface.

### The character's back view shows something wrong

**Likely cause:** the bible didn't document the back view, so the model assumed a generic one.
**Fix:** add an explicit "BACK FACE"/back view section to the CHARACTER BLOCK whenever the character has a chance of appearing from behind (see `CHARACTER_BLOCK_TEMPLATE.md`).

### Variant A came out with variant B's trait (colors/accessories swapped)

**Likely cause:** the variants were described from scratch instead of inheriting the base block — without an explicit shared base block, every variant is a "new invention" and details leak between them.
**Fix:** rewrite the variants in the "same base construction as @BASE_TAG" format + only the variant-specific difference (see the "Variants" section in `CHARACTER_BLOCK_TEMPLATE.md`).

### The character is consistent in a still image, but diverges once turned into video

**Likely cause:** the reference syntax used in the video prompt doesn't match Seedance's convention, or the CHARACTER BLOCK was left out because the reference image alone was assumed to be enough.
**Fix:** see `CONSISTENCIA_MULTIMODELO.md` — include the full CHARACTER BLOCK even when a reference image already exists via `@Image1`.

### Progressive drift across a sequence of clips

**Likely cause:** each new clip was anchored on the character's original intent, not on the observed state from the last approved clip (final pose, accessory position).
**Fix:** describe the next clip based on the previous clip's final frame, not the CHARACTER BLOCK in isolation — see the continuity note in `CONSISTENCIA_MULTIMODELO.md`.

### A narrative prop or location (with text) came out with wrong/illegible text

**Likely cause:** the exact text wasn't declared in quotes in the prop/location sheet — a vague description like "a newspaper headline" leaves the model free to invent the text.
**Fix:** always quote the exact text in the prop's catalogue entry (see `CENARIOS_PROPS.md`), including language when relevant (this avoids, for example, characters from the wrong language accidentally showing up).

### The character looks good in stills, but "presence"/posture changes from scene to scene

**Likely cause:** the bible only documented the static visual (face, outfit) and not a posture/movement cue.
**Fix:** for characters that appear in video, add a "voice/posture cue" line to the CHARACTER BLOCK (see Example 2 in `CHARACTER_BLOCK_TEMPLATE.md`) — it doesn't need to be long, just enough to anchor how they move/carry themselves by default.
