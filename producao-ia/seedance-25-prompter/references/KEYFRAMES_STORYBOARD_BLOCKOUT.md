# Keyframes, Storyboard, and Blockout — Seedance 2.5

**Read this file for first/last frame with extra references, multi-keyframe sequences, storyboard grids, blockout (white model) references, and One-Click Video.**

---

## 1. First and Last Frame with additional references

In multimodal mode, you don't need to switch to a separate "first/last frame" mode — just declare in the first line that `@Image 1` is the first frame and `@Image 2` is the last frame. The system locks the output aspect ratio to the first image (duration is configured on the platform/API). **First and last images must use the same aspect ratio** — a mismatch can stretch the last frame. Additional images can still define characters, props, scenes, and materials.

### Template
```
@Image 1 is the first frame. It defines the opening composition, subject position, pose, prop state, scene, and camera direction.
@Image 2 is the last frame. It defines the ending composition, subject position, pose, prop state, scene, and camera direction.
@Image 3 defines <Subject A>'s <appearance, clothing, structure, or material>. Do not change the first-frame composition defined by @Image 1 or the last-frame composition defined by @Image 2.

<Describe one continuous action or event>.

The video begins naturally from the first frame defined by @Image 1 and reaches the last frame defined by @Image 2 after the continuous action.
Between the first and last frames, maintain continuity in <character identity, prop structure and ownership, scene layout, and camera direction>.
```

### Example
```
@Image 1 is the first frame. It defines the opening composition, character positions, poses, tabletop prop states, perfume-workshop scene, and camera direction.
@Image 2 is the last frame. It defines the ending composition, character positions, poses, tabletop prop states, perfume-workshop scene, and camera direction.
@Image 3 defines <Perfumer>'s face, hairstyle, and dark green apron. Do not change the first-frame composition defined by @Image 1 or the last-frame composition defined by @Image 2.

Starting from the first-frame pose, <Perfumer> picks up a dropper and <Glass Perfume Bottle>, drips amber fragrance oil into the bottle, swirls it gently, closes the stopper, places the finished bottle in the center of the table, and naturally reaches the last frame defined by @Image 2.
```

Describe each anchor image separately. Never combine them in a sentence like "@Images 1 and 2 are the first and last frames". Other references should only supplement the attributes they specify — never replace the first/last composition.

---

## 2. Multi-keyframe sequence

When separate images define different stages of a process, start with "Use @Image 1 through @Image N as keyframes in this order," then describe the key state each image represents. Independent keyframe images tend to be easier to align than several frames combined into a single grid. They control stage order and key states — they don't reproduce every frame exactly.

### Template
```
Use @Image 1 through @Image N as keyframes in this order.
@Image 1 is the first frame. It defines <opening composition, subject position, pose, prop state, and camera direction>.
@Image 2 defines the second keyframe: <visible end state of Stage 1>.
@Image 3 defines the third keyframe: <visible end state of Stage 2>.
@Image N is the last frame. It defines <ending composition, subject position, pose, prop state, and camera direction>.

The video passes through the states defined by @Image 1, @Image 2, @Image 3, and @Image N in order, using continuous action to transition naturally between stages.
Maintain continuity in <subject identity, prop structure and ownership, scene layout, lighting, and axis of action> throughout.
```

---

## 3. Storyboard Grids

A storyboard grid communicates the overall story, shot order, and approximate composition. It's **not** meant for strict reproduction of every detail in every panel.

- Prefer **15 panels maximum**.
- Use clean line art or simple diagrams, minimize text labels.
- Declare reading order, then describe for each panel: subject action, shot size/camera movement, final visual style, audio.

### Template
```
@Image 1 provides an <N-panel storyboard grid> for shot order and approximate composition. Read it <left to right, top to bottom>. Do not use the grid's <line-art style, text labels, or placeholder characters>.
@Image 2 defines <Subject A>'s <appearance and clothing>.
@Image 3 defines <key prop or scene>'s <structure, material, or lighting>.

Shot 1: <shot size, subject action, and scene state>.
Shot 2: <shot size, subject action, camera movement, or transition>.
...
Shot N: <closing action and final visible state>.

The final video uses <visual style>. Audio includes <dialogue, ambience, action sound effects, or music>.
```

