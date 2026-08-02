# Why the visual choices work

The tables in `SKILL.md` (framing, camera, movement, lens, light) tell you what effect each choice produces. This file explains the logic behind them, for when a scene calls for something that isn't in any of the tables and you need to derive the right choice instead of hunting for a ready-made example.

## 1. Camera angle mimics real physical hierarchy

Looking up at someone is the experience of being in a lower position looking at someone in a position of power — something learned since childhood. That's why a low angle communicates power without needing any other element in the scene: the viewer recognizes the hierarchy from the camera's position, not from the content of the frame.

## 2. Negative space and framing mimic the subjective experience of emotion

Isolation feels like empty space around you; anxiety feels like a lack of space. That's why negative space communicates loneliness and tight framing communicates tension: the composition physically reproduces the sensation the emotion already causes in the body.

## 3. Shallow depth of field mimics human attention under intense emotion

In panic or ecstasy, attention filters out the surroundings and locks onto the central stimulus alone. A lens with heavy bokeh (85mm+) does the same thing to the frame: it isolates the subject from the background. That's why emotional close-ups call for a long, shallow lens, not just "getting close" to the scene.

## 4. Camera movement mimics the observer's body

Handheld communicates that someone is there, physically, taking the same risk as the scene. A smooth dolly communicates a calm, omniscient observer. An orbit communicates examination and contemplation of something (or someone) that deserves to be seen from every angle. The question for choosing the right movement isn't "what looks nice" — it's "who is holding this camera, and why."

## 5. Directional light mimics the real physics of the scene

Motivated light (coming from a visible or implied source in the scene) is accepted by the viewer without them noticing a "lighting effect." Unmotivated light reads as stylization. That's why "practical lights only" communicates raw realism: the viewer can't point to where the light is artificially coming from, so they accept the scene as real.

## 6. Symmetry communicates control because it breaks the world's natural asymmetry

The eye expects slight asymmetry — that's how the real world looks. Perfect symmetry reads as "someone is controlling this" even before any other information from the scene comes in. That's why Kubrick and Wes Anderson use symmetry to communicate obsession, artificiality, or institutional control, not neutral beauty.

## When the generated result doesn't match the shot breakdown

If the generated video (Seedance, Veo, Nano Banana, etc.) didn't reproduce the intent of the shot breakdown, the problem usually isn't in how the scene was read — it's in the breakdown → prompt translation. Before redoing the breakdown from scratch:

1. Check whether the handoff followed Section 7 of `SKILL.md` to the letter (emotion as micro-beats, not adjectives; movement in Seedance vocabulary, never `zoom`; constraints always positive).
2. Consult the `references/TROUBLESHOOTING.md` and `references/RETAKE_PROTOCOL.md` files of the `seedance-prompter` skill — that's where the diagnosis for why the generation came out wrong lives, not here.
