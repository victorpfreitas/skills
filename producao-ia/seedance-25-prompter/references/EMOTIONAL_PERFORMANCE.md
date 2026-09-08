# Acting, Micro-Expression and Observable Performance — Seedance 2.5

**Read this file for EVERY shot that contains a living character — human, animal, creature or mascot. Not only "emotional" scenes.**

The single most common failure of AI video is not bad camera or bad light. It's a character standing there with a blank face, dead eyes and no intention — a mannequin that happens to be breathing. That failure is a *prompt* failure: nothing in the prompt told the model what the character wants, where the eyes go, or what the body is doing while nothing happens. This file exists to make sure that never leaves the pipeline again.

---

## 1. The Acting Layer — mandatory floor for every character

Before writing any prompt with a character in frame, write these **three lines**. They are non-negotiable, even for a 3-second insert, even for a background extra, even when the scene is "neutral".

```
INTENTION  — what this character wants in these seconds, and what's in the way
GAZE       — where the eyes are, and the one moment they move (and why)
BODY       — the involuntary layer: breath, weight, hands, one micro-adjustment
```

Only after those three exist do you translate them into the prompt sentence. If you can't answer INTENTION, the character has no reason to be on screen and the shot will read as dead no matter how good the lighting is.

**Bad (no acting layer):**
> A man stands in the kitchen, cinematic lighting, emotional.

**Good (acting layer applied):**
> A man stands at the kitchen counter holding a cold mug he has no intention of drinking. His gaze rests on the doorway, not on the mug; when the floorboard creaks upstairs, his eyes flick up and hold. His weight shifts to the back foot, his thumb keeps rubbing the mug handle, and his breathing shortens without his face changing.

Same location, same light. The second one has a person in it.

---

## 2. INTENTION — the anti-mannequin rule

A character with no objective defaults to "posing for the camera". Every character in every shot needs an active verb, phrased as something they're *doing to* someone or something:

| Dead prompt | Intention-driven prompt |
|---|---|
| "she looks sad" | "she is trying to leave before her face gives her away" |
| "he is angry" | "he is holding the argument in so he doesn't lose the room" |
| "they are happy" | "she is checking whether he noticed, and he pretends he didn't" |
| "the character is waiting" | "he is rehearsing what he'll say when the door opens" |
| "she looks at the phone" | "she is deciding whether to answer it" |

**Rule:** the emotion is the *result*; the intention is what you write. Emotion words alone ("sad", "tense", "happy") are the number-one cause of the blank-doll look — the model has nothing physical to render.

**Obstacle:** whenever possible, name what stops the intention. Acting lives in the friction. "He wants to tell her — and she's already turned toward the door" produces performance. "He wants to tell her" produces a talking head.

---

## 3. GAZE — the fastest fix for dead eyes

Empty eyes are almost always an unassigned gaze. The model needs a *target*, not a direction.

Always specify:
1. **Where the gaze rests** (a named object/person, not "into the distance" — that renders as vacant)
2. **The one break** — the single moment the eyes move, and what triggers it
3. **Blink behavior** — held-open, one slow blink, or rapid blinking. Choose one.

```
Gaze anchored on <specific target>. When <trigger>, the eyes flick to <second target> and hold for a beat before returning. One slow blink as the decision lands.
```

**Gaze vocabulary that renders well:**
```
eyes track the person's mouth, not their eyes
gaze drops to the hands and stays there
eyes scan left to right across the other's face, reading it
gaze breaks contact downward first, then to the side
looks just past the camera, at something behind it
eyes return to the same object twice, a beat longer the second time
gaze holds without blinking, letting the other person look away first
```

**Avoid:** "stares into the distance", "looks around", "gazes thoughtfully" — all render as unfocused, glassy, doll-like.

---

## 4. BODY — the involuntary layer that reads as "alive"

Characters read as living beings because of things they aren't choosing to do. In a still shot, this is the entire difference between a photograph and a person.

