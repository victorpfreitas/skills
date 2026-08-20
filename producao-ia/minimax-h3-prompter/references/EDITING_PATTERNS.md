# Editing and continuing an existing video (Ref2VA)

Editing a clip that already exists is one of H3's exclusive strengths — point at a source video and change one thing. The edit stays localized: everything you didn't mention (camera, light, timing) stays intact. That is what makes iteration practical — you don't regenerate the whole shot to swap one detail.

**Central rule: name the change and the constraint together.** A weak edit prompt describes only the desired end state; a strong one lists the swap (what goes out / what comes in) and, where it matters, what must stay exactly as it is.

---

## 1. Format: this is Ref2VA

An edit is not a mode of its own — it is Ref2VA with a specific task type. The source video is `<Video 1>`, and `summary` opens with the fixed sentence:

```text
summary:
[video editing] The target video is an edited version of <Video 1>.
```

Task-type combinations that come up constantly:

| Situation | Prefix |
|---|---|
| Editing a source video, original audio still audible | `[video editing + audio reuse]` |
| Editing while adding a new referenced element | `[video editing + reference generation]` |
| Continuing past the end of a source video | `[video continuation]` |
| Continuing and landing on a supplied final image | `[video continuation + keyframe completion]` |

Anything reused from the source as visible content is still a `<Subject N>` — `<Video 1>` names the structural source, not the people and objects inside it. Editing descriptions scale with the source's complexity and don't have to hit the 350–500 word generation range.

---

## 2. Character/object — swap, remove, add

Simple substitution:

```text
Replace the cat in <Video 1> with a dog.
```

Additions synchronized to what's already on screen (the model must match motion and lighting to the rest of the group):

```text
Add a person on the left side of the frame wearing the same team uniform and moving in sync with the others.
```

Compound swaps, each with its own reference image:

```text
Replace the child in the background of <Video 1> with the golden retriever from <Picture 1>. Replace the khaki jacket worn by the child on the left with the denim jacket from <Picture 2>.
```

With more than one swap, pair each with its own labeled reference — never leave it implicit which image belongs to which substitution.

---

## 3. Scene/VFX — background, lighting, environment

**Background replacement (green screen or not):**

```text
Remove the green-screen background of <Video 1> and replace it with a fairy-tale environment resembling <Video 2>. Make every background element respond correctly to the subject's movement, and relight the subject so it integrates naturally into the new scene.
```

Notice the three-part structure: (1) what to remove, (2) the reference for what replaces it, (3) **the physical constraint** — the new background must react to the subject's motion, and the subject's lighting must match the new scene. Without that third part, the result reads as pasted on.

**Relighting (changing light without changing content):**

```text
Change the lighting of <Video 1> from daytime to nighttime.
```

Short works here — nothing but the light is supposed to change, so there's nothing to protect.

**Replacing what's visible through an opening (window, mirror, screen):**

```text
Replace the view through the window in <Video 1> with <Picture 1>.
```

---

## 4. Dialogue/voice — replacing a line while keeping sync

Name the old line verbatim, the new line (from a reference audio or as text), and ask for a performance adjustment when the emotion changes:

```text
In <Video 1>, replace the woman's line — <d>[English] There's no way for us to be together. It's not that I don't love you; we just won't make it to the end.</d> — with the line from <Audio 1>: <d>[English] Please don't go. Not this time.</d> Subtly adjust the performance to match the new line.
```

The performance-adjustment request matters when the new line carries a different emotion than the original — without it, the face keeps the old line's expression while the mouth speaks the new one.

---

## 5. Multi-element — several swaps in one pass

H3 accepts a whole list of substitutions in one prompt, as long as each is named separately:

```text
In <Video 1>: replace the newspaper with a green hardcover book; replace the chair with a red sofa; remove the subject's sunglasses and reveal the face; remove the burning-car effect and restore the vehicle to normal; replace the photograph taken from the coat with a small black notebook; and add a tree on the left side of the frame.
```

Format: **semicolons separating each swap, an action verb opening each one** (replace / remove / add / change). This outperforms a flowing paragraph describing the desired end state.

Mixing product edits, signage, and dialogue in the same pass also works:

```text
In <Video 1>, replace the soda can shown at the start with a Coca-Cola can. Change the illuminated convenience-store sign in the background to read "HUHUI". At the end, replace each snack in the plastic bag with Coca-Cola cans, and change the final line from <d>[English] I bought some snacks.</d> to <d>[English] I bought a whole lot of Coke.</d>
```

On-screen text still follows the normal rule — the exact string in double quotes, untranslated (`OFFICIAL_SYNTAX.md` §5).

---

## 6. Continuation

Continuation is `[video continuation]`, and `<Video 1>` supplies the starting state rather than the material being modified. State explicitly what carries over from the source's final frame — subject position, camera state, lighting — then describe the new action forward. If the audio should continue the original's character without copying the signal, that's `audio reference`, not `audio reuse`.

---

## Checklist before delivering an edit prompt

- [ ] `summary` opens with the right task type and, for edits, the fixed "edited version of `<Video 1>`" sentence
- [ ] Every swap has an explicit action verb (replace / remove / add / change)
- [ ] Every swap is paired with a clear reference — a labeled image, or a precise textual description
- [ ] Where physics matters (background, light), the prompt explicitly asks the rest to react correctly (shadow, reflection, light on the subject)
- [ ] For dialogue swaps, both old and new lines are written verbatim in `<d>`, with a performance adjustment requested if the emotion changed
- [ ] Multiple swaps are semicolon-separated, one at a time — not blended into one paragraph
- [ ] Reused visible content is labeled `<Subject N>`, not left inside `<Video N>`
