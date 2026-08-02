# Why the Rules Work — Seedance 2.5

The rules in `SKILL.md` and the other reference files say what to do. This file explains why, for when a case isn't covered by the examples and you need to derive the solution instead of copying a ready-made pattern.

---

## 1. Why negative prompts started working (change relative to 2.0)

In 2.0, the model treated negation as weak grammar wrapped around a strong activation — "no blood" would still evoke the concept of blood. 2.5 was specifically optimized to fix this: one of the official release items is "🔇 remove irrelevant subtitles and BGM" — a direct optimization for negative-prompt responsiveness, driven by 2.0 user feedback about unwanted subtitles and music appearing without being requested.

This doesn't mean negation became stronger than positive description — the production formula is still positive first, negative as reinforcement at the end (`[Negative Prompts]`). But now the negative block has a real effect, which is why every official 2.5 example includes one.

## 2. Why explicit reference mapping matters more in 2.5

With up to 50 possible materials (vs. 9 images/3 videos in 2.0), the chance of ambiguity grows proportionally with the number of references. Without mapping (`<Character A> corresponds to @Image 1`), the model has to infer which image represents which character — and the more materials there are, the more chances of a wrong inference, identity mixing ("twins"), or face swapping. Mapping isn't bureaucracy — it's the only way the model knows what each reference applies to when there are many references at once.

## 3. Why "sole editing master" exists

Editing an existing video is fundamentally different from generating from scratch: the model needs to know that most of the content (characters, scene, camera, audio, event order) **must not change**, and only a specific part should. Without declaring @Video 1 as the sole authority, the model treats the edit as a new generation influenced by the video — not as a surgical edit. That's why "sole editing master" always comes paired with `[Edit Scope]` (what changes) and `[Content to Preserve]` (what doesn't change) — the two halves of the same instruction.

## 4. Why the boundary frame comes before the new content in extension

Video extension is generation conditioned on the connection point. If you describe the new content first and only mention continuity afterward, the model has already allocated attention to the new content before knowing it needs to anchor to the exact state of the boundary frame — and the continuity instruction (pose, light, position) ends up weaker. Describing the boundary first ensures it's treated as a hard constraint, not a footnote.

## 5. Why stages need an "end state" each

Each frame generated from the previous one inherits and amplifies small errors from the source frame — this principle hasn't changed from 2.0 to 2.5. The difference is that now, with videos up to 180s, accumulated error without checkpoints would be catastrophic. A declared "end state" per stage works as a verifiable checkpoint: the model knows exactly where the scene needs to be by the end of each block, which reduces accumulated drift over a long video.

## 6. Why "per-scene selection" exists instead of using everything at once

With up to 50 materials, forcing all of them to appear simultaneously overloads any individual scene — there's no visual/temporal room for 10 characters and 8 props in the same shot. 2.5's multi-reference logic assumes the material set is an **available cast**, not a mandatory cast for every scene. Declaring "Use: X, Y, Z" per scene is what lets the model correctly ignore the rest of the cast at that moment.

## 7. Why automatic aspect-ratio/duration locks exist

Video editing, first/last-frame, and video extension all start from already-existing physical material (a real video, a real image). Leaving aspect ratio free in these cases would force the model to choose between respecting the input material's geometry or obeying a conflicting parameter — the platform resolves this ambiguity by automatically locking the parameter to the source, which is why trying to configure it via prompt or API in these workflows has no effect.

## 8. Principles inherited from 2.0 that still hold

- **Attention is finite**: the first words of the prompt dominate the influence on the result.
- **Detail in a region scales with the space it occupies in the frame**: micro-expression and facial reaction call for tight framing.
- **Audio and video are born from the same process**: naming sound with precision anchors timing just as much as visual description does.
- **Reference outweighs text**: describing in words what the reference itself already shows creates a competing instruction, not reinforcement — declare the reference's role, not the content it already displays.
