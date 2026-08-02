# skills

*Leia isso em [Português](./README.md).*

<img src=".github/social-preview.png" alt="victorpfreitas/skills">

This repository collects the skills I use day-to-day for generative AI production: camera direction, screenwriting, and voice. Each one came out of a real production case, not theory, and only made it in here after being tested in a real conversation. They're ready-to-plug knowledge blocks for whatever LLM you use, built to carry the same level of creative control I use on my own work into any project that needs it.

## Table of contents

- [The idea](#the-idea)
- [Skills](#skills)
- [Repository structure](#repository-structure)
- [How to use it](#how-to-use-it)
- [How each skill is made](#how-each-skill-is-made)
- [Validate before contributing](#validate-before-contributing)
- [License](#license)

## The idea

Generative AI doesn't replace direction. It needs someone guiding the process: deciding the framing, the tone of the script, the light on the scene, the timbre of the voice. Without direction, a model produces generic content. With direction, it becomes a real production tool.

This repository is that method, made open. These aren't loose prompts — it's the reasoning of a screenwriter, a director of photography, and a producer, the way I use it every day, written as reusable skills. What's here is what I actually use, not a showcase version.

Works with any agent that supports Markdown skills (Claude Code, Codex, and others).

## Skills

| Skill | Category | What it does |
| --- | --- | --- |
| [`diretor-cinematografico`](./direcao/diretor-cinematografico) | Direction | Shot breakdown, shot list, camera, lens, light, color, and blocking. Translates a script into visual language ready for AI video generation. |
| [`pesquisa-de-conteudo`](./producao-ia/pesquisa-de-conteudo) | AI Production | Validates whether a video idea has demand and suggests an angle, before scripting. |
| [`biblia-personagem`](./producao-ia/biblia-personagem) | AI Production | Creates a new character or documents an existing one in a visual-consistency bible across image/video generations. |
| [`image-prompter`](./producao-ia/image-prompter) | AI Production | Generates cinematic image prompts and decides which model to use among Nano Banana 2, Seedream 5.0 Pro, and GPT Image 2. |
| [`seedance-prompter`](./producao-ia/seedance-prompter) | AI Production | Turns an idea, scene, or visual reference into ready-to-use Seedance 2.0 video prompts. |
| [`seedance-25-prompter`](./producao-ia/seedance-25-prompter) | AI Production | Prompts for Seedance 2.5: multi-reference (up to 50 materials), editing/extending/transitioning an existing video, native 30–180s long video, blockout, and storyboard. |
| [`elevenlabs-voiceover`](./producao-ia/elevenlabs-voiceover) | AI Production | Formats a script into a voice-over with ElevenLabs Eleven v3 emotional tags, ready for narration. |
| [`trilha-sonora-prompter`](./producao-ia/trilha-sonora-prompter) | AI Production | Translates a scene's emotional tone into a ready-to-use Suno music prompt, with vidIQ as an in-conversation alternative. |
| [`montagem-prompter`](./producao-ia/montagem-prompter) | AI Production | Decides cut rhythm, transitions, music sync, and captions when assembling generated clips into a final video. |
| [`thumbnail-titulo-otimizado`](./producao-ia/thumbnail-titulo-otimizado) | AI Production | Generates and scores thumbnail and title, closing the generate → score → adjust loop before publishing. |
| [`roteirista-interativo`](./roteiro/roteirista-interativo) | Screenwriting | A screenwriter that builds a script, outline, or scene together with you, block by block, asking before writing each part. |

## Repository structure

Each category groups skills that act on the same stage of production. Inside each skill, `SKILL.md` is the entry point; `references/` only exists when the topic doesn't fit in a single file.

```
skills/
  .claude-plugin/marketplace.json      → plugin marketplace manifest
  direcao/
    diretor-cinematografico/
      SKILL.md
      references/                      → camera×emotion, directors, lenses, micro-beats, why it works
  producao-ia/
    pesquisa-de-conteudo/
      SKILL.md
    biblia-personagem/
      SKILL.md
      references/                      → new character creation, CHARACTER BLOCK template, scenes/props, cross-model consistency, troubleshooting
    image-prompter/
      SKILL.md
      references/                      → one file per model: Nano Banana 2, Seedream 5.0 Pro, GPT Image 2
    seedance-prompter/
      SKILL.md
      references/                      → style, camera, action, audio, troubleshooting, model mechanics, retakes
    seedance-25-prompter/
      SKILL.md
      references/                      → syntax/negative prompts, limits, character/style, camera, emotional performance, multi-reference, long video, video editing/extension/transition, keyframes/storyboard/blockout, troubleshooting, model mechanics, retakes
    elevenlabs-voiceover/
      SKILL.md
      references/                      → model mechanics, troubleshooting
    trilha-sonora-prompter/
      SKILL.md
      references/                      → style prompt formula, structure meta tags, and Suno's Exclude field
    montagem-prompter/
      SKILL.md
    thumbnail-titulo-otimizado/
      SKILL.md
  roteiro/
    roteirista-interativo/
      SKILL.md
      references/                      → character, dialogue, worldbuilding, settings, troubleshooting
```

## How to use it

**In Claude Code**, this repo is also a plugin marketplace: install it once and it updates itself with every change.

```
/plugin marketplace add victorpfreitas/skills
/plugin install victorpfreitas-skills@victorpfreitas
```

Once installed, skills trigger from conversation context (e.g., "monta a decupagem dessa cena", "formata esse roteiro pro elevenlabs" — write to it in whatever language you like) without needing to call them by name.

**In any other agent** (Codex, etc.), just point it at the folder of the skill you want or paste the contents of its `SKILL.md`. They're plain Markdown files, with no platform dependency.

## How each skill is made

- Every skill comes from a real production case, not loose theory about prompting.
- `references/` only exists when the `SKILL.md` alone would be too long to read in one pass.
- Every skill trigger is tested in a real conversation before it goes into the repo.
- Nothing goes in without a review for sensitive data (client, personal, internal).
- A skill leaves the repo when it stops reflecting how I actually work.

## Validate before contributing

Before pushing any change, validate the marketplace manifest and skill frontmatter:

```
claude plugin validate .
```

Every push and pull request also runs this validation automatically via GitHub Actions (see `.github/workflows/validate.yml`).

## License

MIT. See [LICENSE](./LICENSE).

---

A method by [Victor Freitas](https://madebyhuman.com.br/victor) ([@victorpfreitas](https://x.com/victorpfreitas)), AI-driven creative direction at **[Made by Human](https://madebyhuman.com.br/victor)**.
