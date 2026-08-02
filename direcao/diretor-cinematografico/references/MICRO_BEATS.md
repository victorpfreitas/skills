# Micro-Beats — Actor Performance Catalog

**Never leave a generic emotion in a prompt.** Every emotional direction must be broken down into specific muscle movements, breathing, eyes, and skin. This is the biggest difference between a Seedance prompt that produces "AI video" and one that produces a real performance.

---

## 1. The base rule

When the user (or the screenplay) writes "the character becomes [generic emotion]" — stop. Break it down. If you can't break it down with confidence, offer variants to the user.

Example for "surprised":

> *What kind of surprise?*
> *(a) Mild positive surprise — eyebrows slightly raised, lips part, pupils dilate for 0.3s, soft inhale through the nose. No extra movements.*
> *(b) Shock-surprise — sharp inhale through the mouth, eyes wide, body freezes in place, hand rises involuntarily to the chest.*
> *(c) Disbelief-surprise — slow blink, head tilts slightly, lips close, only one eyebrow rises.*
> *(d) Joy-surprise — eyes light up (catchlight), smile builds gradually, shoulders relax.*
> *Which one fits?*

Use the same approach for "tense," "sad," "angry," "terrified," "pensive," "in love" — every generic adjective has 3–5 distinct physical realizations.

---

## 2. Catalog by emotion

### Anger / determination / fury

```
- Masseter muscle (jaw) visibly pulsing through the skin
- Carotid vein visible in the neck
- Temporal veins surface
- Nostrils flare on emphasized words
- Pupils contract (focus tightening)
- Outer corner of the eyes narrows (genuine intensity, not cheap squinting)
- No blinking at the peak
- Micro-sweat at the temples / nose
```

### Anxiety / nervousness

```
- One visible swallow in the throat
- One short, shallow inhale before speaking (quick nasal inhale)
- Tongue wets the dry lower lip
- Lower lip slightly retracted
- Cheek capillaries flush red
- Pupils dilate on key words
- ⚠️ No crying unless the script specifies it
```

### Sadness / vulnerability (without tears)

```
- Outer corner of the eyes drops
- Eyes moist with catchlight — but ⚠️ no streaming, no crying blink
- Center of the eyebrows furrowed (corrugator muscle)
- Slight lip tremor
- Head slightly lowered
```

### Control / calm / superiority

```
- Slow, even breathing (contrasts with a tense opponent)
- Relaxed fingers / arms
- Slow, even blink (slow blink)
- Chin slightly raised (chin lift)
- Duchenne smile — fine wrinkles at the outer corner of the eyes. ⚠️ Builds gradually, never starts fully formed
```

### Weight / exhaustion

```
- Low, heavy shoulders (heavy shoulders)
- Head slightly drooping
- Deep, slow breathing
- Voice lower and more muffled than usual
- Head tilts slightly when answering (5–15°)
```

### Shock / freeze

```
- At the start of the shot — body freezes for 0.3–0.5 sec, no movement at all
- Pupils dilate at the moment of freezing
- Lips part slightly but without sound
- One delayed, sharp nasal inhale after the freeze
- Eyes locked on the source of the shock — no blinking, no looking away
```

### Suppressed emotion (the hardest — physical resistance)

```
- They're trying to hold it back — every facial muscle fighting the rising emotion
- Zygomatic muscle contracts slowly
- A late, forced swallow in the throat
- Eyes gradually moisten, tear ducts build up making the eyes shine — but no tear falls
- One slow, deep, controlled inhale — chest visibly expands
- Jaw trembles once — immediately restrained
```

### Surprise variants

**Mild positive:**
```
- Eyebrows slightly raised
- Lips part
- Pupils dilate for ~0.3 sec
- One soft inhale through the nose
- No extra movements
```

**Shock:**
```
- Sharp inhale through the mouth (sharp mouth inhale)
- Eyes wide, pupils dilated
- Body freezes in place
- One hand rises involuntarily to the chest
- Lips part without sound
```

**Disbelief:**
```
- One slow blink
- Head tilts slightly
- Lips closed and tense
- Only one eyebrow rises
- Gaze locked on the source
```

**Surprise + joy:**
```
- Eyes light up (catchlight intensifies)
- Smile builds gradually — ⚠️ never starts fully formed
- Shoulders relax and drop
- One light exhale
```

---

## 3. Emotional arc within a single shot

When the emotion changes within a continuous take, write it as a numbered sequence of beats with muscle/breathing/eye indicators per beat:

```
① Start — [emotion A] — [specific muscle indicators]
② Transition — [triggering event] — [which muscles relax / tense]
③ Next phase — [emotion B] — [new indicators]
④ ...
⑦ End — [final emotion] — [final indicators]
```

Also state what **should stay visible on the face** throughout the arc (eyebrows, jaw, breathing, eyes).

Tie each numbered beat to the corresponding camera phase (see CAMERA_EMOTION.md §2).

---

## 4. Dialogue and timing

Each spoken line gets:
- **Pre-line beat** (what happens before the first word): swallow, inhale, tongue over the lip, posture shift
- **During the line**: which words get emphasized via nostrils, intonation, pupils
- **Post-line beat**: ~0.5 sec of held breath before the next movement, then release

Example:
```
Pre-line: one quick nasal inhale, visible throat swallow.
Line: "Don't ask me again." — emphasis on "again", nostrils flare on that word.
Post-line: hold gaze on other character for 0.5 sec — then slowly look away.
```

---

## 5. Characters out of focus in bokeh

If the focal character is in focus and others are defocused — **they are not static**. Specify:
- Where their head and gaze are pointing
- Micro-movements of shoulders and head
- Reaction at key moments (even while in bokeh)
- Clear timing offset (e.g. "Character A turns their head first; 0.4 sec later, B; 0.4 sec after that, C")

Three characters never sync perfectly — always stagger by 0.3–0.5 sec.

---

## 6. Forbidden in performance direction

- ❌ "Just stands there talking" — there are always micro-movements
- ❌ Exaggerated grimaces / over-mugging
- ❌ "Looks at the ceiling" to think — name a specific gaze direction
- ❌ Tears by default — only if the script specifies them
- ❌ Perfect sync between multiple characters — always stagger
- ❌ "Looks tense" / "looks happy" — always break it down into muscles, breathing, eyes

---

## 7. The anti-AI test

Before delivering any prompt, read the performance section and ask:
> *Could this have come from an AI prompt template? Or does it read like the notes of a director who watched the actor rehearse?*

If it reads like a template, rewrite it. The micro-beats should feel like a specific performance, not a checklist.
