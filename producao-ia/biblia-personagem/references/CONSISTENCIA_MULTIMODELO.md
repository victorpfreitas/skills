# Consistency Across Models

A character usually needs to appear in more than one model — reference image in one model, production in another, video animated from the image. The problem: **every model cites a character reference image differently**, and mixing one model's syntax with another is a common cause of drift. This is already a note in `image-prompter`; here it's applied specifically to the recurring-character case.

---

## Reference convention by model

| Model | How it cites the character's reference image |
|---|---|
| **Nano Banana 2** | Natural description ("Reference 1", "the character in the first image") — accepts up to 5 characters + 14 objects per prompt. |
| **Seedream 5.0 Pro** | Reference **by content description** ("the character in the black suit"), never by numeric index — up to 10 references. |
| **GPT Image 2** | Natural description, similar to Nano Banana — up to 16 references, good character transfer across batch edits. |
| **Seedance 2.0** (video) | Explicit tags `@Image1`, `@Image2`... — when the user uploads images in sequence, each one becomes a numbered tag used in the video prompt (R2V mode). |

Never write `@Image1` in a Nano Banana/Seedream/GPT Image 2 prompt — that syntax is exclusive to Seedance. And never ask for "reference 1" in a Seedream prompt — it needs the content description, not an index.

## The CHARACTER BLOCK is what stays the same

The part that carries across every model unchanged is the **CHARACTER BLOCK** itself (see `CHARACTER_BLOCK_TEMPLATE.md`) — the fixed character description. What changes between models is only **how the reference image is cited** alongside that block. Recommended flow:

1. Generate the character's official reference image once (usually in Nano Banana, for iteration speed).
2. When generating in another image model (Seedream, GPT Image 2), include the full CHARACTER BLOCK + cite the reference in that specific model's syntax.
3. When animating in Seedance, upload the approved reference image, treat it as `@Image1`, and still include the CHARACTER BLOCK in the video prompt — the image tag helps the model anchor visually, but the text block is still what declares the non-negotiable traits that the image alone might not make clear from every angle/movement.

## Continuity across video clips (Seedance)

When the character appears across several consecutive clips of a sequence, anchor the next clip on what **actually** ended up in the previous approved clip (the final frame, the pose, the outfit's state), not on the original CHARACTER BLOCK intent alone — the same continuity rule `seedance-prompter` already applies to sequential clips, except here the "observed state" is specifically the character's (check whether an accessory shifted, whether the previous clip's final pose matches the next one's starting pose).

## Most common mistake: applying one model's rule to another

If a character prompt comes out looking wrong, the first diagnosis is: does the reference syntax used match the target model's convention? A prompt written with Nano Banana in mind (reference by loose description) pasted unchanged into a Seedream prompt frequently fails because Seedream requires the reference to be described by specific content, not generically.
