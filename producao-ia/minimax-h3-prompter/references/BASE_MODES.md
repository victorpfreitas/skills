# Base modes — T2VA / I2VA / FL2VA / L2VA

The four modes that don't use reference labels. All four share the same body notation (`OFFICIAL_SYNTAX.md`) and the same three fields. What separates them is **the instruction line** and **how the keyframe enters the timeline**.

Anything used as a *reference* rather than as a literal frame belongs in Ref2VA instead — see `REF2VA_MODE.md`.

---

## 1. The three fields

Every base-mode prompt is: instruction line (except T2VA) → **one blank line** → three fields in this exact order:

```text
integrated_multimodal_description: [Shot 1] ...

overall_soundscape: ...

non_diegetic_music: ...
```

| Field | Contents |
|---|---|
| `integrated_multimodal_description` | Visuals, actions, shots, speakers, dialogue, singing, and diegetic audio along the timeline |
| `overall_soundscape` | Ambience, physical action sounds, and non-verbal human sounds across the whole video |
| `non_diegetic_music` | Score the characters cannot hear and only the audience can |

---

## 2. The instruction lines — copy verbatim

These are **fixed literals**. Do not paraphrase them, do not "improve" the wording, do not translate them. `N` is the index of the actual final shot; `S.SS` is the effective duration to exactly two decimal places.

**T2VA** — no instruction line at all. The prompt begins directly with `integrated_multimodal_description:`.

**I2VA:**
```text
For the target video, at 0.00 seconds into the target video, <Picture 1> (from [Shot 1]) is fully referenced.
```

**FL2VA:**
```text
How the reference pictures align with the target video — Picture 1 (from Shot 1) aligns with the 0.00-second mark of the target video; Picture 2 (from Shot N) aligns with the S.SS-second mark of the target video.
```

**L2VA:**
```text
How the reference pictures align with the target video — <Picture 1> (from [Shot N]) aligns with the S.SS-second mark of the target video.
```

The instruction must be the **first line** of the final prompt, followed by one blank line before the fields.

---

## 3. How each mode handles its keyframe

### T2VA — build the timeline from nothing

No reference image. Construct the complete timeline from the text, adding scene, character, action, and sound detail that stays consistent with the user's intent. Freedom here is the point — but every added detail still has to be visible or audible.

### I2VA — start on the image, develop forward

`<Picture 1>` **is** the actual first frame at 0.00 s and belongs to `[Shot 1]`. Establish style, subjects, composition, and scene anchors from the image first, then describe the next action. Character identity, clothing, colors, key objects, and spatial relationships must stay consistent with it.

Structure: **first-frame anchor → action onset → continuous development → result or reaction**.

### FL2VA — describe the path between two frames

Picture 1 is the opening, Picture 2 is the ending. The body's job is **the motion path**, not two static image descriptions. Focus on how the subject moves, how poses change, how objects are handled, how composition evolves, how scene and lighting transition.

FL2VA generally favors a **single shot** so the model can interpolate continuously. Use multiple shots only when explicitly specified. The last frame must be reached by the final `[Shot N]` at the end of the video.

Structure: **first-frame state → observable intermediate changes → progressively narrowing differences → last-frame state**.

### L2VA — infer an opening, land on the image

`<Picture 1>` is the **final** frame and belongs to the last `[Shot N]` — it does not belong to Shot 1. Infer a plausible earlier state from the user's intent and the final frame, then describe how characters, objects, camera, and scene gradually approach the reference image.

Structure: **plausible preceding state → explicit action and transition path → gradual convergence in the final shot → last-frame landing**.

---

## 4. Complete official examples

### T2VA

```text
integrated_multimodal_description: [Shot 1] Live-action, cinematic, a medium-wide shot frames a baker opening the shutters of a small street bakery before sunrise. The camera pushes in with small amplitude at slow speed as the middle-aged baker with a calm, slightly raspy voice (S1) places a fresh loaf on the wooden counter and says: <d>[English] First batch of the morning.</d> [Shot 2] At 00:05.000, the camera cuts to a close-up of steam rising from the sliced bread while the baker's final words carry over from the previous shot.

overall_soundscape: Wooden shutters scrape open over a quiet street as trays clink softly inside the bakery. The doorbell rings once, followed by light footsteps and the crisp sound of bread being sliced.

non_diegetic_music: A soft acoustic-guitar pattern at a moderate tempo, joined by sparse upright-bass notes and a gentle fade at the end.
```

