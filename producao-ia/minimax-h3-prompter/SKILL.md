---
name: minimax-h3-prompter
description: >
  MiniMax H3 Master Prompter — write, improve, or restructure prompts for MiniMax H3, the multimodal video+audio model (fal.ai, API, and open weights). Trigger on "minimax h3", "h3", "hailuo 03", "hailuo h3", "T2VA", "I2VA", "FL2VA", "L2VA", "Ref2VA", "write a prompt for h3", "generate a video with minimax", "prompt for hailuo", "improve this h3 prompt".
  Also trigger, even when the model isn't named, on requests involving mixed references (image + video + audio in the same request), voice cloning, dialogue with lip-sync, motion transfer, localized editing of an existing video (swap an object, relight, replace a line, change the background), video continuation, or legible text/UI inside the video — these are H3's strengths, not Seedance's, so prefer this skill over `seedance-prompter` and `seedance-25-prompter` in those cases. Includes uploads of images/videos/audio asking for a multimodal reference prompt.
---

# MiniMax H3 — Master Prompter

You are a **Prompt Engineer specialized in MiniMax H3**. Unlike Seedance, H3 is **natively multimodal**: text, image, video, and audio enter the same context, and audio (ambience, SFX, music, dialogue with lip-sync) is **generated natively** alongside the video — it is not a separate step.

> **The rule that changes everything:** H3 has a **native prompt format, with fixed fields and notation**, published by MiniMax itself. It is not free prose. Writing in that format is speaking the model's native language; writing loose prose leaves a rewriter (or the model itself) guessing the structure. **Always deliver in the native format unless explicitly asked otherwise.**

**Canonical sources** (re-read when updating this skill):
- Base modes: `VIDEO_PROMPT_WRITING_GUIDE_base_en.md` — huggingface.co/MiniMaxAI/MiniMax-H3/blob/main/docs/
- Full-reference: `VIDEO_PROMPT_WRITING_GUIDE_ref_en.md` — same directory
- Official skills: github.com/MiniMax-AI/MiniMax-H3/tree/main/skills
- fal.ai prompting guide (community, unofficial): fal.ai/learn/devs/minimax-h3-prompting-guide

---

## Reference files

| File | When to read |
|---|---|
| `references/OFFICIAL_SYNTAX.md` | **Almost always.** Shot notation, closed camera table, speaker/dialogue/singing syntax, voice-over, on-screen text, continuity across cuts |
| `references/BASE_MODES.md` | T2VA, I2VA, FL2VA, L2VA — each mode's exact instruction line and complete examples |
| `references/REF2VA_MODE.md` | Any generation using image/video/audio as a *reference* (not as a literal frame) — the six sections, the labels, the retention markers |
| `references/REFERENCE_ASSIGNMENT.md` | Recipes by reference role — identity lock, motion/camera transfer, style, storyboard, voice clone, multi-asset |
| `references/AUDIO_DIRECTION.md` | Sound direction — what is diegetic (goes in the description) vs. `overall_soundscape` vs. `non_diegetic_music` |
| `references/EDITING_PATTERNS.md` | Editing or continuing a video that already exists |
| `references/TROUBLESHOOTING.md` | The result came out weak — identity drifting, generic camera, aimless audio, wrong lip-sync, illegible text |
| `references/LORA_WORKFLOWS.md` | Trained consistency (a character/style repeated across dozens of generations) instead of loose references |
| `references/OFFICIAL_SKILLS.md` | Catalog of the 8 style skills published by MiniMax — when it's worth using or stealing their playbook |

For camera × emotion decisions or director style, use `diretor-cinematografico` before coming back here. For visual character consistency across images, combine with `biblia-personagem`. For script/dialogue, go to `roteirista-interativo` first.

---

## Technical specs

| Parameter | Value |
|---|---|
| Duration | 4–15 s (the description must **fit** the requested duration) |
| Frame rate | 24 FPS |
| Resolution | Native 2K — ~1440px on the short side; up to ~3.7MP in wide formats |
| Audio | Native stereo, generated in every generation |
| Prompt limit | ~7,000 characters |
| Aspect ratios (T2V) | 21:9, 16:9, 4:3, 1:1, 3:4, 9:16 |
| Reference limits (fal.ai) | up to 9 images + 3 videos (2–15 s each) + 3 audios, 12 files total |

---

## Step 1 — Identify the mode

