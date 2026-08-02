# Video Editing — Editing an Already-Existing Video

**Read this file when the user already has a generated (or real) video and wants to modify something in it, without regenerating from scratch.** This doesn't exist in Seedance 2.0.

---

## 1. Core rule: define the "sole editing master"

Before anything else, define the source video as the **sole editing authority** — it controls characters, scene, actions, composition, camera movement, occlusions, audio, and event order, except where the prompt explicitly requests a change.

The output automatically preserves the input video's aspect ratio and approximately its duration — **neither is configurable separately** in this workflow (see `PARAMETERS_AND_LIMITS.md` §4). Input frame processing can produce a difference of up to ~0.3s, usually due to how transition frames are handled — the overall content and event order remain substantially unchanged.

---

## 2. General editing pattern

```
[Edit Goal]
Edit @Video 1. Within <the entire video or a specific time range>, <add, remove, replace, or adjust> <visual object, region, or audio category>.

[Source Video Role]
@Video 1 is the sole editing master. It defines <characters, scene, actions, composition, camera movement, occlusion relationships, audio, and event order>.

[Target Material Role]
@Image 1 or @Audio 1 defines <specified attributes of the target object or sound>.

[Edit Scope]
Modify only <object, region, time range, or audio category>.

[Content to Preserve]
Keep <visual content, motion, audio, and timing relationships that must not change> from @Video 1.
```

### Example (light change in a specific region/time)
```
[Edit Goal]
Edit @Video 1. Only from 4-7 seconds, change the cool blue light on the right wall to warm orange light.

[Source Video Role]
@Video 1 is the sole editing master. It defines the character, room layout, actions, composition, camera movement, audio, and event order.

[Edit Scope]
Change only the light color on the right wall and the area it illuminates. Allow the character's skin tone to respond naturally to the environmental light.

[Content to Preserve]
Keep the character's identity, clothing, expression, position, motion, room structure, camera movement, dialogue, and ambience from @Video 1.
```

---

## 3. Subject replacement

```
[Edit Goal]
Edit @Video 1. Change only <original object> to <target object>.

[Source Video Role]
@Video 1 is the sole editing master. It defines the original scene, camera position, camera movement, motion path, occlusion relationships, and event order.

[Target Reference Role]
@Image 1 defines <target object>'s <appearance, structure, or material>. Do not use <irrelevant background, people, or composition>.

[Edit Scope]
Modify only <specific object and area>. The entire video contains <number> target object(s). Do not modify <content to preserve>.

[Timeline Inheritance]
<Target object> inherits every appearance, motion, occlusion, and exit of <original object>, including timing, duration, path, and speed changes.

Except for the object or area explicitly modified above, keep all other people, props, scene content, camera movements, cuts, and event order from @Video 1 unchanged.
```

### Example
```
[Edit Goal]
Edit @Video 1. Replace only the yellow folding desk lamp with the white folding desk lamp in @Image 1.

[Source Video Role]
@Video 1 is the sole editing master. It defines the desk, books, hand movements, camera position, camera movement, occlusion relationships, and event order.

[Target Reference Role]
@Image 1 defines only the white folding desk lamp's appearance, structure, and material. Do not use the image's background, composition, or other objects.

[Edit Scope]
Keep exactly one white folding desk lamp throughout the video. Replace only the original yellow folding desk lamp. Do not modify the books, desk, hands, or background.

[Timeline Inheritance]
The white folding desk lamp inherits every appearance, lamp-arm rotation, hand occlusion, and exit of the original yellow folding desk lamp, including timing, path, and speed changes.
```

---

## 4. Background replacement (including green screen)

```
[Edit Goal]
Edit @Video 1. Replace only <original background area> with <target environment> from @Image 1.

[Source Video Role]
@Video 1 is the sole editing master. It defines the people, foreground objects, actions, composition, camera movement, and event order.

[Target Reference Role]
@Image 1 defines only <target environment>'s spatial layout, materials, depth of field, ambient color, and lighting direction. Do not use the people or foreground objects in the image.

[Edit Scope]
Modify only <background outside the subject's silhouette>. Do not modify <subject identity, facial features, hairstyle, clothing, expression, position, size, or motion>.

[Timeline Inheritance]
Keep the character actions and occlusion relationships from @Video 1. Except for the object or area explicitly modified above, keep all other people, props, scene content, camera movements, cuts, and event order from @Video 1 unchanged.
```

### Example
```
@Video 1 is the sole editing master. It defines the people, actions, composition, camera treatment, and event order.
@Image 1 provides only the spatial layout, depth of field, ambient color, and lighting direction of a daylit glass greenhouse. Do not use the people in the image.
Replace only the light gray background outside the person's silhouette in @Video 1 with the daylit glass greenhouse from @Image 1.
Keep the person's identity, facial features, hairstyle, clothing, expression, position, size, and arm-raising motion from @Video 1.
```

This same logic covers **green-screen editing** (a new 2.5 capability): the "background outside the subject's silhouette" is exactly what gets swapped for chroma key / post-production compositing.

---

## 5. Audio editing

Dialogue, language, timbre, music, and SFX can be edited separately. Declare the speaker/sound category, the intended change, and what must remain unchanged.

```
Edit @Video 1. Remove only the original background music. Keep the character dialogue, lip sync, ambience, and action sound effects; preserve the visuals, camera treatment, and editing rhythm from @Video 1.

Edit @Video 1. Change <Presenter>'s spoken language to natural American English while preserving the dialogue content and speaking times. Keep all other character voices, background music, ambience, and visuals from @Video 1.
```

This is the official "BGM separation/removal" capability: requesting music removal while keeping voice and the rest of the original video's elements (subtitles included).

---

## 6. Smart Edit / Edit with Marks (interface, not pure prompting)

In the Dreamina app, there are two input modes for this same kind of editing:

- **Smart Edit** — describes the edit in text only, with no visual marking on screen.
- **Edit with Marks / Video Editing (post-generation)** — the user draws a marking (box, arrow, point) over the frame indicating the area, then writes the edit prompt. This automatically generates a timestamp label (`⏱️00:00 Video Frame Labeling`) that's added to the text instruction.

Both use the same prompting principles above (sole editing master, edit scope, content to preserve) — the visual marking just replaces the need to describe the region in words.

---

## 7. Checklist

- [ ] `[Source Video Role]` declares @Video 1 as sole editing master
- [ ] `[Edit Scope]` explicitly restricts what changes — never leave it implicit
- [ ] `[Content to Preserve]` lists what must NOT change
- [ ] If there's a target image/audio reference, its role is isolated ("do not use background/other objects")
- [ ] Aspect ratio/duration weren't manually configured — they're known to be locked to the source video
- [ ] For object replacement: used `[Timeline Inheritance]` to inherit timing/path/speed from the original object
