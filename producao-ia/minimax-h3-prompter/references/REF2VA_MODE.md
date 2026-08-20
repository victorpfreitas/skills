# Ref2VA — full-reference mode

The mode for anything used as a **reference** rather than as a literal frame: an identity to preserve, a video to edit or continue, a voice to clone, a storyboard, a motion or style reference. It is H3's most powerful mode and the one with the strictest output format.

Body notation (shots, camera, speakers, `<d>`, on-screen text) is shared with the base modes — see `OFFICIAL_SYNTAX.md`. This file covers what is specific to Ref2VA: the labels, the analysis sections, and the format differences.

Write all six sections in English. Preserve the original language only for dialogue and lyrics inside `<d>`, and for text visibly present in the scene.

---

## 1. The six sections, in order

| Section | Purpose |
|---|---|
| `subject_definitions` | Defines referenced content and its reference labels |
| `summary` | Summarizes task type, target video, and main reference relationships |
| `retention_analysis` | Describes how referenced content is preserved, transferred, or reused |
| `detailed_description` | Visuals, actions, shots, sound, and dialogue in playback order |
| `overall_soundscape` | Ambience and physical sounds |
| `non_diegetic_music` | Score audible only to the audience |

---

## 2. The four labels

| Label | Meaning |
|---|---|
| `<Subject N>` | Visible content abstracted from reference assets, reusable or modifiable in the target video |
| `<Picture N>` | A reference image used as a concrete target frame or shot-planning anchor |
| `<Video N>` | A reference video providing an editing source, a continuation start point, or whole-video temporal structure |
| `<Audio N>` | An audio signal that is copied or referenced |

Once a label is assigned, **it keeps the same meaning across all six sections**. Never redefine a label mid-prompt and never introduce a new one outside `subject_definitions`.

### `<Subject N>` — the workhorse

Reusable visible content: people, animals, objects, scenes, backgrounds, environments, clothing, props, interfaces, VFX, styles, actions, expressions, poses. It represents a **content unit used in the target video**, not the source file.

One subject may be defined by several assets, and one asset may provide several subjects:

```text
<Subject 1> is the young woman in <Picture 1>, with long dark hair, a blue cardigan, and a thin silver necklace.
<Subject 1> is the woman whose appearance comes from <Picture 1> and whose walking motion comes from <Video 1>.
```

### `<Picture N>` — only when the image is a frame

Give an image a standalone entry only when the image itself serves as a first frame, keyframe, last frame, edited keyframe, or composition anchor:

```text
<Picture 2> is the first frame of [Shot 1], showing a woman seated beside a café window.
<Picture 3> is a storyboard reference for [Shot 1] and [Shot 2], defining their viewpoint, subject placement, and shot order.
```

If an image only defines a character, scene, costume, or style, **do not create a picture entry** — cite the image inside the corresponding `<Subject N>` definition instead. This is the most common Ref2VA structuring error.

### `<Video N>` — whole-video relationships only

Reserved for editing an original video, continuing from the end of one, or referencing its camera movement, cuts, rhythm, or temporal structure:

```text
<Video 1> is the source video for the target video edit.
```

A person, object, scene, action, or effect reused from a reference video is still a `<Subject N>`. `<Video N>` identifies the asset or structural source; it does not replace subject labels.

### `<Audio N>` — copied or referenced sound

A standalone audio asset, or the synchronized track of a reference video. Uses: copying all or part of a signal, referencing a music style, referencing a speaker's timbre and delivery, reusing dialogue/lyrics/SFX, referencing beat, rhythm, or continuity.

When an `<Audio N>` corresponds to a target speaker, **reuse that speaker's global ID** — never assign a new one here:

```text
<Audio 1> is the voice-timbre reference for <Subject 1> (S1).
```

`<Video N>` and `<Audio N>` are numbered independently; the same source file can be `<Video 1>` and `<Audio 2>`. An ordinary reference video does **not** create an `<Audio N>` merely because the file contains sound — only create one when the audio has a role. Name the shared source only to remove provenance ambiguity:

```text
<Video 1> is the source video for the target video edit.
<Audio 2> is the synchronized audio track of <Video 1> and is reused in the target video.
```

---

## 3. `summary` — one paragraph, with a task-type prefix

One short English paragraph summarizing the target video and its reference relationships, opening with a square-bracketed task type:

| Task type | When |
|---|---|
| `keyframe completion` | An image serves as first frame, keyframe, last frame, edited keyframe, or another concrete frame anchor |
| `reference generation` | An image, video, or audio guides a character, scene, style, action, camera, storyboard — without being a concrete frame or the source being edited/continued |
| `video editing` | An existing source video is directly modified |
| `video continuation` | New content continues, extends, resumes, or transitions from an existing source video |
| `audio reuse` | The same audio signal is reused in full or in part |
| `audio reference` | Only music style, timbre, dialogue/lyric content, SFX texture, beat, or continuity is referenced |

Combine multiple relationships with ` + `, never repeating a type: `[video continuation + keyframe completion]`, `[video editing + audio reuse]`.

