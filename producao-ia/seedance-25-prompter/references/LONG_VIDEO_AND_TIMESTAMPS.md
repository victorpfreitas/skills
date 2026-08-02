# Long Video, Stages, and Timestamps — Seedance 2.5

**Read this file for videos of 30s+ (stages), native long video (30–180s), or when you need precise timestamp control.**

---

## 1. When to use each approach

| Situation | Approach |
|---|---|
| Single clip, one action, no critical time handoff needed | Simple core formula (`PROMPT_FORMULA_AND_SYNTAX.md`) — don't force timestamps |
| Video up to ~30s with multiple events/state changes | **Stages** (section 2) |
| 30–180s video in a single generation | **Long Video mode** (section 4) — dedicated platform mode, no need to segment manually |
| Precise handoff/entry/exit/transition at a specific second | **Precision timestamps** (section 3), combined with stages |

---

## 2. Videos with multiple events: organize by Stages

When the video contains several events, split the story into consecutive stages. Each stage gets **only one** primary state change, and declare what needs to be directly visible by the end of that stage.

### Template
```
[Generation Goal]
Generate a <video type>. The central subject is <subject>, and the primary event is <story summary>.

[Stage 1]
Initial state: <initial state of characters, props, and scene>.
Primary event: <one primary action or event>.
End state: <character positions, prop ownership, or visible scene state>.

[Stage 2]
Continue from the previous stage: <state that must remain unchanged>.
Primary event: <one primary action or event>.
End state: <observable state>.

[Stage 3]
Primary event: <closing event>.
End state: <final visible state>.

[Maintain Consistency]
Keep <character identity, number of characters, clothing, prop ownership, spatial direction, and audio relationships> consistent.
```

### Official example
```
[Generation Goal]
Generate an instructional video showing a flower shop's order-packing process. <Florist> and <Store Assistant> arrange, wrap, and hand off a bouquet together.

[Stage 1]
Initial state: <Florist> stands behind the workbench. Loose flower stems, scissors, and wrapping paper lie on the tabletop.
Primary event: <Florist> arranges the stems and trims them to length.
End state: <Florist> holds the bouquet in the left hand, and the scissors are back on the right side of the workbench.

[Stage 2]
Continue from the previous stage: both characters retain the same identities and clothing, and <Florist> still holds the bouquet.
Primary event: <Store Assistant> unfolds the wrapping paper. <Florist> places the bouquet inside and ties it with a green ribbon.
End state: the wrapped bouquet lies flat in the center of the workbench, with the ribbon bow facing the camera.

[Stage 3]
Primary event: <Store Assistant> picks up the bouquet and places it on the pickup shelf.
End state: the bouquet is centered on the pickup shelf, and both characters stand behind the workbench inspecting the finished order.

[Maintain Consistency]
Keep <Florist> and <Store Assistant>'s identities, clothing, workbench orientation, scissors position, and bouquet ownership consistent.
```

---

## 3. Timestamps and pacing control

For common narratives, use stages by default. Use second-level precision **only** when you need to control a critical handoff, entry/exit, transition, or explicit beat. Too many timestamps become noise — don't use them to force the frequency of actions (e.g. don't ask for "complete three actions in one second").

| Pattern | Example |
|---|---|
| Time range | `0-3 seconds... 3-7 seconds... 7-12 seconds...` |
| Exact time point | `At 5 seconds, the camera whip-pans rapidly to the left and completes the transition.` |
| Relative time | `Three seconds after the character presses the button, the room lights gradually turn off.` |

**Rules:**
- Time ranges must be consecutive and non-overlapping — they represent a **time budget** for the event, not an exact cut point. The action can occur slightly before or after the boundary.
- A range with too little content gives the model more freedom; a range with too much content can cause excessive cutting or omitted events.
- Timestamps improve the probability that critical events will align, but they **don't guarantee** frame-by-frame overlap.

