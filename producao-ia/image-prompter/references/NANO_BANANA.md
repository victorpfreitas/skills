# Nano Banana 2 (Gemini 3.1 Flash Image)

## Specs

- **Model:** Gemini 3.1 Flash Image
- **Speed:** ~3-5 seconds per image, the fastest of the three
- **Resolution:** 512px · 1K · 2K · 4K
- **Aspect ratios:** 1:1, 3:2, 2:3, 3:4, 4:3, 4:5, 5:4, 9:16, 16:9, 21:9 + ultra-wide 1:4, 4:1, 1:8, 8:1
- **References:** up to 14 object references + 5 characters per workflow
- **Strengths:** speed, conversational editing, photorealism, product stills, storyboard/grid

## Reference convention

References are addressed by natural description, not by explicit tag (`Reference 1: character identity`, not `@Image1`). Assign a primary role to each reference before writing the prompt (identity, environment, object) — the same discipline as `seedance-prompter` and `SEEDREAM.md`, just without tag syntax.

## Where to use it

- Fast conversational iteration, when the result doesn't need to be surgical (see "Deciding the next attempt" in `SKILL.md`)
- Grid/storyboard in a single prompt (section 3 of `SKILL.md`)
- Product stills and general photorealism, when speed matters more than layered editing

## Strong example: fast storyboard grid

```
Create a 1x3 image grid with 3 panels, each in 16:9 format, read left to right. 
Muted documentary color grade, natural window light throughout. Subject: a woman 
in her 40s wearing a charcoal wool coat, consistent across all panels.

Panel 1 (left): Wide shot, 35mm lens, she enters a quiet kitchen at dawn, 
backlit by cold blue window light, breath faintly visible.

Panel 2 (center): Medium shot, 50mm lens, she pauses at the counter, hand 
resting on a ceramic mug, gaze fixed on the window, first warm light crossing 
her face.

Panel 3 (right): Close-up, 85mm lens, her expression softens into a small 
exhale, full golden morning light now on her face, steam rising from the mug.

Avoid: oversaturation, inconsistent coat color across panels, motion blur.
```
