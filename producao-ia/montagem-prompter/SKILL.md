---
name: montagem-prompter
description: >
  Use this skill whenever the user needs to decide how to assemble already-generated
  clips (Seedance, animated images, etc.) into one cohesive final video. Trigger on
  requests like "how do I put these clips together", "what cutting rhythm should I
  use", "what transition fits here", "build the edit sequence", "how do I sync this
  with the music", "what caption style for this video", or whenever the clips have
  already been generated and what's left is deciding the final edit before export.
  Bridges the gap that otherwise doesn't exist between "individual clip generated"
  and "video ready to post": cutting rhythm, transition type, sync point with the
  soundtrack, and burned-in caption style.
---

# Montagem Prompter (Edit Assembly Prompter)

You decide how already-generated clips come together into a cohesive video: cutting rhythm, transitions, sync with the soundtrack, and captions. This is the step between "clip ready" (output of `seedance-prompter`/`image-prompter`) and "publishable video" — an area with no dedicated support skill today.

---

## When to use it

After all the clips in a sequence have already been generated and approved (not during generation — that's the `seedance-prompter`'s job), and before exporting/publishing. If the soundtrack doesn't exist yet, generate it first with `trilha-sonora-prompter` — the cutting rhythm and the music's tempo need to match.

---

## Workflow

### 1. Cutting rhythm by content type

The right rhythm depends on what the block is doing, not a single fixed number for the whole video (same logic of segmenting by block function that `elevenlabs-voiceover` already uses for script/voice):

| Block type | Cutting rhythm | Why |
|---|---|---|
| Hook (first 2-3s) | Very fast cuts, 1-2s per clip | Grab attention before the viewer decides to leave |
| Context/explanation | Moderate cuts, 3-5s per clip | Give time to process information without dragging |
| High point/reveal | A single cut, longer shot, or a hard cut right on the beat | Let the moment breathe, don't chop up the climax |
| Tutorial/step-by-step | Cuts aligned to the action (one cut per completed step) | Rhythm dictated by the task, not a fixed time |
| CTA/closing | Moderate to slow cuts | Lower the energy, prepare the viewer for action |

### 2. Transitions

General rule: **a hard cut is the default**, an eye-catching transition (fade, wipe, zoom transition) is the exception and needs a reason. Only use a transition beyond a hard cut when:
- There's a scene/time change (fade or dissolve communicates the passage of time).
- It's a topic shift within the same video (a whip pan or quick zoom separates blocks).
- The soundtrack itself has a strong beat that calls for an effect synced to it.

Never stack more than one type of eye-catching transition in the same video without a reason — this is the visual analog of `elevenlabs-voiceover`'s "don't stack more than two emotional tags" rule: every extra style element dilutes the one before it.

### 3. Sync with the soundtrack

If a soundtrack already exists (via `trilha-sonora-prompter`), align the main cuts with the strongest musical beats — not every cut needs to land on the beat, but the block-transition cuts (hook→context, context→reveal) gain a lot of impact when they land exactly on the beat. If the soundtrack doesn't exist yet, share the cutting rhythm decided here with whoever will generate the music, so it's born already compatible.

### 4. Burned-in caption style

Decide this together with the cutting rhythm, not afterward:
- **Density**: how many words per screen — denser in context/tutorial content, sparser (1-3 words) in the hook and high point, so it doesn't compete with the image at the moment that most needs impact.
- **Timing**: caption appears on the cut or half a second after — appearing exactly on the cut reinforces the rhythm, a slight delay creates a more organic feel.
- **Visual emphasis**: a key word in the sentence can get emphasis (color, size) — use with the same restraint as `elevenlabs-voiceover`'s CAPS rule (1-2 words per sentence, not the whole sentence).

### 5. Deliver the edit decision

Delivery format — this isn't a technical EDL for a professional editor, it's a clear instruction for whoever will do the edit (the user themselves, or an editing tool):

```
## Edit: [video/sequence name]

**Clip order:** [numbered list]

**Cutting rhythm by block:**
- Hook: [duration/criteria]
- [remaining blocks]

**Transitions:** hard cut is default; exception at [where and why]

**Soundtrack sync:** block cuts aligned to [beat description]

**Captions:** [density, timing, emphasis]
```

---

## Critical rules

- Cutting rhythm is a per-block decision, never a single number for the whole video.
- A hard cut is the default — every eye-catching transition needs to justify why it isn't a hard cut.
- Decide captions and cutting rhythm together, never captions as an afterthought once the edit is already locked.
- If the soundtrack doesn't exist yet, generate it first (`trilha-sonora-prompter`) or at least define the target BPM before locking in the final cutting rhythm.
