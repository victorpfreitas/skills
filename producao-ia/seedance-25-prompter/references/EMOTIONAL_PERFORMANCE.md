# Emotional Direction and Observable Performance — Seedance 2.5

**Read this file to direct character acting — how to convert abstract emotion into something the model can actually render.**

---

## 1. Core principle

Emotion words like "tense," "warm," "oppressive" communicate a general direction, but leave the performance too open to interpretation. For stable performance control, add directly visible or audible cues: eye movement, brow tension, mouth movement, breathing, gaze direction, hand movement.

You don't need to list every facial detail. For a single emotional transition, 2–4 clear cues are enough. Use event-triggered stages only when the emotion changes multiple times.

---

## 2. Single emotional transition — standard structure

```
The overall emotion shifts from <starting emotion> to <ending emotion>.
After <triggering event>, <subject> first shows <immediate observable reaction>.
Then, <eyes, brows, mouth, breathing, gaze, or hand movement> gradually <changes>.
Finally, <subject> expresses <target emotion> through <restrained or explicit outward behavior>.
```

---

## 3. Multi-stage emotion — progression through trigger events

Use when the emotion changes multiple times over the course of the clip/stage:

```
When <subject> hears or sees <first triggering event>, <first observable reaction>.
When <second triggering event> occurs, <change in expression, gaze, or breathing>.
After confirming <critical information>, the emotion that <subject> tries to restrain or conceal gradually becomes visible through <observable behavior>.
Finally, <subject's final action, expression, or manner of speaking>.
```

### Official example
```
Applause marking the end of the performance comes from behind the stage. The young actor's fingers suddenly stop on the program, the gaze turns slowly toward the curtain, and the shoulders remain tense.

After confirming that the curtain call is over, the actor exhales softly. The shoulders gradually relax, a restrained smile appears, and the eyes slowly well with tears, but the actor never turns to leave.
```

---

## 4. Micro-expression catalog (inherited and still valid in 2.5)

Always write in English, always specify the muscle/region.

```
Tension / controlled anger: jaw tightens visibly, teeth nearly clenched, nostrils flare on exhale, eyes narrow 10 degrees
Recognition: eyes widen 15%, pupils dilate slightly, brows lift asymmetrically — left higher than right
Suppressed sadness: lower lip barely suppressed, chin muscle tightens, eyes fill without blinking, gaze drops slightly
Shock / freeze: face goes completely still — all micro-movement ceases — brief total freeze before any reaction begins
Relief: shoulders drop, jaw unclenches, exhale visible through slightly parted lips, eyes soften
Distrust: head tilts 5 degrees, one eyebrow lowers while the other stays level, lips press together
Determination: chin drops slightly, eyes fix on target without blinking, jaw set, exhale through nose only
Concealed fear: rapid swallow, throat moves visibly, eyes hold steady but blink rate increases
```

---

## 5. Real production example (30s, single sustained transition)

From the official guide — shows how to extend a single emotional transition across a 29s video using stages with trigger + observable reaction, without repeating the same emotional note:

```
Stage 1 (0-3s) [Questioning]: direct gaze, no tears yet, brows slightly furrowed, whispers softly.
Stage 2 (3-10s) [Resignation]: gaze shifts away, eyelids droop, brief smile that instantly fades, one controlled breath.
Stage 3 (11-17s) [Remembering]: camera pushes in, gaze slowly scans the other person's face, eye rims reddish but tears held back, jaw tightens.
Stage 4 (18-23s) [Regret]: eyes lower, first tear falls without warning, brows slowly relax, faint head shake.
Stage 5 (24-29s) [Letting Go]: extreme close-up, gentle smile forms, second tear slides, restrained trembling voice line, smile freezes on face.
```

Each stage changes **one** observable axis at a time (gaze → breathing/smile → tear → relief) — don't stack several physical changes in the same stage.

---

## 6. How to combine with Negative Prompts

Restrained performance especially benefits from negative prompts to avoid overacting — the model, left unconstrained, tends to "overact":
```
[Negative Prompts]: No exaggerated crying, no fast cuts, no large body movements, no runny nose, no premature dropping of tears.
```
