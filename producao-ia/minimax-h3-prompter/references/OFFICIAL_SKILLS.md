# The official MiniMax style skills

MiniMax publishes nine skills at `github.com/MiniMax-AI/MiniMax-H3/tree/main/skills`: `h3-prompt-writing` (the prompt-format skill this one is built on) plus eight style/workflow generators.

**Read this first:** all eight generators declare `compatibility: Requires the MiniMax Hub agent ...; not portable to generic agent harnesses`. They call `hub_generate_image`, `hub_generate_video`, `hub_canvas_*`, choice cards, and a canvas workspace that doesn't exist outside MiniMax Hub. **Do not try to run them here.** What travels is their *playbook* — the style locks, the shot-table structures, the approval gates. Read one when your job resembles it and steal the structure.

`h3-prompt-writing` is the exception: it's deliberately portable, and its two reference guides are the canonical sources behind `OFFICIAL_SYNTAX.md`, `BASE_MODES.md`, and `REF2VA_MODE.md` in this skill.

---

## The eight generators

| Skill | What it does | Worth stealing |
|---|---|---|
| `3d-animation-short-generator` | End-to-end stylized 3D animated short: brief → outline → character/environment cards → standardized shot table → storyboard → generation → assembly → BGM | The **six-column shot table with per-second directives + audio cues + spatial anchor chain**, and the self-check gate before generating anything expensive |
| `brand-promo-video-generator` | Promo shorts from logos, product images, screenshots, official links; organizes brand facts and asset provenance, then plans beats and shots | **Asset provenance tracking** — recording where each verifiable fact came from before writing copy, so the film doesn't invent product claims |
| `co-op-game-intro-generator` | Two-player co-op game menu/opening animation with player cards and UI motion | The **confirmation-image-then-video** flow: lock the visual direction with one approved still before spending a video generation |
| `handdrawn-live-video-generator` | Rough glowing hand-drawn animation fused with live-action space; contact, morph, escape, delayed handheld chase | The **contact-first structure** (physical contact established in 0–3 s buys the surreal element its credibility) and the deliberately late camera |
| `minimalist-product-ad-generator` | Minimalist product ad shorts for e-commerce and launches, from product images | **Separate anchor photos instead of a 4-panel sheet** — because video models reproduce panel layouts as literal split screens. Directly relevant to any grid-based reference workflow |
| `music-video-subtitle-generator` | AI music videos with lyric typography; beat/vocal timing analysis, beat-reactive spatial type | **Separating character, scene, and text references** into distinct roles, and the prompt-audit pass before generation |
| `paper-collage-explainer-generator` | Halftone paper-collage explainer animation from a narration line or concept | Its **audio policy stated as a default** (keep tactile collage SFX; add no BGM, voiceover, or subtitles unless asked) — an explicit default beats an unstated one |
| `papercraft-stop-motion-explainer` | Papercraft stop-motion explainer package for science/education topics | The **staged approval checklist**: style rules → character/set design → asset plan → prompts → storyboard → motion → sound, each reviewable before the next |

---

## What generalizes across all of them

Three patterns repeat in every official skill, and they hold outside Hub:

1. **A global style lock, declared once, applied to every artifact.** Character cards, shot tables, storyboards, and final clips all cite the same style block — so drift can't creep in between stages.
2. **Approval gates before expensive steps.** Confirm framing, style, and duration on something cheap (a still, a text storyboard) before spending video generations.
3. **A shot table before prompts.** Per-shot directives with timing, audio cues, and spatial anchors — written and checked as a table — then converted into prompts. Prompting straight from a script is what produces incoherent cuts.

For our own pipeline, `diretor-cinematografico` covers the shot-planning layer, `biblia-personagem` covers the identity lock, and this skill covers the conversion into H3's native format.