### I2VA

```text
For the target video, at 0.00 seconds into the target video, <Picture 1> (from [Shot 1]) is fully referenced.

integrated_multimodal_description: [Shot 1] Live-action, cinematic, the young woman shown in <Picture 1> remains beside the rain-covered train window, preserving her appearance, clothing, seat position, and the carriage layout. The camera trucks right with small amplitude at slow speed as she lifts her gaze from the folded letter toward the passing city lights. Her reflection moves across the glass while the quiet, breathy young woman (S1) says: <d>[English] I get off at the next station.</d> She folds the letter along its existing crease.

overall_soundscape: The train wheels produce a steady metallic rhythm beneath a low ventilation hum. Rain ticks against the window while paper rustles softly in her hands.

non_diegetic_music: Sustained cello notes at a slow tempo with widely spaced piano tones, gradually decreasing in volume.
```

Note what the body does **not** do: it doesn't re-describe the woman's face or outfit in competing detail. It names that the image's attributes are preserved, then spends its words on what moves.

### FL2VA (eight-second single shot)

```text
How the reference pictures align with the target video — Picture 1 (from Shot 1) aligns with the 0.00-second mark of the target video; Picture 2 (from Shot 1) aligns with the 8.00-second mark of the target video.

integrated_multimodal_description: [Shot 1] Live-action, cinematic, a rain-soaked cyclist begins in the position and framing established by Picture 1, holding a closed black umbrella beside a silver bicycle. The camera pulls out with small amplitude at slow speed as she releases the bicycle handle, raises the umbrella above her shoulder, and presses the runner upward until the canopy opens. Water rolls from the expanding fabric while she steps beneath it, rotates the handle into the final angle, and settles into the pose, spacing, and composition established by Picture 2 at the end of the shot.

overall_soundscape: Rain falls steadily on the pavement, followed by the metallic click of the umbrella runner and the soft snap of the canopy opening. Water drips from the bicycle frame as distant traffic passes.

non_diegetic_music: N/A
```

### L2VA (six-second single shot)

```text
How the reference pictures align with the target video — <Picture 1> (from [Shot 1]) aligns with the 6.00-second mark of the target video.

integrated_multimodal_description: [Shot 1] Live-action, cinematic, a close shot begins with an intact drinking glass near the edge of a dark wooden table, while the same hand and sleeve visible in <Picture 1> approach from the right. The camera pushes in with small amplitude at slow speed as the fingertips strike the rim. The glass tips, falls, and hits the floor with a sharp impact; cracks spread through it as fragments slide outward. Toward the end, the moving pieces lose momentum and settle into the exact broken arrangement, hand position, camera angle, lighting, and final composition established by <Picture 1>.

overall_soundscape: Fingertips tap the glass before it scrapes across the tabletop, falls, and breaks with a sharp crash. Small fragments scatter and gradually stop sliding across the floor.

non_diegetic_music: A low electronic pulse at a slow tempo, ending immediately after the glass breaks.
```

---

## 5. Base-mode checklist

- [ ] Correct instruction line, copied verbatim, as the first line — or absent, if T2VA
- [ ] One blank line between the instruction and `integrated_multimodal_description:`
- [ ] `S.SS` matches the requested duration, two decimals, and `N` matches the actual final shot
- [ ] Style declared inside `[Shot 1]`, not before it
- [ ] `[Shot 1]` has no timestamp; later shots increase and stay inside the duration
- [ ] FL2VA: single shot unless multiple shots were explicitly requested, and Picture 2 is reached at the end
- [ ] L2VA: the earlier state is inferred, not copied from the image, and convergence happens in the final shot
- [ ] The image's attributes are stated as preserved, not re-described in competing detail
- [ ] All three fields present, in order, none of them silently dropped
