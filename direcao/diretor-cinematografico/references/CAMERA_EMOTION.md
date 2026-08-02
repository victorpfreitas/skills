# Camera–Emotion Sync

**The camera is the focal character's emotional double.** Camera movement, lens, and duration should be chosen based on the character's emotion — not on what looks "cinematic." Anger gets nervous handheld. Calm gets smooth breathing. Shock freezes. This is the most commonly broken rule in AI video — correct it explicitly in every prompt.

---

## 0. Dynamic Register — how hot the camera runs

The emotion map in §1 answers *which kind* of camera behavior a moment calls for. Dynamic Register answers a second, independent question: **how much energy does the whole scene carry, moment to moment?** Decide this first — it sets the ceiling for every other camera choice in the scene (cut rate, how far the frame tilts, how long anything holds still).

Skipping this step is why AI video often reads as "medium-energy everywhere" — a quiet scene with too much motion, or an action beat that never commits to being violent. Naming the tier out loud fixes that before a single shot is written.

| Tier | Name | Camera | Cant (Dutch tilt) | Cuts per scene | Frame stillness |
|---|---|---|---|---|---|
| **1** | Composed | Locked-off, or an extremely slow push/pull | 0° | 1–2 shots for the whole scene, or a single continuous take | Long held frames — stillness *is* the subject |
| **2** | Elevated | Gentle handheld breathing, or slow deliberate dolly/crane | 3–10° | 3–5 shots, 2.5–4s each | Frames settle and hold before the next cut |
| **3** | Kinetic | Heavy handheld — tracking, orbiting, pushing, operator weight readable | 12–25° | 4–6 shots, 1.5–2.5s each | Every frame is mid-move, but the eye can still land |
| **4** | Violent | Punching in, ripping back, whip pans, hard surges | 25–45° | 4–6 shots, 1.5–2s each, plus internal surges within a shot | Nothing settles — the frame never lands |

**How to pick the tier — read the scene, don't ask by default:**

- **Toward Tier 1–2:** grief, memory, waiting, ritual, a quiet morning, solitude, a landscape, dialogue that matters, an object being handled carefully, a room before anyone arrives
- **Toward Tier 3–4:** a beat drop, choreography, a chase, a fight, a crowd, a reveal, a crash, a named BPM, "hype," "chaotic," "go crazy"

Only ask the user when the scene genuinely supports two tiers (a character walking into a room could be Tier 1 dread or Tier 4 arrival) — and when you do, offer the two that actually fit, not all four: *"reading this two ways — quiet and held, or hot and punching?"*

**Register can be split deliberately.** A calm subject inside a violent camera (Tier 1 subject, Tier 4 camera) is a real, powerful choice — a character moving slowly while the world tears around them. When the user wants that split, state it explicitly in the prompt so the model doesn't average the two into a mush: name the subject's stillness and the camera's violence as two separate, simultaneous facts.

**Why this matters for Seedance specifically:** the duration rule in `seedance-prompter/references/CAMERA_LANGUAGE.md` and `seedance-25-prompter/references/CAMERA_AND_CINEMATOGRAPHY.md` (short precise clips beat one long weak one) is easier to apply correctly once the tier is named — a Tier 1 scene wants fewer, longer clips; a Tier 4 scene wants more, shorter ones. Carry the tier into the handoff (§7) as part of the `camera:` block.

---

## 1. Movement × emotion map

| Focal character's emotion | Camera type | How to write it in the prompt (EN) |
|---|---|---|
| **Anger / tension / at the edge** | Handheld breathing, **jittery, unstable** — broken breath rhythm, visible vertical/horizontal twitches | `CAMERA: HANDHELD. Nervous breathing jitter — irregular vertical/horizontal micro-shakes. NO stabilizer.` |
| **Calm / control / confidence** | Handheld breathing, **smooth** — steady breath, regular micro-amplitude | `CAMERA: HANDHELD. Smooth, controlled breathing motion — barely perceptible regular micro-drift. NO stabilizer.` |
| **Sadness / vulnerability** | Handheld, **slow, low** — lower breath frequency, slight downward drift | `CAMERA: LOW HANDHELD. Slow breathing rhythm, gentle downward drift. Weighted, heavy quality.` |
| **Shock / revelation** | Static + slow push-in or pull-out — freeze at the start, then very slow movement | `CAMERA: STATIC. Holds completely still for 0.5 sec — then extremely slow push-in. Total movement under 15cm.` |
| **Action** | 60fps, 180° shutter — clear movement, motion blur within the shutter range | `CAMERA: 60fps, 180° shutter. Clean motion blur, no ghosting beyond shutter range.` |
| **Final beat / verdict** | Top-shot freeze 0.3–0.5 sec — directly overhead, time freezes | `CAMERA: STRICT TOP SHOT. 0.3–0.5 sec freeze frame. All subjects frozen. Time stops.` |

