# Camera Language Reference — Seedance 2.0

**Read this file when you need to build the `camera:` block of any prompt.**

---

## 1. Movement vocabulary

| Movement | Seedance syntax | When to use |
|---|---|---|
| Slow approach | `dolly-in slow from [shot] to [shot]` | Emotional reveal, climax |
| Pull away | `pull-back revealing [what is revealed]` | Context, isolation, epic scale |
| Rear tracking | `rear steadicam chase locked [distance] behind subject at matching velocity` | Action, chase, tension |
| Smooth lateral | `smooth gimbal lateral tracking shot` | Character introduction, environment |
| Rising arc | `crane up from eye level revealing [what is revealed]` | Epic, context, scene ending |
| Circular arc | `smooth gimbal arc shot, starting [position] → rising to [position] → [resolution]` | Product reveal, dramatic opening |
| Low angle | `low angle [height]cm from ground, camera tilted upward [degrees] degrees` | Power, threat, grandeur |
| Whip pan | `whip pan [degrees] degrees revealing [what it cuts to]` | Energy, fast cut within the clip |
| Rack focus | `rack focus from [foreground] to [subject]` | Redirected attention, reveal |
| Bullet time | `bullet time 360° orbit around [point of impact/subject]` | VFX, stylized action |
| Documentary | `handheld slight documentary shake, controlled stabilized motion` | Realism, emotional tension |
| Extreme close | `dolly-in slow from medium shot to extreme close-up, rack focus on eyes` | Emotion, intensity |

---

## 2. Camera × Emotion (Seedance version)

Seedance responds to **camera as an emotional-state instruction**, not as aesthetics. Use these equivalences:

| Character's emotion | Camera instruction |
|---|---|
| Anger / tension | `handheld, jittery breathing rhythm, visible micro-tremors, irregular amplitude` |
| Calm / control | `smooth handheld breathing, barely perceptible micro-motion, steady rhythm` |
| Sadness / vulnerability | `slow, low-position handheld, slightly downward drift, heavy breathing pace` |
| Shock / revelation | `camera starts completely static — 0.5s freeze — then imperceptibly slow push-in` |
| Action / speed | `60fps, smooth velocity-matched tracking, motion blur within shutter angle only` |
| Climax / ending | `top-shot, perfectly overhead, 0.5-second freeze frame, all movement ceases` |

---

## 3. Lens selection

| Situation | Lens | Aperture |
|---|---|---|
| Extreme emotional close-up (face fills frame) | 85mm or 100mm | F1.4 |
| Two-character dialogue | 50mm | F2.0–F2.8 |
| Wide / establishing | 35mm | F4–F5.6 |
| Object / detail insert | 85mm with focus lock | F1.4 |
| Macro (pores, droplets, fabric) | 45mm macro | F2.8 |
| Epic / landscape | 24mm anamorphic | F8 |

> **Rule:** always specify the lens if the prompt has an emotional close-up or insert — Seedance defaults to a generic focal length if you don't declare it.

### FOV in degrees — sharper than mm alone

Seedance treats **field of view in degrees** as a snap value it locks onto; mm alone reads more like a suggestion it's free to round off. For a shot where the exact framing matters (an extreme wide, an extreme tele, or any multi-shot sequence that needs the same lens held across cuts), write the degree first with mm in parentheses, picked from the ladder below rather than an arbitrary value:

| FOV | mm equivalent | Feel | Use for |
|---|---|---|---|
| 180° | fisheye | spherical bulge | POV, dream-state |
| 107° | 14–16mm | architectural ultra-wide | vast interior, epic establishing |
| 84° | 20–24mm | wide | full-body blocking, environmental establish |
| 63° | 28–35mm | reportage wide | observational, documentary feel |
| 47° | 40–50mm | eye-level neutral | universal medium, two-shot |
| 29° | 75–85mm | portrait compression | isolated bust, tight coverage |
| 18° | 100–135mm | portrait tight | identity-hold close-up |
| 12° | 180–200mm | tele detail | hand insert, object close, texture |
| 8° | 300–400mm | extreme long-lens | anchored-far observation |

Example: `camera: 47° (50mm) eye-level neutral, dolly-in slow`.

---

## 4. Speed qualifiers

Use these terms to modulate the pace of the movement:

```
imperceptibly slow          → near-invisible motion (≤10cm over 6s)
very slow                   → contemplative dolly
slow                        → standard cinematic pace
controlled                  → deliberate, no hesitation
matched velocity             → camera speed = subject speed (tracking)
rapid                       → fast internal cutting between angles
```

---

## 5. Camera angles — quick reference

```
eye level                   → neutral, close, intimate
low angle (below waist)     → power, threat, grandeur
high angle (above eye)      → vulnerability, scene control
dutch angle (tilted)        → disorientation, psychological
overhead / bird's eye       → map, scale, epic ending
POV (first-person)          → immersion, identification
over-the-shoulder (OTS)     → dialogue, relational tension
```

---

## 6. Ready-to-copy camera blocks

### Product / vehicle reveal
```
camera: smooth gimbal arc shot, starting low 30cm from ground → rising to hood level → pulling back to reveal full silhouette, 6-second controlled sweep.
```

### Chase
```
camera: rear steadicam chase locked 2.5m behind subject at matching velocity, slight documentary breathing, irregular rhythm.
```

### Emotional climax
```
camera: dolly-in slow from medium shot to extreme close-up on eyes, rack focus pulling from background to face, 85mm, F1.4.
```

### Multi-angle action (Type C)
```
camera: rapid multi-angle system, interior close-up → exterior tracking → low ground shots, whip pans + speed ramp transitions between cuts.
```

### Epic establishing
```
camera: crane up from eye level revealing full [cityscape/landscape/scene], starting tight → wide panorama in 5 seconds.
```

---

## 7. Anti-fail rules

- **Never use `zoom`** → always use physical camera movement (`dolly`, `pull`, `push`, `track`)
- **`fixed_camera: true`** → disables any movement; use only for pure statics
- **Contradictory movements** → don't combine `static` with `dolly-in` in the same clip
- **Shake vs. tremor** → `handheld breathing` (soft, intentional) is not the same as `shaky cam` (chaotic)