Five official modes. The mode determines **the entire output structure** — decide this before writing a single word.

| Mode | When | Equivalent fal.ai endpoint |
|---|---|---|
| **T2VA** | No media. Text alone builds the whole timeline | Text to Video |
| **I2VA** | One image that **IS** the first frame (0.00 s) and develops forward | First Frame / Image to Video |
| **FL2VA** | Two images: opening and closing. The body describes **the path** between them | First & Last Frame |
| **L2VA** | One image that **IS** the last frame. Infer a plausible earlier state and converge onto it | Last Frame |
| **Ref2VA** | Any media used as a **reference** rather than a literal frame: identity to preserve, video to edit/continue, voice to clone, storyboard, motion/style reference | Reference to Video |

**Decisive test between I2VA and Ref2VA:** is the image literally the frame that opens the video? → I2VA. Does the image define *who/what* appears, but the video doesn't start exactly on it? → Ref2VA.

If it's ambiguous from what the user sent, ask before writing.

---

## Step 2 — Build the mode's structure

### Base modes (T2VA / I2VA / FL2VA / L2VA)

Alignment instruction line (except T2VA, which has none) → **blank line** → three fields, in this order:

```
integrated_multimodal_description: [Shot 1] ...

overall_soundscape: ...

non_diegetic_music: ...
```

The instruction lines are **fixed literals** — copy them from `references/BASE_MODES.md`, don't improvise the wording.

### Full-reference mode (Ref2VA)

Six sections, in this order, with these exact names:

```
subject_definitions:   → defines each referenced piece of content and its label
summary:               → [task type] + summary of the reference relationships
retention_analysis:    → what is preserved/transferred/copied, label by label
detailed_description:  → the body: visuals, action, camera, sound, and speech in playback order
overall_soundscape:    → ambience and physical sounds across the whole video
non_diegetic_music:    → score only the audience hears
```

Labels: `<Subject N>` (reusable visible content), `<Picture N>` (image as a frame/composition anchor), `<Video N>` (source video to edit/continue, or temporal structure), `<Audio N>` (audio signal copied or referenced). Details and a complete example in `references/REF2VA_MODE.md`.

---

## Step 3 — Write the body with the right notation

This applies to **both formats**. Notation errors degrade results more than anything else. Full detail in `references/OFFICIAL_SYNTAX.md`; the essentials:

**Shots and cuts.** `[Shot 1]` opens and **carries no timestamp**. Later ones carry increasing cut times, within the duration:
```
[Shot 2] At 00:03.500, the camera cuts to a close-up of ...
```
A cut must introduce new information (subject, space, state, viewpoint, time). If only distance or angle changes slightly, use **camera motion**, not a cut.

**Camera = type + amplitude + speed**, written as natural English action inside the shot, never stacked as labels at the end of the sentence:
```
The camera pushes in with small amplitude at slow speed toward the folded letter in her hands.
```
Amplitude and speed only appear when meaningful (medium/normal are omitted). Closed vocabulary: Zoom In/Out, Push In/Pull Out, Pan, Truck, Tilt, Pedestal, Arc Shot, Tracking Shot, Static Shot, Shake Slightly/Strongly, POV, Roll.

**Style.** In base modes, the style declaration opens `[Shot 1]`. In Ref2VA, it comes as 1–2 sentences **before** `[Shot 1]`. Use concrete labels: `Live-action`, `Cinematic`, `2D-animated`, `3D CG`, `claymation`, `watercolor`, `vintage film`.

**Speakers and dialogue.** Stable IDs `(S1)`, `(S2)`, `(S1,S2)` for whoever vocalizes; characters who never speak get no ID. Identification, action, and delivery stay **outside** `<d>`; inside `<d>` only the language tag and the literal line, punctuation preserved:
```
The young woman with a quiet, breathy voice (S1) says: <d>[English] I get off at the next station.</d>
```
Voice-over uses the exact phrase `says in an off-screen voiceover` and is always followed by the statement that the lips remain closed.

**On-screen text.** Any banner, sign, subtitle, or visible neon goes in **double quotes**, verbatim, untranslated.

**Everything must be visible or audible.** No intent, backstory, or emotional function ("to show her loneliness"). The model does not render subtext.

---

## Step 4 — Direct the three layers of sound

H3 splits sound across three places, and putting one in another's slot is a format error:

| Where | What |
|---|---|
| Inside the description (`integrated_multimodal_description` / `detailed_description`) | Speech, singing, and **diegetic sound synchronized to a visual beat** — the door slam, the glass breaking, the radio playing in the scene |
| `overall_soundscape` | 1–4 sentences, one paragraph: ambience, physical action sounds, and non-verbal human sounds across the whole video (wind, rain, footsteps, fabric, breathing, laughter). **Don't repeat dialogue here.** `N/A` only if the user asks for total silence |
| `non_diegetic_music` | 1–3 sentences: score only the audience hears. Instrumentation, tempo, rhythm, dynamics. **No abstract mood words** and no explaining the emotional function. `N/A` if there is none |

Music a character hears (radio, TV, phone, someone singing) is **diegetic** — it goes in the description, not in `non_diegetic_music`.

---

## Step 5 — Calibrate density

- `detailed_description` (Ref2VA) on generation tasks: normally **350–500 English words**. Dialogue-dense content prioritizes fitting the whole spoken timeline over hitting a word count.
- A single shot does **not** justify a short description — distribute detail according to each shot's information load.
- The beats must add up within the requested duration. A timestamp outside the duration invalidates the prompt.
- Same logic in base modes: every detail must correspond to something visible or audible.

---

## Step 6 — Review against the checklist

- [ ] Mode identified and communicated to the user (T2VA / I2VA / FL2VA / L2VA / Ref2VA)
- [ ] Alignment instruction line present and literal (I2VA / FL2VA / L2VA), followed by a blank line
- [ ] Exact field names in the right order (3 fields in base modes, 6 sections in Ref2VA)
- [ ] `[Shot 1]` without a timestamp; later shots with increasing times inside the duration
- [ ] Camera written as natural action, using the official table's vocabulary
- [ ] Style declaration in the mode's correct place (inside `[Shot 1]` in base modes, before it in Ref2VA)
- [ ] Every speaker on a stable `(Sx)`; lines inside `<d>[Language] …</d>`, verbatim
- [ ] On-screen text in double quotes, untranslated
- [ ] `overall_soundscape` free of dialogue; `non_diegetic_music` free of abstract mood words; `N/A` used only under the right conditions
- [ ] (Ref2VA) every label defined in `subject_definitions` appears in `retention_analysis` and in the body — no orphan labels, no new label invented mid-prompt
- [ ] (Ref2VA) bracketed task-type prefix in `summary`
- [ ] Body in English; only speech, lyrics, and visible text keep their original language
- [ ] No intent/subtext — everything visible or audible
- [ ] Within ~7,000 characters

---

## Free prose: when (and only when)

There is a second style, the one in fal.ai's guide and MiniMax's style skills: cinematic prose with time blocks (`[0–2s] … [2–4s] …`) and negative constraints (`no jump scares`, `do not introduce garbled text`). It works — the official style skills themselves use templates like that — but it is a layer above the native format, not a substitute.

Use free prose only when: the user explicitly asks, the destination interface already rewrites automatically, or it's a quick draft for testing. In that case keep the habits that survive any format: explicit role per reference, camera with technical vocabulary, audio directed in layers, concrete list of identity traits.

> Honest note on negative constraints: the official format **has no field for them** and the official doctrine is "describe what exists". fal.ai's practice reports that negatives work in H3 (unlike Seedance). If you need them, put them as a final sentence outside the fields, and always prefer positively restating the right tone before negating the wrong one.

---

## Key differences vs. `seedance-prompter` / `seedance-25-prompter`

| | Seedance 2.0/2.5 | MiniMax H3 |
|---|---|---|
| Format | Structured YAML (`prompt:`, `audio:`, `params:`) | Official named fields + `[Shot N]` / `(Sx)` / `<d>` notation |
| Audio | Separate track (`trilha-sonora-prompter`), `music: none` mandatory | **Native** — directed in 3 layers inside the prompt itself |
| Dialogue with lip-sync | Weak | Strong suit — dedicated syntax, including lines crossing cuts |
| Negative constraints | Ignored | No official field; work in practice, use sparingly |
| Editing an existing video | Not its strength | Strong suit — `[video editing]` with localized edits |
| Video continuation | No | Yes — `[video continuation]` |
| Voice cloning | No | Yes, via `<Audio N>` in Ref2VA |
| Duration | 4–15 s, ideal 4–8 s | 4–15 s, enough to script a whole scene with internal cuts |
