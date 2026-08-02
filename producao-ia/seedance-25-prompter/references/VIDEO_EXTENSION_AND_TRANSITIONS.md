# Video Extension and Seamless Transitions — Seedance 2.5

**Read this file to extend a video beyond its start/end, or to create a seamless transition between two distinct videos.** Neither exists in Seedance 2.0.

---

## PART 1 — Video Extension

Extension creates content beyond the boundary of a source video. Aspect ratio is always automatically inherited from the source video (not configurable); extension duration is configurable (see `PARAMETERS_AND_LIMITS.md` §4).

**Core rule:** align the boundary frame BEFORE describing the new content.
- **Forward** extension (after the original video) — the extension's first frame continues from the source video's last frame.
- **Backward** extension (before the original video) — the extension's last frame connects to the source video's first frame.

Beyond the boundary frame, verify that the extended segment's characters, props, background, and events are correct.

### Limits (via Dreamina interface)
- Only source videos under 30s are eligible for extension.
- Each extension operation supports 4–30s of additional content.
- Extension is **nestable** ("nesting-style"): you can extend an already-extended result again, as long as the total is still within 30s before each new operation. At the limit: a 30s original video + 30s extension = up to 60s in a single flow.

---

### 1. Forward Extension — basic template

```
@Video 1 is the source video to extend forward.
Extend @Video 1 forward. The first frame of the extended segment directly continues from the last frame of @Video 1. Maintain continuity in <subject pose and orientation>, <prop position>, <background and spatial relationships>, <camera position and composition>, <lighting>, and <motion direction>.

Then, <describe the new action, event, camera treatment, or audio to add>.

Throughout the extension, maintain continuity in <character identity and clothing>, <key props>, <background layout>, and <axis of action>.
Keep each subject as the same continuous instance throughout: do not duplicate or split it, and keep the person's appearance or the object's number of parts stable.
```

### Example
```
@Video 1 is the source video to extend forward.
Extend @Video 1 forward. The first frame of the extended segment directly continues from the last frame of @Video 1. Maintain the same locked-off medium shot, the orange paper airplane's position and orientation, the classroom-window background, the afternoon lighting, and its movement toward the right side of the frame.

Then, the orange paper airplane continues gliding toward the right and exits the frame while the white curtain beside the window sways slightly. Keep the camera and classroom background in the state established by the source video's last frame.
```

### With additional references
Define each extra material's role first, and make clear that the source video controls the extension's boundary — new references can supplement characters/props/audio, but cannot override the last frame's control over the extension's opening image.
```
@Image 1 defines <Character A>'s facial features.
@Image 2 defines <Character A>'s clothing.
@Image 3 defines <key prop>'s structure and material.
@Video 1 is the source video to extend forward.
Extend @Video 1 forward. The first frame of the extended segment directly continues from the last frame of @Video 1. Maintain continuity in <boundary-frame state>.
Then, <Character A uses the key prop to complete a new action or event>.
```

---

### 2. Backward Extension — basic template

First describe what happens **before** the source video starts, then define the source video's first frame as the extended segment's explicit end state. Writing only "connect with the source video" can introduce characters/effects too late or make the image change again after reaching the target state.

```
@Video 1 is the source video to extend backward.
Extend @Video 1 backward. Before the source video begins, <describe the preceding action, event, camera treatment, or audio>.

The last frame of the extended segment naturally connects to the first frame of @Video 1: <subject pose and orientation>, <prop position>, and <background and spatial relationships>. Match the <camera position and composition>, <lighting>, and <motion direction> of @Video 1's first frame.

Throughout the extension, maintain continuity in <character identity and clothing>, <key props>, <background layout>, and <axis of action>.
Keep each subject as the same continuous instance throughout: do not duplicate or split it, and keep the person's appearance or the object's number of parts stable.
```

### Example
```
@Video 1 is the source video to extend backward.
Extend @Video 1 backward. Before the source video begins, show an empty establishing shot of the same glass greenhouse. Morning mist drifts slowly near the floor, the overhead shade rises gradually, and no people are present yet.

The last frame of the extended segment naturally connects to the first frame of @Video 1. Match the greenhouse's central aisle, planting tables on both sides, glass frame, soft morning light, and locked-off wide composition. At the end, the shade is fully raised, the aisle is empty, and the leaves still sway slightly.
```

### With additional references
Declare each material and explicitly state which materials should appear **only after** the source video begins — this reduces the risk of later characters/props/effects entering too early in the preceding segment.
```
@Image 4 defines the gray workwear of two <Exhibition Assistants>.
[...]
<Materials that should appear only after the source video begins> must not appear early in the backward extension.
```

