---
name: thumbnail-titulo-otimizado
description: >
  Use this skill whenever the user needs to generate or decide on the final
  thumbnail and title of a video before publishing. Trigger on any request like
  "generate a thumbnail for this video", "create titles for this video", "which
  of these titles is better", "score this thumbnail", "improve this thumbnail",
  "I need the final title", or whenever a video is ready and the cover/name
  still needs to be decided before uploading. Uses the vidIQ thumbnail/title
  generation and scoring tools to close the loop generate → score → refine →
  only publish once the combination is good, instead of deciding by gut feel.
---

# Optimized Thumbnail and Title

You decide a video's cover and name using CTR data, not gut feel. The goal is to close the loop **generate → score → refine → publish**, never generating once and accepting the first result.

---

## Workflow

### 1. Title — generate and score

Call `vidiq_generate_titles` with the `videoId` (if it already exists on YouTube) or the video's `title`/`description`. Pass:
- `language` set to the video's language (e.g. `"en"`), unless the video is in another language.
- `type: "long"` or `"short"` depending on the format.
- `previousTitles`, if the user has recent titles from the channel, to avoid repeating a pattern.

The tool already returns a built-in score, but to compare variations written by the user (not just the generated ones), run `vidiq_score_title` one at a time. Never decide based on "I like this one better" without checking the score — but also don't just pick the highest number if it sounds like clickbait relative to what the video actually delivers.

### 2. Thumbnail — generate

Call `vidiq_generate_thumbnail`. Always pass `title` (the title already chosen in step 1 — thumbnail and title are read together by the viewer, not separately) and, when available, `subjectImage` (a photo of the person who should be the main face) and `referenceImages` (style-reference thumbnails to emulate, up to 10).

Always include the `imageUrl` returned in the response so the user can open/save it — the inline preview is not downloadable.

### 3. Thumbnail — score

Call `vidiq_score_thumbnail` with `videoId` + `title`, or by passing the generated image in `image` if the video isn't on YouTube yet. Read the score and the detailed feedback (strengths and areas to improve).

**Treat the score as an estimate, not a verdict** — don't regenerate just to bump the number up, and don't lead your response to the user with the raw number lacking context.

### 4. Iterate — one change at a time

If the score or feedback points to a specific problem, use `vidiq_refine_thumbnail` (don't regenerate from scratch): pass the current thumbnail in `sourceThumbnail` and describe **one concrete change** in `instructions` (e.g. "make the text bigger", "change the background to a stadium"). Passing `feedback` from `vidiq_score_thumbnail` into `vidiq_generate_thumbnail` is also valid when the adjustment is bigger than a single targeted refinement.

Iteration rule: one variable per round — either the text, or the background, or the facial expression, never several at once. Otherwise there's no way to know what actually improved CTR.

### 5. Stopping criteria

There's no "perfect" score — stop iterating when:
- The score is in a good range for the niche (there's no universal threshold; comparing against the score of reference videos from the same channel helps calibrate "good enough").
- Or after ~2-3 rounds of refinement with no gain — at that point the problem is probably the concept, not the fine-tuning, and it's worth going back to step 2 with a different creative direction.

---

## Critical rules

- Title and thumbnail are never evaluated in isolation — always generate/score the title first, it feeds in as context for everything else.
- Always return the `imageUrl` of any generated or refined thumbnail.
- Never make up a score — if the tool fails or doesn't return a rating, say so, don't estimate a number.
- Avoid refining more than 3 times in a row without checking whether the concept (not the detail) is the actual problem.
