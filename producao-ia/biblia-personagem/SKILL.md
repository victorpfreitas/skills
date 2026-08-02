---
name: biblia-personagem
description: >
  Use this skill whenever a new character needs to be created with visual
  consistency across image/video generations, or an already-decided character
  needs to be documented in a production bible. Trigger on: "create a new
  character for this campaign", "recurring character for a series", "build
  this character's bible", "character sheet", "document this character to
  keep it consistent", "this character keeps coming out different every
  generation", "create the brand mascot", or any character (mascot, series
  protagonist, brand avatar) that appears across multiple generations and
  needs to always read as the same entity. Generalizes the campaign-specific
  pattern from the `livelo` skill into a reusable pattern for any new
  project, and also covers designing the character from scratch, not just
  documenting one that already exists. Always combine with `image-prompter`
  or `seedance-prompter` when it's time to actually generate.
---

# Character Bible

You are the **co-art-director** responsible for keeping a character visually identical across every image or video generation, no matter how many times it's recreated, by which model, or in which scene. A character bible is the single reference document that every image/video prompt consults before describing that character — the character is never described off-the-cuff.

This skill covers two modes of work:

- **Creating a new character** — the user only has a loose idea ("I want a mascot for this campaign", "I need a recurring agent for a series") and the bible is born alongside the design.
- **Documenting an already-decided character** — the look already exists (a reference image, an informal description, a character from a previous campaign) and it just needs to be consolidated into a formal bible before scaling production.

---

## Reference files

| File | When to read it |
|---|---|
| `references/CREATING_NEW_CHARACTER.md` | Whenever the character doesn't exist yet — a question-driven workflow for designing the visual identity from scratch |
| `references/CHARACTER_BLOCK_TEMPLATE.md` | When writing the formal sheet for any character — the word-for-word block template plus two filled-in examples (wearable mascot and realistic human) |
| `references/SCENES_PROPS.md` | When the character needs catalogued locations and props alongside it (series, campaign) — how to tag and document them without falling back on free-form description |
| `references/MULTIMODEL_CONSISTENCY.md` | Before generating across more than one model (Nano Banana, Seedream, GPT Image 2, Seedance) — each one reads character references differently |
| `references/TROUBLESHOOTING.md` | When the character comes out different across generations — symptom → cause → fix |

---

## Rule #1 — never describe the character in free-form text

A loose description ("a guy wearing a black outfit") makes the model reinterpret the character on every generation. The bible exists to prevent that. Always:

- Give the character a **unique tag** (`@CHARACTER_NAME`) — never refer to it by common name alone when assembling a prompt.
- Write a fixed **CHARACTER BLOCK** (see `CHARACTER_BLOCK_TEMPLATE.md`) and paste it **word-for-word** into every prompt that uses that character — never summarize, never paraphrase.
- Close with the phrase `"Reproduce exactly as @image reference. Do not reinterpret."` whenever an approved reference image of the character exists.

## Rule #2 — every distinguishing trait needs a sentence that forces the distinction

A near-generic character (common human silhouette, common clothing) drifts into "any similar-looking person" by the second generation. The bible needs to explicitly name **what can never vary** — a symbol, an unusual proportion, an exclusive color, a material texture — and repeat it in CAPS or with "CRITICAL, DO NOT REINTERPRET" in the block. See examples in `CHARACTER_BLOCK_TEMPLATE.md`.

## Rule #3 — variants of the same character inherit the base block, they don't recreate it from scratch

When a character has multiple versions (beach outfit, work outfit, female/male variant of the same pair), the bible declares a **shared base block** (what never changes across variants) and then only the **difference** for each variant (outfit, accessory, typical scene). This prevents a variant from diverging on something that should be identical across all of them.

---

## Workflow

### Mode A — Create a new character

1. Read `references/CREATING_NEW_CHARACTER.md` and run the briefing in short rounds (don't decide everything at once) — the character's function, silhouette/proportion, non-negotiable distinguishing trait, color/variant system, name and tag.
2. Once the identity is locked, write the formal CHARACTER BLOCK (`CHARACTER_BLOCK_TEMPLATE.md`).
3. Generate the character's first reference image via `image-prompter`, using the freshly written CHARACTER BLOCK as the prompt itself.
4. Once that image is approved, it becomes the official visual reference — every future generation cites that image with `"Reproduce exactly as @image reference"`.

### Mode B — Document an existing character

1. Gather what already exists (reference image, informal description, character from a previous campaign) and organize it into the formal CHARACTER BLOCK — don't invent new traits, just formalize what's already been decided.
2. If the character has recurring locations/props (series, campaign), catalogue them with `references/SCENES_PROPS.md`.
3. Run the consistency checklist below before considering the bible done.

### In both modes — before any production generation

1. Read `references/MULTIMODEL_CONSISTENCY.md` to know how to cite the character's reference in the chosen model (the syntax differs between Nano Banana, Seedream, GPT Image 2 and Seedance).
2. Assemble the prompt by combining the CHARACTER BLOCK + location/prop (if any) + the formula from `image-prompter` or `seedance-prompter`.
3. Run the consistency checklist below.
4. If the result comes out divergent, use `references/TROUBLESHOOTING.md` before trying again.

---

## Consistency checklist

- [ ] The character has a unique tag (`@NAME`) — never referred to by common name alone in the prompt.
- [ ] The CHARACTER BLOCK is pasted word-for-word, not summarized.
- [ ] The non-negotiable distinguishing trait is declared in CAPS/CRITICAL in the block.
- [ ] If variants exist, the shared base block is separated from the variant-specific difference.
- [ ] `"Reproduce exactly as @image reference. Do not reinterpret."` is present when an approved reference image already exists.
- [ ] The reference-citation convention matches the model used for this generation (see `MULTIMODEL_CONSISTENCY.md`).
- [ ] The project's master visual style (if any, e.g. color palette, camera, grain) is appended at the end of the prompt.

---

## Combines with

- **`image-prompter`** — generates the character's reference image and the subsequent production images.
- **`seedance-prompter`** — animates the character in video, using `@Image1`/`@Image2`... for R2V (see `MULTIMODEL_CONSISTENCY.md`).
- **`roteirista-interativo`** (narrative character-building reference, the `character.md` file inside that skill's `references/`) — that's the narrative layer (role in the story, want, flaw, voice). The character bible here is the **visual** layer (what they look like). A recurring series character usually needs both: the narrative layer decides who they are, this skill decides how they never stop looking like themselves.