### Example
```
@Image 1 provides a four-panel pottery-making storyboard for shot order and approximate composition. Read it left to right, top to bottom. Do not use the storyboard's line-art style or text labels.
@Image 2 defines <Ceramic Artist>'s face, short hair, and dark gray apron.

Shot 1: a wide shot establishes a quiet pottery studio with <Ceramic Artist> seated at the wheel.
Shot 2: a side medium shot shows both hands shaping the rotating clay as the cup body takes form.
Shot 3: a close-up shows fingers refining the rim and handle joint while slip moves slowly over the fingertips.
Shot 4: a medium close-up shows the fired <Blue-Glazed Cup> placed on a wooden shelf as <Ceramic Artist> withdraws both hands.
```

---

## 4. Blockout References (white model / green-screen source)

Blockout splits into two categories — always identify which one before writing the prompt:

| Type | Best for | Material requirement | Prompt focus |
|---|---|---|---|
| **Coarse blockout** | Simple geometry that previews action, path, blocking, camera, cuts | Clear relationships between shapes + complete action sequence; character/prop/scene images can be added | Map each subject in the blockout and declare which temporal/spatial information to inherit |
| **Fine blockout** | Complete modeling that needs new characters, materials, colors, scenes, style | Clean, complete model — avoid path lines, coordinate axes, camera frustums | Preserve structure/action/camera treatment while defining the attributes to re-render |

### 4.1 Coarse Blockout

Maps paths, movement direction, blocking, entries/exits, camera path, cut points, light changes, and sound rhythm. Map each geometric object separately to its final subject/prop. Additional images can define the appearance.

| Blockout information | What to declare in the prompt |
|---|---|
| Path | Action trajectory, movement direction, subject blocking, entry/exit order |
| Camera movement | Camera position, path, direction, and speed changes |
| Light | Light direction, brightness changes, and when they occur |
| Cuts | Cut positions and subject/composition before/after each cut |
| Audio | Whether to inherit dialogue, music, ambience, or action SFX |

Prefer simple geometry with clear relationships. Include arms, wings, and other appendages only when the action sequence is complete — otherwise they can cause rigid motion or a misread structure.

#### Template
```
@Video 1 is a coarse blockout reference. It provides only <motion paths, subject blocking, camera position, camera movement, cuts, lighting changes, sound rhythm, or spatial relationships>. Do not use its blockout appearance, materials, or scene.

<Blockout Subject A> in @Video 1 corresponds to <Subject A>.
<Blockout Subject B or geometric prop> in @Video 1 corresponds to <Subject B or key prop>.
@Image 1 defines <Subject A>'s <appearance, clothing, or structure>.

<Subject> completes <primary action or event> in <scene>.
Keep <motion path, blocking, camera movement, cuts, lighting, or sound rhythm> from @Video 1.
The final video uses <characters, scene, materials, and visual style>.
```

#### Example
```
@Video 1 is a coarse blockout reference. It provides only the character's walking path, cart direction, locked-off camera, one push-in, and two cuts. Do not use its gray geometry or empty scene.

The tall cylinder in @Video 1 corresponds to <Guide>.
The rectangular block in @Video 1 corresponds to <Mobile Display Cart>.
@Image 1 defines <Guide>'s face, blue uniform, and name badge.
@Image 2 defines <Mobile Display Cart>'s white metal frame and clear cover.

<Guide> pushes <Mobile Display Cart> along the curved wall, stops in front of the central display, and opens the clear cover.
Keep the walking path, subject blocking, push-in direction, and cut points from @Video 1.
```

### 4.2 Fine Blockout

Already contains complete character/prop/scene structures. Use it to swap materials, colors, character appearance, scene, or overall visual style while keeping structure/action/camera. Keep the blockout clean — remove path lines, axes, controllers, camera frustums, and other production markers.