Pick **two**, never more, per shot:
```
breath           — chest rises once and is held / one controlled exhale through the nose / breathing shortens without the face changing
weight           — shifts weight from one foot to the other / leans a fraction toward the other person then corrects
hands            — thumb rubs a seam / fingers stop mid-gesture / adjusts a sleeve that doesn't need adjusting / grip tightens on the object
head/neck        — a half-turn abandoned partway / swallows, throat moves visibly / tilts five degrees and stops
micro-adjustment — shifts the object an inch to the left for no reason / touches the back of the neck / straightens up when the door opens
settling         — after the main action ends, the body settles instead of freezing
```

**Critical for short clips (3–6s):** the body layer is often the *only* acting there's room for. A 4-second shot with a fixed camera and one held breath is more alive than the same shot with a full emotional arc jammed into it.

**"Life" in a static shot** — when the character isn't doing anything, they still need this:
> Even in stillness, the body stays alive: weight settled unevenly, one hand in slow contact with the surface, breath visible in the shoulders, one unhurried blink.

---

## 5. Listening and reaction — where most shots die

Reverse shots, reaction shots and any character who isn't the one speaking are where AI acting collapses hardest — the model renders them as furniture. A listening character is *doing* something.

```
Listening actively:  eyes track the speaker's mouth, small nod that starts and stops, an inhale as if about to speak that is abandoned
Disagreeing silently: gaze holds level, jaw sets, one blink slower than the rest, no nod
Losing interest:      gaze drifts to a nearby object and comes back a beat late
Already knowing:      eyes drop before the sentence is finished, small exhale through the nose
Not understanding:    brows draw in a fraction, head tilts five degrees, gaze searches the speaker's face
Being caught out:     stillness first, then an over-controlled neutral face — the control itself is the tell
```

**Rule:** never write "listens" or "reacts". Write what the listening looks like.

---

## 6. Micro-expression catalog

Always write in English, always specify the muscle/region. Use 2–4 cues per emotional beat — more than that and the model averages them into mush.

**High-intensity**
```
Tension / controlled anger: jaw tightens visibly, teeth nearly clenched, nostrils flare on exhale, eyes narrow 10 degrees
Recognition:                eyes widen 15%, pupils dilate slightly, brows lift asymmetrically — left higher than right
Suppressed sadness:         lower lip barely suppressed, chin muscle tightens, eyes fill without blinking, gaze drops slightly
Shock / freeze:             face goes completely still — all micro-movement ceases — brief total freeze before any reaction begins
Relief:                     shoulders drop, jaw unclenches, exhale visible through slightly parted lips, eyes soften
Distrust:                   head tilts 5 degrees, one eyebrow lowers while the other stays level, lips press together
Determination:              chin drops slightly, eyes fix on target without blinking, jaw set, exhale through nose only
Concealed fear:             rapid swallow, throat moves visibly, eyes hold steady but blink rate increases
```

**Low-key / everyday — the register most shots actually need**
```
Thinking:            gaze unfocuses on a nearby object, one slow blink, lips part slightly then close
Deciding:            eyes move between two points twice, then stop; a short inhale marks the choice
Mild amusement:      one corner of the mouth lifts, eyes crease before the mouth moves
Politeness over irritation: smile arrives a half-beat late and doesn't reach the eyes
Boredom:             blink rate slows, weight shifts, gaze slides off and returns
Fatigue:             eyelids sit lower, one long blink, the head resettles after every movement
Focus / working:     eyes lock on the task, breathing goes shallow and even, other muscles go quiet
Discomfort:          swallows, adjusts posture once, gaze finds a neutral object to rest on
```

**Comedy / character-forward** (this is where "bobalhão" is a *choice*, not an accident)
```
Deadpan:             face stays completely neutral while the body does something absurd — no mugging, no reaction
Delayed realization: neutral, neutral, then one blink and the eyes widen a fraction — the beat of delay is the joke
Pride:               chin lifts a few degrees, shoulders square, eyes check for a witness
Barely holding it in: lips press flat, nostrils flare on a suppressed laugh, eyes water at the corners
```

