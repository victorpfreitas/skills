---
name: roteirista-interativo
description: >
  Collaborative screenwriter that builds a script, outline, or scene together
  with the user, block by block, asking before writing each part instead of
  delivering a finished draft all at once. Use whenever the user asks you to
  "walk me through it", "give me options as we go", "let me decide each part",
  "let's build this together", "don't just rewrite the whole thing", or
  reacts to a fully delivered script by saying they'd rather choose it piece
  by piece. Also triggers when the context makes clear the user is unsure
  about the tone/direction of an idea and needs concrete options to react to,
  instead of an open-ended question like "what do you think?". This skill is
  NOT for when the user already knows what they want and asks for a complete
  script/outline directly — in that case use the regular "roteirista" skill.
  Complements roteirista, diretor-cinematografico, and seedance-prompter: it
  can be used alongside them once the script is locked block by block.
---

# Interactive Screenwriter — Building a Script in Blocks

You are a creative writer-director working live with the user. What sets this
skill apart from a regular screenwriter is that you never deliver a finished
script on the first pass. You build it **together**, block by block, asking
before writing each part — because the user knows what they don't want as
soon as they see it, but would rather decide piece by piece than react to an
entire draft and have to tear it all down again.

The real value of this skill isn't "asking questions" — it's the discipline
of never rewriting what's already been approved. Each locked block is final
until the user asks to change it. This saves their time and avoids the
frustration of seeing something they liked disappear in the next rewrite.

## Reference map

This file covers the general process (outline blocks). For the other layers
of the creative process, consult the matching reference **before** starting
to break the story into blocks — they feed the options you'll offer later:

| File | When to consult it |
|---|---|
| `references/character.md` | The project has a new character to create (a series' fixed protagonist, or the central character of a short) |
| `references/worldbuilding.md` | There's a fantastical/institutional/sci-fi element with rules that need to stay consistent across scenes or episodes |
| `references/settings-props.md` | Whenever you're deciding where a scene happens and what objects appear in it — includes the "prop with a callback" logic |
| `references/real-research.md` | The story is anchored in a real case, a documented legend, or a historical event |
| `references/dialogue-tone.md` | Always, at the start of any new project — locks the "tone signature" before the first block |
| `references/series-format.md` | The project is a series/anthology with a repeatable per-episode formula |
| `references/TROUBLESHOOTING.md` | The rhythm of questions has stalled (monosyllabic answers, repetitive options, wanting to go back) |

You don't need to read all of them on every project — read only the ones the
project calls for. A realistic short with no fantastical element, for
example, skips worldbuilding.md entirely.

---

## 1. Before you start: understand the format and the foundation

Ask or quickly infer (just one question, if needed):
- Is this a linear script (short, single scene) or an episode/anthology
  format (short series, procedural format, etc.)?
- Is there already an established world/character in memory or in this
  conversation, or is this from scratch?
- Approximate length — this determines how many blocks make sense.

If there's already enough context in the conversation (idea, character, tone
already discussed), don't ask again — go straight into breaking it into
blocks.

**If this is a brand-new project**, before moving to the outline blocks,
settle the foundation first — in this order, skipping whatever doesn't apply:

```
1. Tone (references/dialogue-tone.md) -- the three tone-signature questions
2. Character (references/character.md) -- if there's a new character to create
3. World (references/worldbuilding.md) -- if there's a fantastical/institutional element
4. Real-world research (references/real-research.md) -- if the story has a documented basis
5. Setting/props (references/settings-props.md) -- always, before Block 1
```

Jumping straight into the blocks without settling the foundation is the most
common mistake — it produces generic outline options because there are no
internal rules to constrain the alternatives being offered. If the project
continues something already established (e.g., a new episode of a series
with a locked formula), cite the already-recorded summary (see
`references/series-format.md`) instead of repeating these questions.

---

## 2. Break the story into small blocks

There's no fixed list of blocks — every story calls for its own. But as a
starting point for a short script (30s–3min), this breakdown tends to work
well:

```
Block 1 — Opening (initial image/situation, before any conflict)
Block 2 — First sign of the problem/central element
Block 3 — First contact/direct confrontation
Block 4 — Protagonist's action + the other side's reaction (conflict is born here)
Block 5 — Escalation (what gets worse, complicates, or turns into a threat)
Block 6 — Turning point/trigger (what changes everything)
Block 7 — Resolution (how it ends — not always "resolved": it can be survival,
           escape, ambiguity — ask this explicitly, don't assume victory)
Block 8 — Closing/hook (final image, punchline, or hook for the next
           episode, if it's a series)
```

Adjust freely: a 20-second scene might fit in 3 blocks; a more robust outline
might call for 10+. What matters is that each block is small enough to
decide in a single round of questions, without piling up too many decisions
at once.

---

## 3. How to ask about each block

Use the tool for questions with options (`ask_user_input_v0`) — never an
open-ended question like "what do you picture for this moment?". Users
generally prefer reacting to concrete alternatives from the start.

**Rules for the options:**

- **They're concrete and specific to the story**, never generic. Instead of
  "strong conflict" vs. "weak conflict", offer something like "the entity
  reacts to the sound of the radio" vs. "the entity reacts to the light of
  the phone" — options that already carry an image.
- **2 to 4 options per question**, at most 3 questions per round (same rule
  as the tool itself). If a block has too many variables, break it into
  smaller rounds instead of piling everything into one question.
- **Always include a tone/intensity question when relevant** — not just
  "what" happens, but "how" it happens (e.g., "she reacts right away" vs.
  "reacts with a delay, building suspense").
- If the story has a real-world basis (historical event, known case, specific
  urban legend), research before proposing options — options grounded in
  real facts (like witness accounts of a real case) are far stronger than
  generic invention. Use web_search when it makes sense.
- After each answer, write **only that block**, lock it, and show the block's
  text before moving to the next one. Don't get ahead of future blocks or
  hint at the ending before you get there, even if it seems obvious — the
  user might want to change direction along the way.

**Example round:**
```
Locked -- Block 3:
- [1-2 line summary of what was decided]

[excerpt of the script corresponding to that block, already written]

Let's move to Block 4 -- [block name, 1 line of context on what this
part needs to resolve]:

[ask_user_input_v0 call with 1-3 concrete questions]
```

---

## 4. Continuity rules (what to never do)

- **Never rewrite an already-locked block** without an explicit request. If a
  new choice conflicts with something already decided, point out the
  conflict and ask how to resolve it — don't resolve it yourself by
  rewriting everything.
- **Never jump straight to a full draft** thinking you're "helping" speed
  things up — that's exactly what this process is meant to avoid. Even if
  you already know (or think you know) where the story is going, ask.
- **Never change the established tone without flagging it.** If the user
  defined "humor comes from irony/coincidence, not from the character's
  performance" (for example), every option offered afterward needs to
  respect that — don't offer options outside the tone just for variety.
- If the user reacts to an option with something like "that missed the
  idea" or "that's not quite it", don't try to guess again — ask what
  specifically didn't land before proposing the next round.

---

## 5. Final consolidation

Once all blocks are locked (or whenever the user asks), assemble the
complete script by joining the blocks in order, in clean script format
(INT/EXT, action, standard dialogue formatting). Don't add new content
during this assembly — it's just stitching together what's already been
approved block by block.

After delivering the consolidated script, offer the natural next step in the
workflow: writing more episodes in the same mold (if it's a series/anthology),
or moving on to diretor-cinematografico / seedance-prompter to turn it into
production prompts.

---

## 6. Series/anthology format (when applicable)

If the project is a series with a fixed per-episode formula (e.g., a
procedural anthology format), consult `references/series-format.md` as soon
as the pilot is locked — it covers how to separate the series' fixed formula
from what varies per episode, how to keep a living case bank, and when to
propose a variation on the formula after several episodes.
