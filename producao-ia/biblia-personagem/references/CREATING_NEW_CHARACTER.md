# Creating a New Character From Scratch

When the user brings only a loose idea ("I need a mascot for campaign X", "I want a recurring agent for a series"), the visual identity is built in short rounds — the same ask-before-writing logic that `roteirista-interativo` uses for text, applied here to the visual instead. Never decide everything at once and hand over a closed character sheet without checking each layer with the user.

---

## Order matters

Each layer constrains the next, so this order avoids overly open-ended questions:

```
1. Function     -- why this character exists (brand mascot, recurring series
                   protagonist, host avatar)?
2. Silhouette   -- overall shape recognizable at a distance/in miniature,
                   before any detail (realistic human? stylized proportion?
                   mascot with a wearable prop, like a keycap-shaped costume?)
3. Non-negotiable trait -- the ONE element that must survive every
                   generation, even if everything around it changes (a
                   symbol, an exclusive color, an unusual proportion, an
                   object it always carries)
4. Color/variant system -- if there will be more than one version (male/
                   female pair, work outfit/leisure outfit), decide now the
                   color code that distinguishes each variant
5. Name and tag -- the character's name + the technical tag
                   (@CHARACTER_NAME) that will appear in every prompt from
                   here on
```

## Why "non-negotiable trait" comes before everything else

It's the easiest element to lose in a new generation — if it isn't explicitly named and repeated in every prompt, the model swaps it for something generic as soon as the scene changes (different camera angle, different location, different variant). Examples of a strong non-negotiable trait: a brand symbol always in raised 3D relief, never printed flat; an exclusive skin tone/material texture; a body proportion that isn't standard-human. A weak trait is one that can be described in many ways without losing the identity ("a cool outfit") — that doesn't hold consistency.

## Silhouette before detail

Ask first for the shape recognizable as a silhouette (black outline, no internal detail) — if the character is only recognizable by fine detail (fabric texture, exact color), it won't survive light/angle variation between generations. A good test: "if I strip the color and show only the outline, can you still tell it's this character?".

## Variant system — decide the code before creating the second version

If the character will have more than one version (e.g. a male/female pair, an outfit per season/location), decide now:
- What is **shared** across all variants (the base that never changes).
- What **changes per variant** (color, accessory, typical location) and how that reads as visually obvious (e.g. every "resort" variant is barefoot with a beach accessory).

Without that code defined up front, every new variant becomes an isolated decision and the character family loses cohesion.

## Name and tag

The technical tag (`@CHARACTER_NAME`, uppercase, no spaces) is what goes into every prompt — decide it alongside the common name, not afterward. Recommended convention: `@[FUNCTION_OR_NAME]_[VARIANT_IF_ANY]`, e.g. `@CHAR_PONTO`, `@AGENTE_MIB_BR`.

## After the briefing

Once the 5 layers are locked, write the formal CHARACTER BLOCK (`CHARACTER_BLOCK_TEMPLATE.md`) and generate the first reference image via `image-prompter` — that approved image becomes the visual source of truth for every future generation.