The mere presence of a video or audio file does not create a task type. A reference video providing only camera movement, cuts, or rhythm is `reference generation` — reserve `video editing` and `video continuation` for a video that is actually edited or continued. When editing a source video whose original audio stays audible, add `audio reuse`. When continuing without copying the signal, `audio reference` covers audio that merely continues the original's characteristics.

Use only already-defined labels here; introduce none. For editing tasks, begin right after the prefix with:

```text
The target video is an edited version of <Video 1>.
```

---

## 4. `retention_analysis` — one line per label

Fixed English relationship markers. Visible content (`<Subject N>`, `<Picture N>`, `<Video N>`):

| Marker | Meaning |
|---|---|
| `fully_preserved` | The referenced content's defined role is fully preserved |
| `partially_preserved` | Still used, but some defined characteristics change or are only partly retained |
| `attribute_transfer` | Referenced characteristics are transferred to a different identifiable target subject |
| `weak_reference` | Only broad similarity in style, category, composition, or atmosphere is retained |

```text
<Subject 1> (appears in [Shot 1], [Shot 3]): fully_preserved - ...
<Picture 2> ([Shot 1] first frame): fully_preserved - ...
<Video 1> (cut and pacing structure): weak_reference - ...
```

Audio (`<Audio N>`):

| Marker | Meaning |
|---|---|
| `fully_copy` | The complete source audio is the target video's complete final track |
| `partially_copy` | Only part of the timeline or selected layers are copied, or sounds are added/removed/replaced after copying |
| `reference` | Not copied — only timbre, rhythm, music style, dialogue content, or texture is referenced |
| `weak_reference` | Only broad similarity in category or atmosphere |

```text
<Audio 1>: fully_copy - <Audio 1> is reused 1:1 as the target video's complete final audio track.
<Audio 2>: reference - the target speaker follows <Audio 2>'s voice timbre and measured delivery without copying the original signal.
```

Pick a marker **within the role already defined** for that label. Newly added actions, backgrounds, or plot events in the target video are not losses of reference fidelity — don't downgrade a marker for them. Never write `(Sx)` in this section.

---

## 5. `detailed_description` — the body

### Differences from the base modes

| Dimension | T2VA | Ref2VA |
|---|---|---|
| Main field | `integrated_multimodal_description` | `detailed_description` |
| Style opening | Written after `[Shot 1]` | One or two sentences **before** `[Shot 1]` |
| Reference information | No labels | Insert `<Subject N>`, `<Picture N>`, `<Video N>`, `<Audio N>` at first appearance and wherever their roles apply |
| Audio relationships | Describes the video's own sound | Cites `<Audio N>` in the matching shot or audio phase, stating copied vs. referenced |

```text
The target video is in a cinematic, literary music-video style with soft lighting and a slightly desaturated color palette.
[Shot 1] The scene opens in a crowded urban street...
[Shot 2] At 00:09.000, the shot cuts to an extreme close-up...
```

### Density

Generation tasks: normally **350–500 English words**. Dialogue-dense content prioritizes fitting the complete spoken timeline over hitting a word count. Editing descriptions scale with the source video's complexity and don't have to follow that range. A single shot does not justify a shorter description — distribute detail by each shot's information load.

Make it explicit: per shot, establish current composition, subject appearance and position, environment and lighting, actions and state changes, camera movement, current sound, and the points where referenced content actually appears or takes effect. A plot summary or a list of reference relationships is a failed `detailed_description`.

### Using labels inside shots

At an important `<Subject N>`'s first clear appearance, describe its referenced characteristics, frame position, and current action — within what is actually visible. Reuse the same label later without redefining it. Natural phrasing for frame anchors:

```text
the shot begins from <Picture 1>
the shot's keyframe corresponds to <Picture 2>
the shot ends on <Picture 3>
```

### Speakers with references

When a referenced subject physically speaks, keep **both** the visual label and the speaker ID:

```text
<Subject 2> (S1) turns toward the woman and says, <d>[English] Last summer, I went to my grandfather's house. He talked about you.</d>
```

`<Subject N>` identifies the referenced subject; `(Sx)` identifies the actual speaker. Off-screen speech from the same subject keeps the form and is marked `off-screen`. A speaker not matching a defined subject gets a stable voice description followed by `(Sx)`.

When verbal content exists only as a cue inside directly reused BGM or a complete soundtrack — with no person, character, or narrator physically producing it — use `<Audio N>` as the audible source and **do not invent an `(Sx)`**:

```text
When <Audio 1> reaches the phrase <d>[English] I'm lonely lonely lonely lonely lonely I'm lonely</d>, <Subject 1> performs the corresponding hand gesture without becoming a separate speaker source.
```

Assign `(Sx)` once, in the order of actual vocal events in the target video, and reuse it at every vocal event. When only timbre, rhythm, emotion, or delivery is referenced, **do not carry the original dialogue** from the reference audio into the target video.

---

## 6. The two audio sections

Definitions are the same as the base modes (`OFFICIAL_SYNTAX.md`). What's specific to Ref2VA: state a copy or reference relationship **only in the section matching the audible layer** — ambience and SFX in `overall_soundscape`, audience-only score in `non_diegetic_music`. If one asset provides both, describe the relevant relationship in each:

