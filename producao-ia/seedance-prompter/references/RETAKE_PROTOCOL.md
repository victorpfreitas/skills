# Retake protocol

`TROUBLESHOOTING.md` covers what to fix when something goes wrong. This file is about how to decide the next attempt when the result is neither perfect nor garbage, which is the most common case in real production.

## 1. Triage verdicts

For each take, pick one:

- **Keep.** The scene's main goal was hit, nothing fatal left over.
- **Fix in post.** The problem is color, text, sound, or cut — solve it outside the model.
- **Edit without regenerating.** The composition is good, only one element needs to change (use conversational editing patterns, when the model supports them).
- **Re-roll.** Same prompt, new seed. Use when the problem looks like sampling variance, not a structural prompt error.
- **Rewrite.** The same failure repeats across different takes. The problem is in the prompt, not in generation luck. Go back to `MODEL_MECHANICS.md` and `TROUBLESHOOTING.md` to diagnose before trying again.

## 2. One-variable-per-retake rule

Change one thing at a time: one prompt clause, OR the seed, OR the mode (T2V/I2V/R2V), OR one reference. Never several at once. Changing everything together removes any way of knowing what fixed (or worsened) the result.

## 3. Attempt budget

Decide how many attempts make sense before you start (reference: 3 to 5 takes per clip). If you're past half the budget with no progress on the same failure, stop repeating the same strategy. Switch approach: a different generation mode, break the scene into smaller clips, or rewrite the prompt from scratch instead of a fifth re-roll.

Two identical failures in consecutive takes is already a signal to rewrite, not to try a third re-roll.
