# Directing native audio

This is H3's biggest differentiator over Seedance: audio (SFX, ambience, music, dialogue) is **generated natively alongside the video**, in stereo, on every generation — there is no off switch. Audio isn't an extra; it's a direction layer carrying the same weight as camera or action. A prompt that doesn't direct audio hands the decision to the model, and the result trends generic.

The format gives you exactly three places to put sound. Putting a sound in the wrong one is a format error, not a taste issue.

---

## 1. The three-layer split

| Layer | Where it goes | What belongs there |
|---|---|---|
| **Diegetic, synchronized** | Inside the body (`integrated_multimodal_description` / `detailed_description`) | Speech, singing, and any sound tied to a visual beat: the door slam, the glass breaking, the radio playing in the room |
| **Ambience** | `overall_soundscape` | Room tone, weather, traffic, footsteps, fabric, breathing, laughter — across the whole video |
| **Score** | `non_diegetic_music` | Music only the audience hears |

The test for the boundary between layers 1 and 3: **can a character in the scene hear it?** A radio, a TV, a phone, someone singing — the character hears it, so it is diegetic and belongs in the body, no matter how much it functions as score. Only music the characters cannot hear goes in `non_diegetic_music`.

The test between layers 1 and 2: **is it tied to a specific moment?** The glass breaking at 00:04.200 is a beat and belongs in the body next to the action. The generic clink of glassware throughout the bar is ambience.

---

## 2. Synchronized SFX — write them like a camera move

Specific and physical beats generic. "Footsteps" is weak; "muffled footsteps on carpet, hesitant" works. Anchor the sound to the exact action it accompanies, in the same sentence:

```text
Her heel strikes the metal step and the sound rings once through the stairwell as the camera tilts up.
```

Tying a sound to an exact moment of action is what anchors the model's timing. A sound named in isolation floats; a sound named as part of a beat lands on that beat.

---

## 3. `overall_soundscape` — the scene's "silence"

1–4 sentences, one paragraph, no dialogue. This layer defines what fills the gaps between actions:

```text
overall_soundscape: A misty forest ambience dominates, with steady wind through high branches and distant traffic barely perceptible underneath. Damp leaves shift underfoot between longer pauses.
```

It matters most in quiet, tense scenes: describing the "almost silence" — what still sounds when nothing is happening — stops the model from filling the gap with generic music. `N/A` is reserved for the user explicitly asking for total silence; it is not the way to ask for a quiet scene. A quiet scene is a *described* quiet.

Do not repeat dialogue, singing, or diegetic music here — they already live in the body.

---

## 4. `non_diegetic_music` — instrumentation and time, not genre

1–3 sentences. Naming a genre is not direction. Describe **instrumentation** and **dynamic development over time**, the way you'd write a shot list:

```text
non_diegetic_music: A low drone with tense pizzicato strings and cold synth pulses, joined by a quiet kick and sparse brushwork. The low end and hi-hat build through the first three seconds before a short baritone-sax phrase enters, ending on a held dissonant chord.
```

Two hard constraints from the official guide: **no abstract mood words**, and **no explaining the score's emotional function**. "Melancholy score conveying her isolation" is two errors in one phrase. Write what an orchestrator would play.

If the tone could slip into a neighboring genre, the fix inside the format is a positive restatement ("mysterious and cool, restrained throughout"), not a negative constraint — the format has no field for negatives. See the free-prose note in `SKILL.md` for when negatives are worth adding anyway.

`N/A` when there is no score — and choosing no score is a real direction choice worth making deliberately, since the model will otherwise supply one.

---

## 5. Dialogue

Dialogue is not an audio-section concern — it lives in the body with full speaker notation (`OFFICIAL_SYNTAX.md` §4): stable `(Sx)` IDs, delivery outside `<d>`, the literal line inside `<d>[Language] ...</d>`, punctuation verbatim.

Two rules that break audio most often when ignored:

- **Voice-over** requires the exact phrase `says in an off-screen voiceover`, immediately followed by the statement that the on-screen lips remain closed. Without it, the character mouths the narration.
- **Never repeat dialogue** in `overall_soundscape` or `non_diegetic_music`. Repeated lines produce doubled or echoed speech.

For cloning a voice from a reference audio, see `REFERENCE_ASSIGNMENT.md` §4. For replacing a line inside an existing video, see `EDITING_PATTERNS.md`.

---

## 6. Ref2VA: where reference audio relationships get stated

When audio comes from an `<Audio N>` reference, state the copy/reference relationship **in the section matching the audible layer** — ambience and SFX in `overall_soundscape`, audience-only score in `non_diegetic_music`. One asset providing both gets described in each:

```text
overall_soundscape: The copied ambience layer from <Audio 1> continues throughout the target video.
non_diegetic_music: <Audio 2> is directly reused as the complete audience-only score.
```

---

## Checklist

- [ ] Every sound placed in the layer matching whether a character can hear it and whether it's tied to a beat
- [ ] Synchronized SFX named alongside the action they accompany, not floating in a list
- [ ] `overall_soundscape` is 1–4 sentences, one paragraph, no dialogue
- [ ] `non_diegetic_music` has instrumentation and dynamics, no mood words, no emotional function
- [ ] `N/A` used only under its real conditions (explicit total silence / no score at all)
- [ ] Voice-over carries the exact phrase and the lips-closed clause
- [ ] (Ref2VA) audio relationships stated in the matching section
