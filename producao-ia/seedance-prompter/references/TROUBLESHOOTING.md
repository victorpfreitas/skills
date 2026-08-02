# Troubleshooting: Seedance 2.0

Recurring real-production problems and the direct fix for each. Check this before rewriting the prompt from scratch when a result comes out weak.

## Face distorting or deforming

- Add `razor-sharp facial geometry, no morphing` to the constraints block.
- If the clip has a microexpression (face changing expression), reduce the duration to 4-5s. Faces deform more in longer clips with heavy expression change.

## Camera not moving even though movement was requested

- Confirm `fixed_camera: false` in `params`.
- Put the camera movement right at the start of the `camera:` block, not in the middle of the action description.

## Identity drift between clips in a sequence

- Symptom: the character subtly changes face, clothing, or proportions from one clip to the next in the same scene.
- Anchor the next clip's description in the actual state of the previous approved clip (see "Continuity between clips" in `SKILL.md`), not the original intent.
- In R2V, repeat the same reference tag (`@Image1`) in every clip that needs to keep the same identity.

## Physics or proportions breaking in action/VFX scenes

- Add `anatomically accurate proportions throughout` at the end of the prompt.
- Break the action into timestamps (Type B or C) instead of describing everything in one block. The model loses physical consistency in long clips without explicit timestamps.

## I2V contradicting the reference image

- Re-read the image before writing: gender, clothing, setting, and object need to match what's already in the image.
- Never describe something the image already contradicts (e.g., image shows a man, prompt describes a woman).

## Prompt ignored or partially followed

- Confirm there are no negative constraints (`no`, `not`, `without`). Seedance ignores negation — describe what you want in the positive.
- Confirm the most important words are at the start of the prompt, not buried in the middle of a long sentence.

## Generic or missing audio

- Generic SFX (`ambient sound`) tend to come out weak. Replace with SFX specific to what's in the scene (`water roar`, `metallic ring`, `ground explosion`).
- Confirm `audio.music: none` is declared. Without it, the model sometimes injects an unrequested score.
