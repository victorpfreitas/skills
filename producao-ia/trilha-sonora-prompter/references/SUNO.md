# Suno — Style Prompt, Meta Tags and Exclude

Reference for Suno's current syntax (v5.5) for building a soundtrack prompt. Suno has two separate fields in Custom mode: **Style of Music** (how the music sounds) and **Lyrics** (what is sung and the structure, via meta tags).

---

## Style of Music — formula

```
[Genre/subgenre], [Tempo/energy/BPM], [Key instruments], [Vocal style], [Production/mood], [Modifiers]
```

- **4 to 8 descriptors**, never a running paragraph — Suno interprets comma-separated tags better than prose.
- **Genre and vocal type right at the start** — these are the descriptors that most anchor the result.
- Example for a tense background track: `dark cinematic trailer score, mid-tempo building to fast, deep strings and pulsing sub-bass, instrumental, tense atmospheric production, slow crescendo`.
- Example for an upbeat opening track: `upbeat indie pop, 120 BPM, acoustic guitar and claps, warm female vocal, bright polished production, feel-good`.

## Lyrics — structure meta tags

Meta tags go in brackets, on their own line, right before the section they affect. They serve both for section structure and for pinpoint instrument/dynamic instructions:

| Category | Common tags |
|---|---|
| Structure | `[Intro]`, `[Verse]`, `[Pre-Chorus]`, `[Chorus]`, `[Bridge]`, `[Outro]` |
| Instrumental/dynamics | `[Guitar Solo]`, `[Build]`, `[Drop]`, `[Instrumental Break]`, `[Fade Out]` |
| Vocal | `[Whispered]`, `[Spoken]`, `[Ad-lib]` |

For a **pure background track** (the most common case coming from `seedance-prompter`), the Lyrics field usually isn't filled with any lyrics at all — just the style prompt + the word `instrumental` at the end is enough. Structure meta tags come into play when the piece needs marked sections (e.g., a jingle with a sung hook, or a track that needs a build/drop synced to a specific moment in the video).

## Exclusion — two methods, different reliability

- **Dedicated Exclude field** (Custom Mode → Advanced Options, available on Pro/Premier plans): describe in plain text what you don't want (e.g., `choir, backing vocals, distorted guitar`). This is the **most reliable** way to exclude something.
- **Inline at the end of the style prompt**, when the dedicated field isn't available: write the exclusion as a phrase, at the end of the prompt, never at the start (Suno processes the positive descriptors first) — e.g., `..., warm acoustic production, instrumental, no vocals`.
- Tags are **probabilistic hints, not commands** — Suno follows them most of the time but may ignore them. If an exclusion gets ignored, regenerating or simplifying the phrase (avoiding a complex or unusual tag) tends to work better than repeating the same phrase.

## Vocal and Voices

If the track needs a specific vocal that stays consistent across generations (e.g., a recurring "brand voice"), the feature to use is **Voices** (formerly "Personas") — it clones/locks in a vocal reference for reuse. Outside of that case, leaving the vocal style as just a descriptor in the style prompt (`warm female vocal`, `deep male baritone`) is enough.

## Checklist before delivering the prompt

- [ ] Style prompt with 4-8 descriptors, genre and vocal at the start, comma-separated.
- [ ] `instrumental` present at the end when there is no vocal.
- [ ] Exclusion (if any) in the dedicated Exclude field, or at the end of the style prompt — never at the start.
- [ ] Structure meta tags only when the piece actually has sections/lyrics — a pure background track doesn't need them.
- [ ] Style prompt BPM/tempo compatible with the already-decided cut rhythm (see `montagem-prompter`), if applicable.
