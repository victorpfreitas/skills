# LoRA on MiniMax H3 — trained consistency

Beyond pure prompting (Ref2VA with loose references), H3 has a family of LoRA training and generation endpoints on fal.ai. This matters when loose references aren't enough — a character or style that has to repeat consistently across dozens of future generations, without re-uploading reference images every time.

> This file is lighter than the others because it covers ground outside the official prompting guide. It's the natural complement when a project needs the same level of consistency that `biblia-personagem` already provides on the image side.

---

## When to prefer LoRA over Ref2VA with loose references

| Situation | Approach |
|---|---|
| Character/style appears 1–3 times in the project | Ref2VA with reference images (`REFERENCE_ASSIGNMENT.md`) |
| Character/style will repeat across dozens of generations, over weeks or months | Train a LoRA once, load it in every generation afterward |
| Identity precision is critical and loose references already showed drift | LoRA — identity lives in the model instead of depending on re-sending the right image |

---

## Training endpoints

Each trainer learns a different kind of conditioning:

- **`t2v/trainer`** — trains on captioned clips for consistent pure text-to-video generation (useful for locking a recurring visual style with no image dependency at all).
- **`i2v/trainer`** — trains with first-frame conditioning, for animating a still image consistently.
- **`flf2v/trainer`** — trains on keyframe signatures (first, last, or both), useful when the project leans on First & Last Frame with the same character or style.
- **`ref2va/trainer`** — trains with multimodal reference conditioning (closest to Ref2VA), letting different reference types animate into video with audio consistently.

Captions are optional in the trainers — but the more precise the training set (same identity, varied angles and lighting), the better the resulting consistency.

## Generation endpoints with a loaded LoRA

- **`h3/text-to-video/lora`** — text-driven generation loading a trained LoRA at adjustable strength, to lock style, character, or motion.
- **`h3/image-to-video/lora`** — the uploaded image becomes the first frame; the prompt is optional; the LoRA reinforces subject consistency.
- **`h3/reference-to-video/lora`** — combines references (images/video/audio) with the trained LoRA, at adjustable strength.

---

## How this changes the prompt

Generating with a LoRA loaded lets the prompt get leaner — identity and style are already embedded, so the exhaustive trait list in `subject_definitions` can shrink. What still needs writing:

- Keep the **style declaration** and the **camera/action direction** as normal — a LoRA locks identity and style, not composition.
- Tune **LoRA strength** against the result: high strength locks identity but can stiffen pose and expression; low strength allows freer action but risks identity drift.
- Keep directing audio explicitly (`AUDIO_DIRECTION.md`) — the LoRA doesn't cover it.
- The format doesn't change. Mode structure, field names, and notation are the same whether or not a LoRA is loaded.

If the project already uses `biblia-personagem` to document a character, that same character sheet serves as the reference dataset for LoRA training — no need to duplicate the definition work, just reuse it.