---

## 2. Emotional arcs within a single shot

If the emotion **changes** over the course of a continuous take (e.g. character moves from anger → control), the camera changes in sync. Write it as explicit phases, tied to the actor's numbered beats:

```
CAMERA — beats ①②: nervous handheld, jittery irregular breathing shake.

CAMERA — beats ③④: handheld gradually stabilizes — amplitude shrinks, rhythm regularizes.

CAMERA — beats ⑤⑥⑦: smooth controlled breathing only — barely visible micro-drift.
```

Each camera phase should correspond to a numbered performance beat (① ② ③...) so the model knows exactly when to transition.

---

## 3. Lens selection

| Use | Lens | Aperture |
|---|---|---|
| Extreme emotional close-up (forehead to chin fills the frame) | **85mm** or **100mm** | F1.4 |
| Dialogue mid-shot, two-shot | **50mm** | F2.0 – F2.8 |
| Wide / establishing | **35mm** | F4 – F5.6 |
| Insert / object detail | **50mm** or **85mm** with focus locked on the object | F1.4 |
| Macro (pores, drops, fabric) | **45mm macro** | F2.8 |

**Forbid optical distortion** in every prompt that uses a wide or fast lens:
```
No barrel distortion, no pincushion distortion, no fisheye effect, no wide-angle warping.
Straight lines must be straight. Frame geometry must be clean.
```

**Bokeh / shallow DOF** for emotional inserts — use F1.4 and lock the focus:
```
⚠️ Focus plane strictly locked on [object/character] — NO focus drift, NO rack focus, NO autofocus jump.
```

---

## 4. Dolly / track moves

For very slow dolly moves (insert / object close-up), specify the **exact distance and time**:
```
Total camera movement across the entire Xs: approximately 10–15cm only.
Speed slow enough to be barely perceptible. NO zoom. NO sudden push or pull.
```

Never write `zoom`. Always write a physical camera movement (`dolly`, `track`, `crane`, `push-in`, `pull-out`).

---

## 5. Shot duration rules

| Shot type | Duration |
|---|---|
| Flash establishing (split-second wide) | **0.3 – 0.5 sec** (a fraction of a second, NOT 1 second) |
| One line of dialogue, average duration | **3 – 7 sec** |
| Wordless reaction (with an emotional arc) | **5 – 10 sec** |
| Insert / wide / freeze | **0.3 – 2 sec** |
| Emotional close-up with a full arc (5–7 beats) | **8 – 15 sec** |

---

## 6. Copy-paste templates

### 6.1 — Extreme tight dialogue close-up (85mm, F1.4)

```
LENS: 85mm (or 100mm) telephoto. F1.4 shallow DOF.
FRAMING: Strict extreme tight close-up — forehead to chin fills the frame.
⚠️ CAMERA: HANDHELD. Full breathing drift throughout — real-photographer heartbeat feeling.
Camera actively follows character's face — any subtle turn, lift, or drop, camera micro-adjusts to reframe.
BACKGROUND: Completely defocused into soft color blobs and bokeh highlights.
```

### 6.2 — Object insert (locked focus)

```
LENS: 50mm or 85mm prime. F1.4 shallow DOF.
⚠️ FOCUS: Locked on [object] from frame 1 to last frame — NO drift, NO rack focus, NO autofocus jump.
Only [object] is sharp. Everything else: heavy bokeh, blurred color blobs.
CAMERA: [angle]. Extremely slow dolly [direction] — total movement ~10–15cm across entire Xs. NO zoom.
```

### 6.3 — Wide / establishing flash (split-second)

```
LENS: 35mm wide. Wide shot / establishing shot.
⚠️ DURATION: Strictly 0.3–0.5 seconds — split-second spatial flash only, not a full composition hold.
[Positions of all key elements in frame.]
ACTION: [moment] — then immediate hard cut to next shot. No transition, no fade, no hold.
```

### 6.4 — Final top-shot freeze

```
CAMERA: Strict top-shot, directly overhead.
0.3–0.5 sec freeze frame. All subjects frozen. Time stops.
```

---

## 7. Forbidden movements

- `NO zoom` — physical camera movement only
- `NO stabilizer` when handheld — breathing should be visible
- `NO shake besides intentional handheld breathing`
- `NO over-movement` — if the scene is intimate, the camera is intimate
