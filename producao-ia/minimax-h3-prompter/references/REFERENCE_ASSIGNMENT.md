# Assigning roles to references (Ref2VA)

Ref2VA accepts up to 9 images, 3 videos (2–15 s each), and 3 audios — 12 files total. H3's strength isn't *having* the references, it's **saying what each one is for**. Without that, the model guesses and blends roles (using the mood image as if it were the identity reference).

In the native format, role assignment isn't a stylistic choice — it's the `subject_definitions` + `retention_analysis` sections doing their job. This file is the recipe book for the common roles; `REF2VA_MODE.md` is the format itself.

Practical rule: any time you have 2+ reference assets, every one of them gets a defined label and a stated role before the body starts.

---

## 1. Identity lock (preserving identity)

When an image exists to lock who or what appears, define it as a `<Subject N>` with its concrete traits, then **do not re-describe in the body what the image already shows** — that creates an instruction competing with the reference.

```text
subject_definitions:
<Subject 1> is the woman in <Picture 1>, with a shoulder-length dark bob, a thin scar above the left eyebrow, and a grey wool coat with horn buttons.

retention_analysis:
<Subject 1> (appears in [Shot 1], [Shot 3]): fully_preserved - her face, hair length, scar, coat cut, and button detail are retained.
```

Note the division of labor: the traits list lives in `subject_definitions`, the body spends its words on what *moves*. When a character has to survive several beats, the combination of image reference plus a written trait list is more robust than either alone — the written traits are what the model falls back on when the frame no longer resembles the reference angle.

For a character recurring across a whole project, `biblia-personagem` produces exactly this trait list once, reusable in every generation.

---

## 2. Motion & camera transfer

A reference video can carry only the *motion* — camera, body, choreography — without dictating who appears. That is the difference between "using a video" and "using a motion reference".

```text
subject_definitions:
<Subject 1> is the dancer whose appearance comes from <Picture 1>.
<Video 1> provides the camera movement and cut rhythm of a street-dance performance.

retention_analysis:
<Video 1> (camera movement and pacing structure): weak_reference - only the handheld orbit and cut rhythm are followed.
```

Default split: **video = motion / camera rhythm / choreography. Image = who is on screen.** Never leave both roles ambiguous on the same reference video.

For motion transfer onto non-human subjects (recreating human choreography with animals), describe the original motion step by step in the body — the exact trajectory — in addition to citing the video. That preserves timing when the subject changes completely.

---

## 3. Style & edit matching

A reference video can dictate cut rhythm, transition language, and score without dictating visual content. It works as a mood board in motion — the closest H3 gets to "make it like that other video, but with these assets".

```text
<Video 1> provides the shot pacing, transition language, and white-cyclorama look of a fashion film.
```

In `retention_analysis` this is almost always `weak_reference` — you are keeping broad similarity in rhythm and atmosphere, not preserving content. Marking it `fully_preserved` overconstrains the model against the assets that *are* meant to change.

---

## 4. Voice cloning & transfer

A reference audio clones the voice. Bind it to the speaker's global ID in the definition and never assign a new ID for it:

```text
subject_definitions:
<Audio 1> is the voice-timbre reference for <Subject 1> (S1).

retention_analysis:
<Audio 1>: reference - the target speaker follows its timbre and measured delivery without copying the original signal.
```

`reference` (timbre only) and `fully_copy` / `partially_copy` (the actual signal reused) are different relationships — pick the one you mean. When only timbre is referenced, **do not carry the reference audio's original words** into the target video; write the new line in `<d>` as usual.

For replacing dialogue *inside* an existing video, see `EDITING_PATTERNS.md` — the pattern differs because lip-sync is involved.

---

## 5. Combined multi-asset (H3's strongest case)

Ref2VA mixes text + images + video + audio freely in a single generation. The more assets, the more critical the role mapping — and the more valuable `retention_analysis` becomes, since it forces you to state, label by label, what actually survives.

```text
<Picture 1>, <Picture 2>, <Picture 3>, and <Picture 4> are sequential storyboard references for [Shot 1] through [Shot 4], defining viewpoint, subject placement, and shot order.
```

When assets have very different roles (4 keyframe images + 1 pacing video + 1 score audio), the six-section format already separates them for you — resist collapsing them into a prose paragraph.

**Reference economy:** more references is not more control past the point where they start disagreeing. Two assets that contradict each other on the same attribute produce an average of both, not a choice between them. If you are near the limits (9 images / 3 videos / 3 audios), ask what each one is still contributing.

---

## Quick checklist before writing the Ref2VA prompt

- [ ] Does every image have a named role (identity / environment / object / keyframe / storyboard / brand mark)?
- [ ] Does every video have a named role (motion / camera / cut rhythm / source to edit)?
- [ ] Does every audio have a named role (voice to clone / score to match / signal to copy)?
- [ ] Is any part of the body re-describing what a reference image already shows?
- [ ] With video + image in the same character role, is it clear which dictates appearance and which dictates motion?
- [ ] Do two assets compete for the same attribute without a stated winner?
- [ ] Does every defined label appear in `retention_analysis` with a marker that matches its actual role?