Boundary frames connect naturally at the visual level — this doesn't mean pixel-identical. Review both sides of the boundary and the full extended segment.

---

## PART 2 — Seamless Video Transitions (between TWO videos)

Unlike extension (which works on ONE video), seamless transition generates continuous bridging content **between two distinct, already-existing videos**.

```
Before Video → After Video → Trigger Action → Camera Movement → Visual Transformation → Arrival State → Audio
```

### Basic template
```
@Video 1 is the before-transition clip. Use its <ending subject, action, composition, camera direction, and audio>.
@Video 2 is the after-transition clip. Use its <opening subject, composition, camera direction, and audio>.

Keep <character identity, product structure, scene, and primary action> stable in the original portions of @Video 1 and @Video 2.

At the end of @Video 1, <subject or foreground object> triggers the transition through <action>.
The camera <movement direction and speed change>, while <shape, material, light, or space> gradually transforms into <corresponding element> at the start of @Video 2.
The transition ends naturally at @Video 2's opening composition, preserving continuity in <subject position, camera direction, and motion trend>.
Audio transitions smoothly from <before audio> to <after audio>.
```

### Example
```
@Video 1 is the before-transition clip. Use its rainy night street, red umbrella, slow push-in, and rain sound.
@Video 2 is the after-transition clip. Use its circular gallery skylight, upward camera movement, and quiet interior reverberation.

At the end of @Video 1, the red umbrella approaches the camera and gradually fills the entire frame, triggering the transition.
The camera continues moving forward. The umbrella's circular edge gradually becomes the skylight's metal ring, and the red fabric transitions into white daylight passing through the skylight.
The transition ends naturally at @Video 2's upward-looking opening composition, with the camera movement changing smoothly from forward motion to an upward rise.
The rain gradually fades into footsteps reverberating inside the gallery.
```

### Transition methods and what to specify

| Method | What to specify |
|---|---|
| Dive / reverse motion | Camera direction, speed change, when the next scene begins |
| Character rotation | Pose, rotation direction, how clothing/background change continuously |
| Foreground occlusion | When the foreground object fills the frame and the composition that follows |
| Object morph | Corresponding shapes, materials, and the transformation process |
| Push/pull or focus shift | Camera movement, focus target, continuous spatial relationship |

**The goal of a seamless transition is visual and sound continuity** — the prompt can ask to preserve the primary content of the two source videos, but the generated bridge is not a pixel-identical cut.

---

## PART 3 — Cut/transition types within a clip (library reference)

Use this table both for cuts within a single prompt (`CAMERA_AND_CINEMATOGRAPHY.md` §5) and to guide the "trigger action" of a seamless transition between two videos.

| Type | What it is | When to use |
|---|---|---|
| **Natural shot switching** | Like a hard cut, but requires a "sense of breathing" and coordinated duration — not an abrupt hard cut | Most conventional narratives |
| **Fade in/fade out** | Image darkens/lightens fully between shots | Video start/end, passage of time |
| **Stacking (dissolve)** | One image gradually becomes transparent as the other emerges, overlapping for 1–2s | Memory, dream, slow passage of time, lyrical transition |
| **White flash / black flash** | Screen flashes white/black and cuts to the next scene | Visual impact, synced with a beat/sound, high energy |
| **Erase** | Image B "pushes"/wipes away image A from one direction, like a sliding door | Retro style, obvious location change |
| **Mask transition** | Camera advances and is blocked by an object (wall, back, pillar), screen goes black, next scene is revealed pulling out of the darkness | Spatial/dimensional jump |
| **Similar object transition** | The last frame of one shot is extremely similar in shape/outline/color to the first frame of the next | Montage — e.g. full moon becomes circular coffee foam |

Each type follows the same formula: `[Transition Type Guide] + [Basic constraint requirement] + [Cutting/transition logic requirement]` — declare the type, the breathing/duration coordination, and the expected compositional result.

---

## Checklist

- [ ] Extension: boundary frame aligned BEFORE describing new content
- [ ] Extension: aspect ratio not manually configured (inherited from the source video)
- [ ] Backward extension: materials that should only appear after the source video are marked as such
- [ ] Transition: both videos (`@Video 1`/`@Video 2`) have a declared "before"/"after" role
- [ ] Transition: trigger action, camera movement, and arrival state are all described
- [ ] Didn't promise a pixel-identical result — only visual/sound continuity