### Time-range usage example
```
0-5 seconds: Show an empty wooden display table. A hand places a white ceramic plate on it. End state: the hand has left the frame, and only the white plate remains in the center of the table.
5-10 seconds: Remove the white plate, then place a clear glass on the table. End state: only the clear glass remains in the center of the table.
10-15 seconds: Remove the clear glass, then place a green ceramic vase on the table. End state: only the green vase remains in the center of the table.
```

---

## 4. Long Video mode (30–180s in a single generation)

A dedicated platform mode ("Long Video"), different from manually chaining extensions. Supports freely selecting anywhere from 30–180s.

### Production formula for long video
```
Complete prompt = [Global Parameters] + [Creatives Description] + [One-sentence Overview] + [Specific Plot Description] + [Global Supplement (End)]
```

- **Global Parameters** — because of the long duration, it's worth reinforcing at the start of the text how many minutes/seconds and which aspect ratio, even if already configured on the platform.
- **Creatives Description** — reference number (upload order) + specific purpose.
- **One-sentence Overview** — Subject + Location + Event + Theme/Style + Special Camera Movement.
- **Specific Plot Description** — timeline/storyline with ➕ positive and ➖ negative blocks (see `PROMPT_FORMULA_AND_SYNTAX.md` §2).
- **Global Supplement (End)** — reinforce elements/details that need to persist throughout the whole video (camera position, environment, overall sound/atmosphere, light), and reinforce global restrictions (no subtitles, no BGM).

### Example (3-minute video, cat vlog)
```
Full length 3 minutes, @image1 cat working vlog, video aspect ratio 16:9, a day as a waiter with an orange cat as the main character, it goes from waking up brushing teeth and washing face, riding an electric scooter to a street-side small shop, arriving at work early morning wiping tables and clocking in, welcoming guests guiding them to seats and handing menus, scene reference @image6-10, overall restaurant reference @image11, he carefully delivers meals to the tables of customers @image2345, taking a nap and secretly nibbling on dried fish during lunch break, collecting dried fish tips and clearing tables in the evening, finally closing up and curling up to rest by the window, riding the electric scooter, returning to the room reference @image12, washing up, eating, sleeping. No subtitles throughout, no background music.
```

### Example (1-minute video, retro café, with detailed time ranges)
```
Video duration 1 minute, aspect ratio 16:9, cinematic realistic picture quality, retro healing style. On a rainy afternoon, a fixed camera records the steaming coffee on the table of a retro cafe.

0s-20s (Quiet opening): fixed camera on wooden coffee table, hot steam rising, checkered glass window with drizzle outside. No shake, no characters entering frame, no hard cuts.
20s-40s (Detail push-in): camera pushes in extremely slowly toward the coffee cup. A golden fallen leaf sticks to the outside of the glass. No complex physical collisions, no object deformation, no text.
40s-60s (Focus shift and fade out): focus shifts smoothly from cup to rain scene outside, picture gradually darkens with the sound of rain. No flicker, no abrupt transitions.

Picture and light/shadow: maintain high-level contrast between indoor warm yellow light and outdoor cold rainy night throughout.
Sound and restrictions: only real natural white noise (rain on glass, subtle ambient sounds). No background music globally, no subtitles globally.
```

---

## 5. Video Extension as continuation (overview)

Extension (forward/backward) is a separate continuity tool, not Long Video mode — see `VIDEO_EXTENSION_AND_TRANSITIONS.md` for the full flow (boundary-frame alignment, nested extension up to 60s).

---

## 6. Checklist

- [ ] Each stage has exactly one primary state change
- [ ] Each stage declares an observable end state
- [ ] `[Maintain Consistency]` block present in the closing
- [ ] Timestamps used only where there's a critical handoff — not where generic stages suffice
- [ ] Time ranges are consecutive, without overlap
- [ ] For Long Video mode: global parameters reinforced in the text, in addition to being configured on the platform