```text
overall_soundscape: The copied ambience layer from <Audio 1> continues throughout the target video.
non_diegetic_music: <Audio 2> is directly reused as the complete audience-only score.
```

Complete dialogue and lyrics live only inside `<d>` in `detailed_description` — never repeated in these two sections.

---

## 7. Complete official example

```text
subject_definitions:
<Subject 1> is the coffee-shop environment in <Picture 1>, featuring an exposed brick wall, an orange tufted sofa with patterned pillows, a neon sign, and a wooden coffee table.
<Subject 2> is the fluffy white Samoyed in <Picture 2>, <Picture 3>, and <Picture 4>, with thick white fur, pointed ears, a dark nose, and a curved tail.
<Subject 3> is the young blonde woman in <Video 1>, with long blonde hair and a light-pink button-down shirt with rolled-up sleeves.
<Subject 4> is the young man in <Video 2>, with short wavy brown hair and a dark-grey hoodie with drawstrings.
<Audio 1> is the voice-timbre reference for <Subject 3> (S1), containing a spoken English vocal layer.

summary:
[reference generation + audio reference] The target video shows <Subject 3> eating a cookie in <Subject 1>. <Subject 4> enters with <Subject 2>, which lunges toward the cookie. The three-shot exchange uses <Audio 1> as the voice-timbre reference for <Subject 3> and ends with a canned audience laugh.

retention_analysis:
<Subject 1> (appears in [Shot 1], [Shot 2], [Shot 3]): fully_preserved - the exposed brick wall, orange tufted sofa, patterned pillows, neon sign, and wooden coffee table are retained.
<Subject 2> (appears in [Shot 1], [Shot 2]): fully_preserved - the Samoyed's thick white fur, pointed ears, dark nose, and curved tail are retained.
<Subject 3> (appears in [Shot 1], [Shot 2], [Shot 3]): fully_preserved - the blonde woman's identity, long hair, and light-pink shirt are retained.
<Subject 4> (appears in [Shot 1], [Shot 2]): fully_preserved - the young man's short wavy brown hair and dark-grey hoodie are retained.
<Audio 1>: reference - its vocal timbre guides the dialogue delivery of <Subject 3> without copying the original signal.

detailed_description:
The target video uses a realistic multi-camera sitcom style with warm indoor lighting.
[Shot 1] A medium shot establishes <Subject 1>, the coffee shop with its exposed brick wall, orange tufted sofa, patterned pillows, neon sign, and wooden coffee table. <Subject 3> (S1), the young woman with long blonde hair and a light-pink button-down shirt with rolled-up sleeves, sits on the sofa holding a chocolate-chip cookie. From the left, <Subject 4>, the young man with short wavy brown hair and a dark-grey hoodie with drawstrings, enters holding the leash of <Subject 2>, the thick-furred white Samoyed with pointed ears, a dark nose, and a curved tail. The dog lunges toward the cookie and pulls the leash taut. <Subject 3> (S1) jerks her hand back and, using the clear youthful voice timbre referenced from <Audio 1>, exclaims with light annoyance, <d>[English] Hey! Watch your dog!</d> She closes her lips and guards the cookie while <Subject 4> pulls the dog back.
[Shot 2] At 00:03.000, the shot cuts to a close-up of <Subject 4> (S2), the young man in the dark-grey hoodie from Shot 1, sitting beside <Subject 3> on the sofa and holding <Subject 2> securely in his arms. <Subject 4> (S2) says in a casual young male voice with a playful tone and an easy conversational pace, <d>[English] He just likes cookies more than me.</d> He closes his mouth into an apologetic smile and strokes the dog's thick white fur.
[Shot 3] At 00:05.000, the shot cuts to a close-up of <Subject 3> (S1), the blonde woman in the light-pink shirt from Shot 1. Her annoyance softens as she looks toward the Samoyed. <Subject 3> (S1) replies in the same clear youthful voice referenced from <Audio 1> with an amused cadence, <d>[English] Well, he has good taste at least.</d> She smiles and raises the cookie in a small toast-like gesture. A classic canned audience laugh begins immediately after the line and continues through the final frame.

overall_soundscape:
Soft indoor coffee-shop room tone continues throughout the scene.

non_diegetic_music:
N/A
```

---

## 8. Ref2VA checklist

- [ ] All six sections present, in order, with exact names
- [ ] Every label defined once in `subject_definitions`, reused consistently everywhere else
- [ ] No image given a `<Picture N>` entry when it only defines a character/scene/costume/style
- [ ] `summary` opens with a bracketed task type, combined with ` + ` where multiple apply, and introduces no new labels
- [ ] `retention_analysis` has one line per label, a valid marker, and no `(Sx)`
- [ ] Style declared in 1–2 sentences **before** `[Shot 1]`
- [ ] Every `(Sx)` assigned once by vocal-event order and reused; audio-only vocal cues use `<Audio N>` instead
- [ ] Audio copy/reference relationships stated in the section matching the audible layer
- [ ] No orphan labels — everything defined appears in the body
