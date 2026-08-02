# Locations and Props — Cataloguing

When the character lives inside a recurring universe (series, multi-piece campaign), locations and props get the same treatment as the character: unique tag + fixed description, never free-form text reinvented on every prompt.

---

## Location (`@LOC_...`)

Every catalogued location needs to answer, in a compact description (not a long paragraph — locations carry less drift risk than characters, so 2-4 lines is enough):

- **Mandatory fixed elements** — what must always be present for the location to be recognizable (an object, a wall color, a specific view).
- **Light/mood tone** — if the location has a default atmosphere (e.g. "always golden hour", "always dramatic pre-storm sky"), declare it here so it doesn't vary scene to scene without reason.
- **Local identity**, if relevant to the project — a detail that anchors the location in a real place or a specific culture, when that's part of the narrative (e.g. a recognizable skyline, a local architectural element).

Template:

```
`@LOC_NAME` — [1-line identification of the place]
[Mandatory fixed elements, in running prose]. **Tone:** [default light/mood].
```

## Props (`@PROP_...`)

A recurring prop (an object that appears across several scenes, sometimes carrying narrative weight) follows the same pattern:

```
`@PROP_NAME` — [1-line identification]
[Material, color, texture, detail that cannot vary]. [Usage rule, if there is
one: e.g. "always in multiples, never a single one" or "exclusive to a
specific character"].
```

Rule for narrative props (ones that carry story information, not just decoration): explicitly declare the exact text/detail that appears on them (a headline, a symbol, a date) — a narrative prop with wrong or illegible text breaks the story just as much as the character coming out different.

## When NOT to catalogue

A location or prop that appears only once, with no recurring function, doesn't need a tag — that's overhead with no benefit. Only catalogue what repeats across pieces/episodes/generations.

## Quick inventory

Close the bible with a single reference table (characters + locations + props), so the team can quickly scan what exists without rereading the whole document:

```
| Tag | Type | Quick description |
|---|---|---|
| @NAME | Character | ... |
| @LOC_NAME | Location | ... |
| @PROP_NAME | Prop | ... |
```
