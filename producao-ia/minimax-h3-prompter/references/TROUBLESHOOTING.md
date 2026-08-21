# Troubleshooting — when the result comes out weak

Read this when the output isn't what the prompt asked for. Each symptom below has a likely cause and a direct fix. Change **one thing at a time** so you know what solved it.

Before anything else, check the format itself: a missing field, a paraphrased instruction line, a timestamp outside the duration, or an orphan label degrades results more than any wording choice. Run the checklist in `SKILL.md` §6 first.

---

## Identity drifts or distorts across the shot

**Likely cause:** the reference has no explicit role, or the body is competing with what the image already shows.

- Confirm the reference is defined as a `<Subject N>` with a concrete trait list in `subject_definitions`, and appears in `retention_analysis` with `fully_preserved`
- Stop re-describing in the body what the image already shows — that's a competing instruction
- Add the written trait list (face, hair, distinguishing marks, garment cut) — it's what the model falls back on when the frame leaves the reference angle
- With several images of the same character, confirm they all show the same state; don't mix ages or costumes unintentionally

---

## Camera doesn't move as asked, or moves generically

**Likely cause:** vocabulary outside the official closed table, or camera stacked as labels at the end of a sentence.

- Use only the motion types in `OFFICIAL_SYNTAX.md` §2, written as natural action inside the shot
- Check you didn't mean Push In when you wrote Zoom In (body movement vs. focal length) — they render differently
- Add amplitude and speed only where they're meaningful; spelling out medium/normal adds noise
- For composite movements, split them across shots or beats rather than stacking them in one sentence
- If the request is sophisticated, run it through `diretor-cinematografico` before writing the final prompt

---

## Pacing turns into a slideshow across multiple beats

**Likely cause:** cuts used where camera motion belonged, or shots whose bodies carry no new information.

- Every cut must introduce new information about subject, space, state, viewpoint, or time. If only distance or angle changes slightly, replace the cut with a camera move
- Each `[Shot N]` needs camera + action + detail, not "and then X happens"
- Check that cut times increase and all fall inside the requested duration — a timestamp past the end invalidates the prompt
- Count the beats against the duration: four cuts in six seconds is a slideshow by construction

---

## Audio is generic or aimless

**Likely cause:** audio wasn't directed — H3 always generates sound, and fills the gap itself when you don't specify.

- Split synchronized SFX, ambience, and score into their three correct places (`AUDIO_DIRECTION.md`)
- For a quiet scene, *describe* the quiet in `overall_soundscape` rather than leaving it empty; `N/A` is only for explicit total silence
- For score, give instrumentation and dynamics over time — a genre name isn't direction
- Check nothing is in the wrong layer: music a character can hear is diegetic and belongs in the body, not in `non_diegetic_music`

---

## Lip-sync is wrong, or a character mouths narration

**Likely cause:** missing voice-over notation, or delivery information written inside `<d>`.

- Voice-over needs the exact phrase `says in an off-screen voiceover`, immediately followed by the clause stating the lips remain closed
- Keep identification, action, and delivery **outside** `<d>`; only the language tag and the literal line go inside
- Confirm every speaker has a stable `(Sx)` reused across shots, and that non-speaking characters have no ID
- For a line crossing a cut, mark `<scenetrans>` in both parts and state that the audio continues
- Check dialogue isn't repeated in `overall_soundscape` — repeats produce doubled speech

---

## Style slips into a neighboring genre

**Likely cause:** style declared vaguely, or in the wrong place for the mode.

- Base modes open the style inside `[Shot 1]`; Ref2VA states it in 1–2 sentences **before** `[Shot 1]`. A style declared in the wrong slot reads as scene description
- Use concrete labels (`Live-action`, `2D-animated`, `claymation`, `vintage film`) rather than adjectives
- Restate the right tone positively where it might slip ("mysterious and cool, restrained throughout") — the native format has no negative field, and positive restatement is the in-format fix
- If you're using free prose anyway, that's where an explicit negative (`no jump scares`) can be added as a final sentence

---

## Editing an existing video changes things it shouldn't

**Likely cause:** the swap was described without its paired stability constraint.

- See `EDITING_PATTERNS.md` — each swap needs what must stay identical, whenever that isn't obvious
- For background or lighting swaps, explicitly ask the rest to react correctly (shadow, reflection, light on the subject)
- If several swaps are requested together and one bleeds into another, split into two sequential generations: edit one element, use the result as the new source video, edit the next
- Confirm `retention_analysis` isn't downgrading a marker for content that was *supposed* to change — new actions and events aren't fidelity losses

---

## Text/UI inside the video is illegible or garbled

**Likely cause:** the exact string wasn't written, or typography wasn't described.

- Put the literal string in double quotes, verbatim, untranslated — "a sign with the shop name" produces glyph soup; `a sign reading "HUHUI"` produces the word
- Describe the typography concretely (weight, case, color, material) instead of "with a title"
- For UI/HUD, tie each text element to the beat where it appears
- In free prose, an explicit negative helps: "do not introduce Chinese text, garbled characters, or misspellings" (adjust to your language)

---

## Ref2VA with many assets ignores or blends roles

**Likely cause:** labels that are defined but never resolved, or two assets competing for one attribute.

- Every label defined in `subject_definitions` must appear in `retention_analysis` and in the body — orphan labels are the most common Ref2VA failure
- Confirm no image got a standalone `<Picture N>` entry when it only defines a character or style; that belongs inside the `<Subject N>` definition
- Check that no two assets claim the same attribute without a stated winner — contradictory references average out rather than one winning
- Near the limits (9 images / 3 videos / 3 audios), cut what isn't contributing: fewer well-defined assets beat more vague ones

---

## When none of this fixes it

Regenerate varying **one element at a time** (camera only, audio only, one label's marker only) to isolate the cause. Mixing several adjustments into one retry tells you nothing about which one worked.

If the scene needs more than 15 seconds, more than 9 image references, or genuine long-form structure, the constraint is the model, not the prompt — `seedance-25-prompter` covers 30–180 s native long video and larger reference sets.