#### Template
```
@Video 1 is a fine blockout reference. Preserve <subject structure, action, spatial layout, camera position, camera movement, and cuts>. Do not use its original gray materials or empty background.
@Image 1 defines <subject>'s <character appearance, material, color, or surface details>.
@Image 2 defines <scene>'s <space, materials, lighting, or visual style>.

Re-render <subject> from @Video 1 as <final subject>, and re-render the scene as <final scene>.
Keep <structure, action, camera treatment, and spatial relationships> from @Video 1. Use <materials, colors, and style>.
```

#### Example
```
@Video 1 is a fine blockout reference. Preserve the kinetic sculpture's complete structure, three-ring rotation relationship, pedestal position, orbiting camera movement, and cuts. Do not use the gray materials or empty background.
@Image 1 defines the outer ring's brushed-brass material.
@Image 2 defines the inner blades' translucent blue-glass material.

Re-render the ring structure from @Video 1 as a kinetic sculpture made of brass and blue glass, and re-render the scene as a contemporary art gallery.
Keep the structure, rotation rhythm, orbiting camera movement, and cuts from @Video 1.
```

This also covers the new **professional white-model control** capability: the same logic, applied to complex lens scheduling, storyboard design, or blocking/motion trajectory.

---

## 5. One-Click Video (organizing loose images into a coherent video)

For turning multiple images (or images + a style-reference video) into a complete video with consistent pacing and visual packaging. Declare each material's role, image order, amount of motion, editing rhythm, visual treatment, and audio. **Never** write just "turn these materials into a video."

```
Material Roles → Image Order → Motion Amount → Editing Style → Visual Treatment → Audio
```

### Template
```
[Material Roles]
@Image 1 is used for <character, product, scene, or opening image>.
@Image 2 is used for <character, product, scene, or process image>.
@Video 1 is used only for <editing rhythm, transitions, subtitle treatment, or music style>. Do not use its character identities or scene (optional).

[Arrangement]
Show the images in <upload order, a specified order, or a model-selected thematic order>.
<State the character, product, location, and event relationships that must remain consistent>.

[Image Motion]
Apply <subtle live motion, parallax, push-in/pull-out, lateral movement, or local action> to each image.
Keep <subject appearance, product structure, text, or background relationships> stable.

[Final Style]
Use <editing rhythm, transition style, subtitle or graphic treatment, and color style>.

[Audio]
Include <dialogue, ambience, sound effects, or music>.
```

### Example (abridged)
```
[Material Roles]
@Image 1 is used for the night-market entrance and opening environment.
@Image 2 is used for <Traveler> walking along the street.
@Video 1 is used only for light editing rhythm, hand-drawn stickers, and transition style. Do not use its character identities or locations.

[Arrangement]
Show @Image 1 through @Image 6 in order to form a complete sequence: arrival, street exploration, dinner, riverside walk, and group photo.
Keep the three friends' appearances and clothing consistent. Do not mix their identities.

[Image Motion]
Use slow push-ins and subtle parallax for environment images. Add only natural blinking, head turns, glass-raising, and slight clothing movement to character images.

[Final Style]
Use an upbeat travel-video rhythm. Connect scenes with natural occlusion and similar colors.

[Audio]
Retain night-market chatter, light dish sounds, and riverside wind, with upbeat but unobtrusive instrumental music.
```

If image order matters, declare the exact sequence. If the model can arrange freely, say it can group by theme. With multiple characters/products, keep naming and linking each one separately (see `MULTI_REFERENCE.md`).

---

## Checklist

- [ ] First/last frame: each anchor image described separately, never combined in one sentence
- [ ] First/last frame: same aspect ratio on both images
- [ ] Multi-keyframe: order explicitly declared ("Use @Image 1 through @Image N as keyframes in this order")
- [ ] Storyboard: ≤15 panels, reading order declared, grid style explicitly excluded from the final output
- [ ] Blockout: identified coarse vs fine before writing
- [ ] Coarse blockout: each geometric object individually mapped to the real subject
- [ ] Fine blockout: material clean, no leftover production markers in the prompt
- [ ] One-click video: material roles, order, motion, style, and audio all declared — didn't ask for a generic "turn into video"
