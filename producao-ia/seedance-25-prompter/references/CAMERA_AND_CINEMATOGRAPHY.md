# Camera and Cinematography — Seedance 2.5

**Read this file to build the camera block and use cinematography terms with precision.**

---

## 1. Basic camera language (directly supported)

| Type | Commonly supported terms |
|---|---|
| Shot size | extreme wide shot, wide shot, medium shot, close-up, extreme close-up |
| Camera movement | push in, pull out, pan, lateral move, follow shot, orbit, dive, dolly out, tilt up, handheld shake |
| Position/viewpoint | low angle, overhead view, first-person view |

These terms can go directly in the prompt without needing to be translated into a "visible effect" — but if the term is unusual or has multiple interpretations, always declare who it applies to, how the image changes, and the expected visible result (see section 3).

---

## 2. Popular camera techniques

Can be used directly in the prompt. If the frame has multiple subjects, still declare which subject the camera follows/orbits and where the movement starts and ends.

| Technique | What to specify |
|---|---|
| One-take shot | The subjects, spaces, and events the continuous camera passes through, in order |
| Dolly zoom | The subject size to preserve and whether the background appears to approach or recede |
| Aerial view | Viewing height, movement direction, and environmental area to reveal |
| FPV | First-person flight/traversal path, speed, and turns |
| Bullet time | The action to freeze/slow down and the camera's orbit direction |
| Handheld camera | The subject being followed and the amount of shake |
| Bounce speed ramp | Where the action speeds up, slows down, or "bounces," and its final resting state |

---

## 3. Uncommon cinematography terms

For a niche term, one with inconsistent industry usage, or one the model might not recognize, keep the term and translate it into a directly observable visual change:

```
Cinematography Term + Target Subject + Visual Change + Foreground/Background Relationship + Direction or Speed
```

Example:
```
Rack focus: shift focus smoothly from the leaves in the foreground to the person in the background. The leaves gradually blur while the person's face changes from soft to sharp.
```

For a precise transition, also declare the trigger time, the occluding object, the camera direction, the transition method, and the composition/motion trend that should continue afterward.

### Quick-reference examples
```
Shallow-depth-of-field portrait: keep <Pastry Chef>'s eyes and face sharp while the glass jars and lights in the background become soft, circular bokeh.

Tracking shot: move horizontally at the same speed as <Skateboarder>, keeping the subject sharp while the roadside wall forms horizontal motion blur from right to left.

Golden hour: warm, low-angle sunlight enters from behind and to the left of <Hiker>, casting long shadows across the mountain ridge.

Natural vignette: darken the four corners gradually while keeping the brightness and skin tone of <Pianist> in the center natural, without a black border.

Whip-pan transition: at 5 seconds, move the camera rapidly to the left. Cut when the foreground bookshelf fully covers the frame, then continue moving left at a similar speed in the next scene.
```

Aperture, focal length, and shutter values can be included, but the intended visible result is usually clearer than an isolated numeric value alone.

---

## 4. Camera × Emotion

The model responds to camera as an emotional-state instruction, not just aesthetics. Use as a starting point (consistent with the logic already validated in the 2.0 skill):

| Character's emotion | Camera instruction |
|---|---|
| Anger / tension | handheld, jittery breathing rhythm, visible micro-tremors, irregular amplitude |
| Calm / control | smooth handheld breathing, barely perceptible micro-motion, steady rhythm |
| Sadness / vulnerability | slow, low-position handheld, slightly downward drift, heavy breathing pace |
| Shock / revelation | camera starts completely static — brief freeze — then imperceptibly slow push-in |
| Action / speed | smooth velocity-matched tracking, motion blur within shutter angle only |
| Climax / ending | top-shot, perfectly overhead, brief freeze frame, all movement ceases |

---

## 5. Cuts and transitions within a single clip

To describe a cut within the same prompt (not to be confused with a transition between two videos — that's `VIDEO_EXTENSION_AND_TRANSITIONS.md`):

```
[Transition Type Guide]: use a "[transition name]" at the cut point (prohibit hard cuts, prohibit objects appearing out of nowhere).
[Basic constraint requirement]: keep a sense of coordinated breathing/duration. Shot A shows [X], then naturally transitions to Shot B, where [Y].
[Cutting logic requirement]: reinforce the natural scene change; optionally describe the composition change (e.g. close-up shifts to medium shot).
```

You can also list options and let the model choose: *"Please choose the most suitable one according to the style of this film from the transition methods such as [natural shot switching/mask transition/ink transition/similar object transition]."*

See `VIDEO_EXTENSION_AND_TRANSITIONS.md` §Cuts for the full table of transition types (fade, stacking, whip pan, mask, similar object, etc.) with when to use each.

---

## 6. Anti-fail rules (inherited from 2.0, still valid)

- **Never use generic `zoom`** → always use a physical camera movement (`dolly`, `pull`, `push`, `track`).
- **Contradictory movements** → don't combine `static`/`fixed camera` with camera movement in the same clip.
- Always declare the lens/focal length when the prompt has an emotional close-up or detail insert — without it the model uses a generic focal length.
- **Shake vs. tremor** → `handheld breathing` (soft, intentional) ≠ `shaky cam` (chaotic); specify which one you want.
