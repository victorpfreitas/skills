# Troubleshooting — Seedance 2.5

Recurring problems and the direct fix for each one. Check this before rewriting the prompt from scratch when the result comes out weak.

---

## Prompt ignores references or mixes up characters ("twins")

- Confirm each character/prop/scene has an explicit individual mapping (`<Character A> corresponds to @Image 1`) — never "@Images 1-4 define four characters".
- Add the line `Do not interchange the characters' appearances, clothing, actions, positions, or dialogue.`
- Above 5 subjects in reference images, prefer one view per image instead of a multi-view collage in a single image (see `PARAMETERS_AND_LIMITS.md` §1).

## Long/multi-stage video loses consistency between stages

- Confirm the `[Maintain Consistency]` block is present at the end.
- Confirm each stage has only **one** primary state change — overloaded stages tend to compress or skip events.
- Re-read the previous stage's `end state` before writing the next one — anchor on what was defined, not on the original script's intent.

## Timestamps don't match what was requested

- Remember: time ranges are a budget, not an exact cut — differences of a few tenths of a second are expected.
- A range with too much content causes excessive cutting or omitted events — reduce what each range needs to cover.
- Don't request frequencies within a range (e.g. "three actions in one second") — the model doesn't treat timestamps as a counting metric.

## Video Editing doesn't preserve the rest of the video

- Confirm `[Source Video Role]` is declared with @Video 1 as "sole editing master".
- Confirm `[Content to Preserve]` explicitly lists what can't change — without that list the model has more freedom than expected.
- Remember that aspect ratio and duration are automatically locked in this workflow — trying to configure them via the prompt won't help.

## Video Extension breaks continuity at the boundary point

- Confirm the boundary-frame description comes **before** the description of the new content, not after.
- Backward extension: confirm materials that should only appear after the source video are marked as such.
- Remember that boundary frames connect naturally, not pixel-by-pixel — small variations at the connection point are expected.

## Seamless Transition doesn't connect the two videos well

- Confirm `@Video 1`/`@Video 2` have a declared "before"/"after" role.
- Confirm the trigger action, the camera movement during the transition, and the arrival state in `@Video 2` are all described — omitting any of them leaves the bridge ambiguous.
- Don't promise pixel-identical preservation of the two videos — the goal is visual/sound continuity, not an identical cut.

## Blockout produces a rigid result or misreads the structure

- Confirm you identified coarse vs fine before writing — the two call for different prompts.
- Coarse: avoid arms/wings/appendages in the geometry unless the action sequence is complete.
- Fine: confirm the material is clean — leftover path lines, coordinate axes, and camera frustums confuse the model.

## Negative prompts don't seem to work

- Confirm the `[Negative Prompts]` block is kept separate at the end of the prompt, not mixed into the positive description.
- Be specific to the scene's actual risk, not a generic list — a generic negative prompt tends to be less effective than one targeted at what the scene actually risks getting wrong.

## Prompt exceeds the recommended material/duration limit

- Review `PARAMETERS_AND_LIMITS.md` — 30 images / 10 videos (≤30s total) / 10 audio clips (≤30s total) / 50 materials total.
- Above the recommended ranges (1-8 subjects in images, 1-5 in audio/video), expect lower stability and possibly more attempts needed ("gacha").

## Generic audio, unwanted music, or subtitles appearing unrequested

- Use the `[Negative Prompts]` block explicitly: `No subtitles, no background music.` — 2.5 responds much better to this instruction than 2.0.
- To remove music while keeping voice in an already-existing video, use the audio-editing workflow (`VIDEO_EDITING.md` §5), not regeneration from scratch.

---

## Known 2.5 limitations (not bugs, this is the model's current ceiling)

- Timestamps allocate time for events; they aren't precise, frame-by-frame edit points.
- Video-editing prompts increase the probability that critical events will align with the source video, but they don't guarantee frame-by-frame overlap.
- For subtitles, formulas, signage, or product specs that need to be 100% exact, combine prepared references + video generation + post-production — don't rely on the prompt alone.
- Video editing locks the input video's aspect ratio and approximate duration; a difference of up to ~0.3s is expected.
- First/last-frame locks the aspect ratio to the first image; duration is configurable.
- Video extension locks the source video's aspect ratio; the extended segment's audio volume may differ slightly from the original.
- One-click video: if image order or character mapping matters, declare it explicitly — the model may rearrange things on its own if not told otherwise.
- Seamless transitions aim for visual/sound continuity, not pixel-identical preservation of the two source videos.
