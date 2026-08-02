# Multi-Reference — Mapping and Per-Scene Selection

**Read this file whenever there are 2+ reference materials (image/video/audio), and always when there are multiple characters/props/scenes.**

---

## 1. Why this exists

2.5 supports up to 50 reference materials (see `PARAMETERS_AND_LIMITS.md`). At this volume, the goal is **not** to cram every reference into a single sentence — it's to define the relationship between characters, props, scenes, actions, and audio, and to make clear which materials to use in each scene.

**Golden rule:** material mappings need to be written into the prompt. Don't rely solely on text labels inside the images, and don't let the model infer which person/prop/scene each material represents.

Order of work: **Define Each Material's Role → Map Subjects → Group by Type → Create Subject Profiles → Select References by Scene**

---

## 2. Reference role template (simple case)

```
@Image 1 defines <subject>'s <appearance, clothing, structure, or material>.
@Video 1 defines <motion, camera movement, or pacing>.
@Audio 1 defines <character or sound type>'s <voice, dialogue, ambience, or music>.
<Subject> completes <primary action or event> in <scene>.
```

### Example
```
@Image 1 defines the ceramic artist's facial features, hairstyle, and dark green apron. Do not use the image background.
@Image 2 defines the wooden workbench, window placement, and morning light of the pottery studio. Do not use the people in the image.
@Video 1 defines the pacing of throwing clay with both hands, lifting the cup, and placing it down. Do not use the person's identity, clothing, or scene from the video.
```

Whenever a reference could carry something unwanted (background, composition, other people), explicitly declare "Do not use X".

### Multiple views of the same subject
```
@Image 1 defines the front view of the same folding desk lamp.
@Image 2 defines the left-side structure of the same folding desk lamp.
@Image 3 defines the right-side structure of the same folding desk lamp.
@Image 4 defines the rear structure of the same folding desk lamp.
All four images define one folding desk lamp. The output must contain only one lamp throughout.
```

### Blockout video as a motion reference
When a reference video already defines motion, camera, and sequence with precision, declare only which attributes to inherit — don't repeat the whole action in text (repeating it can compete with the reference itself). A blockout video primarily supplies motion/spatial structure; the prompt still needs to define the intended subjects, scene, action, and visual style (see `KEYFRAMES_STORYBOARD_BLOCKOUT.md` for full blockout coverage).

---

## 3. Step 1 — Name and map each subject individually

```
<Character A> corresponds to @Image 1. Use only the appearance, hairstyle, and clothing.
<Character B> corresponds to @Image 2. Use only the appearance, hairstyle, and clothing.
<Prop A> corresponds to @Image 3. Use only the structure, material, and color.
<Scene A> references @Image 4. Use only the spatial layout, architecture, and lighting. Do not use the people in the image.
```

**Never** write something like "@Images 1 through 4 define four characters respectively" — this doesn't declare which image corresponds to which character.

---

## 4. Step 2 — Group materials by type

```
[Characters]
<Conservator> corresponds to @Image 1. Use only the appearance, hairstyle, and clothing.
<Registrar> corresponds to @Image 2. Use only the appearance, hairstyle, and clothing.
Do not interchange the characters' appearances, clothing, actions, positions, or dialogue.

[Props]
<Sample Case> corresponds to @Image 5 and belongs only to <Conservator>.
<Record Board> corresponds to @Image 6 and belongs only to <Registrar>.

[Scenes]
<Conservation Lab> references @Image 7. Use only the space, materials, and lighting.
<Gallery> references @Image 8. Use only the space, materials, and lighting.

[Motion and Audio]
@Video 1 defines the motion of <Conservator> opening <Sample Case>. Do not use the person or scene from the video.
@Audio 1 defines <Guide>'s voice and specified dialogue.
```

---

## 5. Step 3 — Centralized Subject Profile

When the same character uses multiple references across multiple scenes, create a single profile for them to avoid cross-scene contamination:

```
[Subject Profile: Conservator]
Appearance and clothing: @Image 1.
Fixed prop: <Sample Case> from @Image 5.
Locations: <Conservation Lab> and <Gallery>.
Motion references: the case-opening motion from @Video 1 and the sample-placement motion from @Video 2.
Do not use: other characters' clothing. Do not give this character <Record Board> or guide equipment.
```

---

## 6. Step 4 — Select references per scene

You don't need (nor is it desirable) to use every material at once. Declare per scene which materials are active:

```
Scene 1 | Inspection in the Conservation Lab
Use: <Conservator>, <Sample Case>, <Conservation Lab>, and the case-opening motion from @Video 1.
Event: <Conservator> opens <Sample Case> at the workbench and inspects the sample inside.
End state: <Conservator> remains on the inner side of the workbench. <Sample Case> stays beside the conservator's right hand, on the left side of the frame.

Scene 2 | Registration in the Gallery
Use: <Registrar>, <Record Board>, and <Gallery>.
Event: <Registrar> checks the number on <Record Board> beside the display case.
End state: <Registrar> still holds <Record Board> with both hands. No other character enters the display-case area.
```

The goal of multi-reference is to help the model **choose** the right material for the current scene — not to make every material appear at once.

---

## 7. Reference economy — more isn't more control

Being able to attach up to 50 materials (§ in `PARAMETERS_AND_LIMITS.md`) doesn't mean every scene should. Past the point where two references start disagreeing about the same thing, adding a third doesn't clarify — it gives the model more conflicting signal to average away. Two images of the same character's face taken under different lighting, at different crops, or in a different expression are a common way this happens by accident.

**Attach the fewest references that carry what the prompt actually needs, and prefer one reference that already resolves a combination over two that have to be reconciled.** If a character's approved full-look shot already shows face, hair, and wardrobe agreeing with each other, that one image is a better reference for a follow-up shot than that same image *plus* a separate face-only reference — the second one just gives the model two versions of the same face to reconcile instead of one to trust.

When a second reference of the same subject is genuinely needed (the first one drifted, or a detail is obscured in it), say explicitly what each one is for — *"the face and skin tone come from @Image 1; the wardrobe and hair styling come from @Image 2"* — so the model treats them as complementary instead of competing.

---

## 8. Quick checklist before generating

- [ ] Every distinct subject has a name + individually mapped reference (never "the images define X characters")
- [ ] Every reference has "use only X" and, when relevant, "do not use Y"
- [ ] Materials grouped by type ([Characters]/[Props]/[Scenes]/[Motion and Audio]) if there are 3+ references
- [ ] Subject Profile created for characters appearing in multiple scenes/stages
- [ ] References selected per scene/stage, not all stacked together
- [ ] Explicit no-swap rule when there are 2+ characters in the same scene
