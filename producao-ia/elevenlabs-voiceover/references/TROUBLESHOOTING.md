# Troubleshooting: ElevenLabs Eleven v3

Recurring problems and the direct fix for each one.

## Sounds robotic despite the tags

- Usually it's missing punctuation and pause variation within the block, not just an emotional tag. Reread the passage looking for run-on sentences without `…`, commas, or line breaks.
- Confirm the tag is at the start of the passage it should carry, not dropped in the middle of a larger paragraph (see `MODEL_MECHANICS.md`, item 1).

## The tag seems ignored, or the wrong emotion shows up

- Most common cause: Stability is set to **Robust**. This mode is stable but practically ignores tags — switch to Natural or Creative (see the Stability table in `SKILL.md`).
- If Stability is already correct, the tag is probably too far from the text it should carry, or competing with more than one tag in the same passage. Split into two short blocks if you need two different emotions in sequence.

## Pause too long, dragging rhythm

- Too many `…` in the same passage, or too many blank lines separating small blocks. Cut it down to one pause per idea, not per sentence.

## Emphasis doesn't come through in CAPS

- More than 1-2 CAPS in the same sentence: the contrast disappears (see `MODEL_MECHANICS.md`, item 3). Reduce it.
- CAPS on a function word (article, preposition) instead of a content word (noun, number, technical name). Move the CAPS to the word that carries the impact.

## Number, acronym, or technical term mispronounced

- Spell out the number (`three`, not `3`) when pronunciation matters. ElevenLabs' automatic normalization is sometimes wrong, especially in multilingual text.
- Expand the acronym to its spoken form, unless it's a proper noun for a model/brand name (those stay as-is).
- If it still reads wrong, add punctuation or a hyphen to help the model segment the word.
- If it's a central keyword of the video, try CAPS to reinforce it.

## Want to adjust without regenerating everything

Change **one variable at a time** before generating again: one tag, the punctuation of a specific passage, or the Stability mode (Robust/Natural/Creative). Never change several at once, or you won't know what actually fixed it (the same discipline used when iterating on prompts for other AI generation tools).
