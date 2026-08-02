# Retake Protocol — Seedance 2.5

`TROUBLESHOOTING.md` says what to fix when something goes wrong. This file is about how to decide the next attempt when the result is neither perfect nor garbage — the most common case in real production.

---

## 1. Triage verdicts

For each take, choose one:

- **Keep.** The scene/stage's main goal was achieved, nothing fatal left over.
- **Fix in post.** The problem is color, text, sound, or cut — resolve it outside the model.
- **Edit without regenerating.** Use the **Video Editing** workflow (`VIDEO_EDITING.md`) instead of regenerating from scratch — 2.5 was designed exactly for this case: good composition, only one element (object, background, audio) needs to change.
- **Extend instead of regenerating everything.** If only the end (or start) of the scene is wrong and the rest is good, use **Video Extension** (`VIDEO_EXTENSION_AND_TRANSITIONS.md`) starting from the last good frame, instead of discarding the whole take.
- **Re-roll.** Same prompt, new seed. Use when the problem looks like sampling variance, not a structural prompt error.
- **Rewrite.** The same failure repeats across different takes. The problem is in the prompt, not in generation luck. Go back to `MODEL_MECHANICS.md` and `TROUBLESHOOTING.md` to diagnose before trying again.

**Difference relative to 2.0:** in 2.0 there was no way to edit or extend an already-generated take — the only options were re-roll or rewriting from scratch. In 2.5, before discarding an imperfect take, ask yourself whether **Video Editing** or **Video Extension** solves the specific problem without losing what already worked.

---

## 2. One-variable-per-retake rule

Change one thing at a time: one prompt clause, OR the seed, OR the workflow (T2V/R2V/Editing/Extension), OR one reference. Never several at once. Changing everything together removes any way of knowing what fixed (or worsened) the result.

---

## 3. Attempt budget

Decide how many attempts make sense before starting (reference: 3–5 takes per clip/stage; rises to 6–10 attempts if operating above the recommended reference ranges — see `PARAMETERS_AND_LIMITS.md` §1). If you pass the halfway point of the budget without progress on the same failure, stop repeating the same strategy. Switch approach: a different workflow, break the scene into smaller stages, or rewrite the prompt from scratch instead of a fifth re-roll.

Two identical failures in consecutive takes is already a signal to rewrite, not to try a third re-roll.

---

## 4. Retakes in long/multi-stage video

When a 30–180s video fails at a specific stage:
- Don't rewrite the whole video. Isolate which stage broke and adjust only that stage's `Primary event`/`End state`.
- If the problem is identity drift between stages, first confirm that the `[Maintain Consistency]` block is present and specific enough — this is usually the point of failure before it's sampling variance.
- Consider generating the problematic stage as a separate clip (T2V/R2V) and then using **Video Extension** to connect it, instead of regenerating the full 180s.
