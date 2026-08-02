# Core Prompt Formula and Special Syntax — Seedance 2.5

**Read this file at the start of every task.** It's the foundation all the other reference files build on.

---

## 1. Core formula

```
Subject + Action or Event + Scene and Environment (Optional) + Visual Style (Optional) + Camera Movement/Cut (Optional) + Audio (Optional)
```

- **Subject + Action or Event** — who/what does what. This is the backbone of the video, never omit it.
- **Scene and Environment** — location, time of day, weather, spatial relationships, background state.
- **Visual Style** — light, color, materials, image texture, overall mood.
- **Camera Movement/Cut** — shot size, angle, movement, focus, transitions.
- **Audio** — dialogue, voice timbre, ambience, SFX, music.

Optional elements can be omitted. Generation parameters (duration, aspect ratio, resolution) do **not** go in the prompt body — they're configured on the generation page or via the API.

### Basic template
```
<Subject> performs <primary action or event> in <scene and environment>.
The visuals feature <visual style>.
Use <shot size, camera angle, camera movement, or cuts>.
Audio includes <dialogue, ambience, sound effects, or music>.
```

### Example
```
A ceramic artist finishes a pale blue cup in a studio at dawn, lifts it from the wheel, and places it in the center of a wooden shelf. Soft morning light enters through the window. The wet clay has a delicate sheen, and the workbench remains tidy. Begin with a medium shot of the wheel-throwing process, slowly push in toward the cup's surface texture, then cut to a frontal view of the shelf. Retain the low hum of the pottery wheel, the friction of clay, and subtle indoor ambience.
```

---

## 2. Full production formula (long form)

For more robust production prompts, use this 4-block structure:

```
Complete prompt = [Creatives Description] + [One-sentence Summary] + [Specific Plot Description] + [Global Supplement (Ending)]
```

- **Creatives Description** — reference number (in upload order) + specific purpose (which character/timbre/action/scene it is). Omit if there's no reference.
- **One-sentence Summary** — Subject + Location + Event + Theme/Style + Special Camera Movement.
- **Specific Plot Description** — written as a timeline/storyline. Each storyboard block/time period contains:
  - ➕ **Positive description**: specific image content + camera movement + action + dialogue + SFX
  - ➖ **Reverse description (negative prompt)**: unwanted elements (e.g. "no subtitles", "no bgm")
- **Global Supplement (Ending)** — reinforce at the end the elements and visual details that need to be present throughout the whole video (camera position, environment/scene characteristics, overall sound/atmosphere, light). This is also where you repeat global restrictions (no subtitles, no BGM).

---

## 3. Special syntax

Prompts can be written entirely in natural language. When you need to explicitly distinguish music, SFX, dialogue, and subtitles, use:

| Content | Syntax | Example |
|---|---|---|
| Music | `()` | `(Soft, rhythmic piano music plays in the background)` |
| Sound effects | `<>` | `<A bell rings in the distance>` |
| Dialogue | `{}` | `{Hello, welcome back.}` |
| Subtitle | `【】` | `【Chapter One: Departure】` |

### Reinforcing dialogue language

When the dialogue isn't in Chinese, specify the language before the line:
```
The girl says softly in Japanese: {もう大丈夫です}
```

If the dialogue text is in English but the model speaks in Chinese, or you need a specific regional variant, reinforce the language before the line:

```
Dialogue Language + Regional Variety or Accent + Delivery Style + Speaker + {Dialogue}
```

Examples:
```
Dialogue language: American English. The girl says in natural, conversational American English: {I thought you weren't coming.}

Dialogue language: authentic Los Angeles English. The young man says in natural Los Angeles vernacular: {No way, you actually made it.}
```

---

## 4. Negative Prompts — critical change relative to 2.0

**In Seedance 2.0, negation was ignored — the rule was to describe only the positive.** In 2.5 that changed: every official example in the guide uses an explicit `[Negative Prompts]` block, and ByteDance cites as an official improvement "🔇 remove irrelevant subtitles and BGM" — a direct optimization for negative-prompt responsiveness.

Use the block at the end of the prompt:
```
[Negative Prompts]: No exaggerated crying, no fast cuts, no large body movements, no extra dialogue, no BGM, no runny nose, no premature dropping of tears.
```

Best practices for the negative prompt block:
- List from **[sound] + [subtitles] + [behavior] + [points prone to collapse]**.
- Be specific to what the scene actually risks getting wrong (not a generic list copied from another scene).
- Combine with the long-form production format's "Prohibited items" (section 2) when writing 30s+ videos.

This doesn't fully invalidate good positive-description practice — keep describing what you want to appear first. The negative prompt is a complementary reinforcement, not a substitute for the positive description.

### When to also state a suppression early, not just at the end

The `[Negative Prompts]` block at the end is the default and correct placement — that's how every official ByteDance example does it. But for the one or two suppressions that are the scene's single biggest known failure risk (unwanted subtitles on a talking-head shot, BGM appearing on a track that must stay diegetic-only, an extra character entering a scene that must stay empty), state that specific suppression **twice**: once near the top, right after the style/scene declaration, and again in the closing `[Negative Prompts]` block. Generation resolves early elements of the prompt first — a suppression that only shows up at the very end competes with everything else the model has already committed to by that point.

Don't do this for the whole negative list — only for the risk that's actually live in this scene. A talking-head clip that has burned in unwanted captions on every retry earns an early, explicit `No on-screen text, no captions, no subtitles at any point in this shot.` right after the style line, in addition to repeating it in `[Negative Prompts]`. A scene with no history of that failure doesn't need the duplication — it's a targeted fix for a specific recurring drift, not a standing rule.

---

## 5. Supported languages

2.5 significantly expanded language support — you no longer need to translate to Chinese/English. Optimization priority: Chinese, English, Spanish, Indonesian, Malay. Full coverage also for: Thai, Arabic, Portuguese, Vietnamese, Japanese, Korean. Write the prompt in whichever language is most natural for the content (e.g. dialogue in Portuguese when it makes sense for the audience).

---

## 6. Pre-submission checklist (official ByteDance)

- Does the prompt clearly state the subject and the primary action/event?
- Does every reference declare what to use and what not to use?
- Is every distinct character/product/prop named and linked to a reference?
- Are references selected per scene, rather than forced to all appear at once?
- Does each stage of a long video have only one primary change and a clear end state?
- Do character count, clothing, prop ownership, and spatial relationships stay consistent?
- For video editing: does the prompt define the "sole editing master," edit scope, target quantity, and content to preserve?
- Are abstract emotions and cinematography terms accompanied by directly visible/audible cues?
- Do first/last frame and multiple keyframes each have one role per image, and do first/last use the same aspect ratio?
- For storyboard: does the prompt declare which structure to inherit? For blockout: did you identify coarse vs fine and specify what to inherit (temporal, structural, material, style)?
- Do video editing, first/last-frame, and video extension follow the automatic aspect-ratio/duration lock rules?
- For video extension: did you check the boundary frame, motion trend, and audio continuity?
- For one-click video: does the prompt define material roles, image order, amount of motion, editing style, and audio?
- For seamless transition: does the prompt define the role of both videos, the trigger action, the transition process, and the arrival state?
