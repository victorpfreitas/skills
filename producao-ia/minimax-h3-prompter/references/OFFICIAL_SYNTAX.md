# Official H3 notation — shared by every mode

Everything here comes from MiniMax's own guides (`VIDEO_PROMPT_WRITING_GUIDE_base_en.md` and `..._ref_en.md`). It applies identically to the base modes and to Ref2VA — only the field the body lives in changes (`integrated_multimodal_description` vs. `detailed_description`).

Notation is the single highest-leverage thing in an H3 prompt. A scene described beautifully in the wrong notation performs worse than a plain scene in the right one.

---

## 1. Shots and cuts

`[Shot 1]` opens the body and **never carries a timestamp**. Every later shot opens with a strictly increasing cut time, formatted `MM:SS.mmm`, inside the requested duration:

```text
[Shot 2] At 00:03.500, the camera cuts to a close-up of steam rising from the sliced bread.
```

Accepted cut phrasings: `the camera cuts to`, `the shot cuts to`, `the shot transitions to`, `the shot changes to`, `the shot switches to`. Cross-dissolve, fade, and wipe are allowed **only when the user explicitly asks** — otherwise use a plain cut.

**When a cut is justified:** it must introduce new information about subject, space, state, viewpoint, or time. If only distance or a slight angle changes, use camera motion instead. This is the most common structural mistake — cutting for variety rather than for information.

---

## 2. Camera: motion type + amplitude + speed

Three dimensions. Amplitude and speed are written **only when meaningful** — medium amplitude and normal speed are omitted, not spelled out.

| Dimension | Expression | Meaning |
|---|---|---|
| Motion type | `Zoom In / Zoom Out` | Focal length changes, camera body stationary |
| Motion type | `Push In / Pull Out` | The camera moves forward / backward |
| Motion type | `Pan Left / Pan Right` | Camera in place, lens pivots horizontally |
| Motion type | `Truck Left / Truck Right` | The camera translates horizontally |
| Motion type | `Tilt Up / Tilt Down` | Camera in place, lens pivots vertically |
| Motion type | `Pedestal Up / Pedestal Down` | The whole camera moves up / down |
| Motion type | `Arc Shot` | The camera arcs around the subject |
| Motion type | `Tracking Shot` | The camera follows a moving subject |
| Motion type | `Static Shot` | Position and lens both still |
| Motion type | `Shake Slightly / Shake Strongly` | Slight / strong camera shake |
| Motion type | `POV` | The subject's point of view |
| Motion type | `Roll Clockwise / Roll Counterclockwise` | The camera rolls around the lens axis |
| Amplitude | `with small amplitude` | Small compositional change |
| Amplitude | `with large amplitude` | Large compositional change |
| Speed | `at slow speed` | Slow movement |
| Speed | `at fast speed` | Fast movement |

Write it as natural English action **inside** the shot, never stacked as labels at the end of a sentence:

```text
The camera pushes in with small amplitude at slow speed toward the folded letter in her hands.
The camera pans right with large amplitude at fast speed, revealing the open doorway.
The camera holds a static shot as the runner exits the frame.
```

Zoom In is not Push In. Zoom changes focal length from a fixed body; Push moves the body through space. They read differently on screen and the model distinguishes them — pick deliberately. For camera × emotion decisions, go to `diretor-cinematografico` before writing the final prompt.

---

## 3. Style declaration

Common labels: `Cinematic`, `live-action`, `2D-animated`, `3D CG`, `claymation`, `watercolor`, `vintage film`.

- **Base modes:** the style opens `[Shot 1]` directly — `[Shot 1] Live-action, cinematic, a medium-wide shot frames...`
- **Ref2VA:** the style comes as one or two sentences **before** `[Shot 1]`.

For keyframe tasks, derive the style from the reference image rather than declaring a conflicting one. For T2VA, take it from the user's text.

---

## 4. Speakers, dialogue, and singing

Anyone who speaks, sings, or produces an off-screen human voice gets a stable ID: `(S1)`, `(S2)`. Several already-numbered speakers vocalizing together use a compound ID: `(S1,S2)`. A speaker keeps the same ID across shots. **Characters who never vocalize receive no ID at all.**

On a speaker's first appearance, establish a stable identity from visual and audio context — character type, age, gender, on-screen or off, pitch, timbre, speaking rate, accent.

The split is strict: identification, action, and delivery live **outside** `<d>`; inside `<d>` there is only the language tag and the actual spoken content, every word and punctuation mark preserved verbatim, never translated or rewritten.

```text
The young woman with a quiet, breathy voice (S1) says: <d>[English] I get off at the next station.</d>
The two children (S1,S2) shout together, <d>[English] Wait for us!</d>
```

**Voice-over** uses the exact phrase `says in an off-screen voiceover`, and every voice-over `<d>` block is immediately followed by a statement that the on-screen character's lips remain closed:

```text
The man (S1) says in an off-screen voiceover: <d>[English] I still remember that road.</d> while his lips remain completely closed.
```

Skipping the lips clause is the single most common cause of a character mouthing narration they shouldn't be speaking.

**Across a cut.** When the same line or lyric crosses a cut, mark `<scenetrans>` at the connecting point in **both** parts and state explicitly that the audio continues. Use `<cutoff>` when speech is truncated by the end of the video. Continuity phrasings: `continues seamlessly across the cut`, `continues uninterrupted into the next shot`, `carries over from the previous shot`, `remains audible across the transition`.

**Reused or reperformed lines** (Ref2VA): preserve the exact source words and original language inside `<d>`. Write `[unclear]` for unintelligible spans instead of guessing. Normalize punctuation to `,` `.` `?` `!` — strip tildes, emoji, bullets, and decorative repetition — and close statements, questions, and exclamations with the right mark before `</d>`.

---

## 5. On-screen text

Any banner, sign, label, subtitle, or neon **actually visible on screen** goes in double quotation marks, verbatim, untranslated:

```text
A red neon sign reading "营业中" glows above the doorway.
```

Text legibility is one of H3's strengths over Seedance — but only if you write the exact string. "A sign with the shop name" produces garbled glyphs; `a sign reading "HUHUI"` produces the word.

---

## 6. `overall_soundscape`

1–4 English sentences, one continuous paragraph, summarizing ambience, physical action sounds, and non-verbal human sounds across the **whole** video: wind, rain, traffic, footsteps, fabric, impacts, breathing, laughter, panting.

Dialogue, singing, and diegetic music already live in the body and **must not be repeated here**. Use `N/A` only when the user explicitly asks for complete silence throughout.

```text
overall_soundscape: Steady rain taps against the café windows while low room ambience continues underneath. The entrance bell rings once, followed by wet footsteps and the soft scrape of a chair.
```

---

## 7. `non_diegetic_music`

1–3 English sentences for score the characters cannot hear. Focus on **instrumentation, tempo, rhythm, and dynamic change**. Do not use abstract mood words and do not explain the score's emotional function.

```text
non_diegetic_music: Sparse piano notes at a slow tempo, joined by sustained low strings that gradually increase in volume before fading out.
```

Singing, instruments, radio, television, or phone music audible to the characters are **diegetic** events and belong in the body. `N/A` when there is no score. See `AUDIO_DIRECTION.md` for how to decide which layer a sound belongs to.

---

## 8. The rule underneath all of it

Every detail must correspond to something **visible or audible**. Visual style, composition, subject appearance and position, scene and props, actions and reactions, shot changes, spoken language, synchronized sound — all render. Intent, backstory, and emotional function ("to convey her isolation") do not. The model has no channel for subtext; text spent on it is text not spent on the frame.
