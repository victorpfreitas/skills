# Action Language — Intensity and Precision

**Read this file when you need to describe character actions, expressions, and physical movement.**

Seedance **does not infer degree**. The difference between "runs" and `launches forward at maximum velocity, legs alternating furiously` is the difference between a vague video and a cinematic one.

---

## Core principle

**Physical specificity beats emotional abstraction**

Seedance processes muscular instruction, not sentiment. "Sad" generates nothing useful. "Jaw tightens, lower lip barely suppressed, eyes fill without blinking" generates a cinematic microexpression.

---

## 1. Movement actions — from vague to precise

| Vague | Precise |
|---|---|
| `runs` | `launches forward at maximum velocity, legs alternating furiously, arms driving hard` |
| `walks` | `moves at deliberate measured pace, each step landing with controlled weight` |
| `stops` | `halts abruptly — body absorbs the stop, forward momentum redistributed through bent knees` |
| `falls` | `collapses forward in slow motion, arms failing to react in time, knees buckling first` |
| `gets up` | `rises from ground using both hands first, then straightens torso slowly against weight` |
| `turns` | `pivots 180 degrees on left heel, coat trailing half a beat behind the turn` |
| `jumps` | `explodes upward from flat feet — maximum vertical extension — hang at apex for 0.3s` |
| `drags feet` | `drags left foot slightly behind right with each step, weight heavy, reluctant motion` |

---

## 2. Hand actions / gestures

| Action | Precise description |
|---|---|
| `picks something up` | `reaches forward 40 degrees, fingers extending fully before contact, grip deliberate` |
| `pushes` | `drives palm forward into surface with full body weight behind the movement` |
| `opens a door` | `grips handle, pulls toward body — door opens to 90 degrees, body follows through the frame` |
| `looks up` | `tilts head back 25 degrees, gaze rising from horizon to ceiling plane` |
| `looks down` | `drops chin toward chest, eyes tracking downward without moving the torso` |
| `gestures` | `right hand cuts horizontal arc at chest level, palm facing down, controlled emphasis` |

---

## 3. Facial microexpressions — catalog

Always write these in English in the prompt. Always specify the muscle/region.

### Tension / controlled anger
```
jaw tightens visibly, teeth nearly clenched, nostrils flare on exhale, eyes narrow 10 degrees
```

### Recognition / realization
```
eyes widen 15%, pupils dilate slightly, brows lift asymmetrically — left higher than right
```

### Suppressed sadness
```
lower lip barely suppressed, chin muscle tightens, eyes fill without blinking, gaze drops slightly
```

### Shock / freeze
```
face goes completely still — all micro-movement ceases — 0.5 second total freeze before any reaction begins
```

### Relief / release
```
shoulders drop 3cm, jaw unclenches, exhale visible through slightly parted lips, eyes soften
```

### Distrust / suspicion
```
head tilts 5 degrees right, one eyebrow lowers while the other stays level, lips press together
```

### Determination
```
chin drops 5 degrees, eyes fix on target without blinking, jaw set, exhale through nose only
```

### Pleasure / satisfaction
```
lips curve at corners — asymmetric smile, left side 2cm higher — eyes crinkle at outer edges
```

### Concealed fear
```
rapid swallow, throat moves visibly, eyes hold steady but blink rate increases to every 1.5 seconds
```

### Contained emotion
```
face maintains composure — but breath comes slightly faster, chest rises more than usual, hands still
```

---

## 4. Performance language

For actor scenes (not action), use **numbered beat** blocks:

```
① [beat 1 — initial state]
② [beat 2 — first stimulus / reaction]
③ [beat 3 — internal processing]
④ [beat 4 — decision / turning point]
⑤ [beat 5 — resolution / new state]
```

Real example:
```
① Roko holds the photograph with both hands, still, studying it without expression.
② His right thumb moves slowly across the faces in the photo — barely perceptible.
③ Jaw tightens. Eyes don't blink. Breathing pauses for 1 full second.
④ He sets the photograph face-down on the table with deliberate precision — not a slam, a placement.
⑤ He stands, turns away from the table, chin level, eyes forward. Expression locked.
```

---

## 5. Speed and intensity qualifiers

```
at maximum velocity          → top speed
at deliberate pace           → slow but intentional
barely perceptible           → minimal, near-invisible motion
imperceptible drift          → camera/character drift near zero
furiously                    → maximum muscular energy
controlled                   → force + precision, no wasted motion
explosive                    → instant energy from zero
```

---

## 6. Character description — how to lock identity

Seedance loses character consistency without explicit physical anchors. Always state, in every clip that uses the character:

```
[character]: [name/role], [fixed physical traits — hair, clothing, distinctive features], [posture/energy]
```

Examples:
```
A young man in a grey wool coat — short dark hair, slight stubble, narrow jaw.
A woman in red qipao — dark hair pinned up, gold earrings, composed posture.
A samurai in green-and-black checkered haori — young, mid-length tied hair, katana at left hip.
```

**Rule for I2V:** never contradict the character in the image. If the image shows a man, the prompt is a man.

---

## 7. Positive constraints — how to state without negation

| Problem | Positive constraint |
|---|---|
| Face deforming | `anatomically accurate facial proportions throughout` |
| Clothing changing | `maintain exact wardrobe consistency across all frames` |
| Focus drifting | `razor-sharp subject focus, crisp facial detail throughout` |
| Text appearing | `clean frame, no overlays, no watermarks, no subtitles` |
| Character drift | `maintain consistent facial features and identity throughout` |
| Lens distortion | `no barrel distortion, no fisheye, straight lines throughout` |
| Hands deforming | `anatomically correct hand geometry, natural finger positioning` |