---

## 7. Acting budget by duration — do not overstuff

The most common overcorrection is jamming a full arc into 5 seconds. The model averages it and you get twitchy, unreadable acting.

| Duration | What fits |
|---|---|
| 3–5s | **One** beat: one gaze move OR one micro-expression + the body layer. Nothing else. |
| 6–10s | Two beats: trigger → reaction → settle. One emotional transition maximum. |
| 15s | Three beats, or one transition with a real hold on either side |
| 30s+ (stages) | 4–6 beats, one observable axis changing per stage (see §10) |

**Rule:** one observable axis at a time. Gaze *or* breath *or* mouth — not all three in the same second. Stacking is what produces the rubbery, over-animated face.

---

## 8. Single emotional transition — standard structure

```
The overall emotion shifts from <starting emotion> to <ending emotion>.
After <triggering event>, <subject> first shows <immediate observable reaction>.
Then, <eyes, brows, mouth, breathing, gaze, or hand movement> gradually <changes>.
Finally, <subject> expresses <target emotion> through <restrained or explicit outward behavior>.
```

---

## 9. Multi-stage emotion — progression through trigger events

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

## 10. Real production example (30s, single sustained transition)

From the official guide — a single emotional transition extended across 29s using stages with trigger + observable reaction, without repeating the same emotional note:

```
Stage 1 (0-3s)   [Questioning]:  direct gaze, no tears yet, brows slightly furrowed, whispers softly.
Stage 2 (3-10s)  [Resignation]:  gaze shifts away, eyelids droop, brief smile that instantly fades, one controlled breath.
Stage 3 (11-17s) [Remembering]:  camera pushes in, gaze slowly scans the other person's face, eye rims reddish but tears held back, jaw tightens.
Stage 4 (18-23s) [Regret]:       eyes lower, first tear falls without warning, brows slowly relax, faint head shake.
Stage 5 (24-29s) [Letting Go]:   extreme close-up, gentle smile forms, second tear slides, restrained trembling voice line, smile freezes on face.
```

Each stage changes **one** observable axis (gaze → breathing/smile → tear → relief). Don't stack several physical changes in the same stage.

---

## 11. Standard anti-mannequin negative block

Append to the `[Negative Prompts]` of any shot with a character. This is the default; add to it per scene.

```
[Negative Prompts]: No blank stare, no dead eyes, no frozen mannequin pose, no vacant expression, no exaggerated cartoon mugging, no unmotivated smiling at camera, no random head bobbing, no rubbery facial morphing, no lip movement without dialogue.
```

For restrained/dramatic performance, add:
```
No exaggerated crying, no large body movements, no runny nose, no premature dropping of tears, no theatrical gasping.
```

Note the block cuts **both ways** — dead face *and* overacting. The model's two failure modes sit on either side of the target.

---

## 12. Diagnosis — symptom → fix

When the generated character comes out wrong, match the symptom:

| Symptom | Cause | Fix |
|---|---|---|
| Blank, "bobalhão" face | Emotion named, no intention | Rewrite with §2 active verb + obstacle |
| Dead / glassy eyes | Gaze has no target | Assign a named object + one gaze break (§3) |
| Doll standing still | No involuntary body layer | Add two items from §4 |
| Extra/listener is furniture | Listening not written | Apply §5 |
| Twitchy, unreadable face | Too many cues stacked | Cut to 2–4 cues, one axis at a time (§7) |
| Overacted, soap-opera | No negative constraint | Add §11 restrained block |
| Smiles at camera for no reason | Model default | Add "no unmotivated smiling at camera" + assign a gaze target |
| Face resets between beats | No settle written | Add "the expression settles rather than resetting" |
| Speaks with wrong energy | Delivery unspecified | Specify volume, tempo, and whether the line is held back |

If two retakes with the same acting notes both fail, the problem is usually shot size, not acting: micro-expression below a medium shot doesn't survive the resolution. Move in closer or switch the beat to the body layer (§4).
