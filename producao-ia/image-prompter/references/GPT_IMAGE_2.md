# GPT Image 2 (OpenAI)

## Specs

- **Aspect ratio:** 3:1 to 1:3
- **Resolution:** 2K native, 4K in beta
- **References:** up to 16 images, with good character, brand, and material transfer across edits
- **Strengths:** near-perfect text/typography, clean layout, UI mockups, product composition, surgical editing, coherent image batches

## Strength 1: high-fidelity text

Renders text with ~95-99% accuracy across multiple scripts, including long headlines, dense paragraphs, and small packaging/UI labels. It's the strongest of the three at this — prefer GPT Image 2 whenever the request has extensive text or critical legibility (storefront sign, product cover, slide, infographic).

## Strength 2: coherent image batches

Generates up to 8 coherent images from a single prompt, with character and object continuity across them. This is a different mechanism from Nano Banana's single-prompt grid: here you get separate images from a series, not panels of a single image.

```
Generate a coherent set of 4 images of the same young chef in a white 
double-breasted jacket, consistent face and outfit across all four: 
(1) plating a dessert close-up, (2) tasting from a spoon mid-kitchen, 
(3) wide shot walking through the kitchen line, (4) portrait looking 
directly at camera, arms crossed. Same lighting setup and color grade 
across the set: warm tungsten kitchen light, shallow depth of field.
```

## Strength 3: high pixel-stability editing

When editing an existing image, it changes only the requested region and keeps the rest of the frame stable, without the remainder "regenerating" along with it. Good for fine-tuning an already-approved asset (swap only a product, only a text, only a color) without risking the whole composition shifting again.

## Thinking Mode (creative side, no external search)

Before rendering, the model reasons about composition, object count, light, and constraints. This reduces rerolls on briefs with many simultaneous instructions (e.g., "3 people, 2 of them seated, one standing behind, each holding a different object, light coming from two sources"). This skill only uses that complex-instruction-following side. Thinking Mode also supports web search for fact-grounded content (an infographic with real data), which is out of scope for this skill.

## Where to use it

- Extensive or critical text/typography (sign, cover, slide, packaging)
- UI mockups and element-dense product composition
- Image series with character continuity (batch of up to 8)
- A frame ready to become video: a still generated here can go straight in as a reference for the `seedance-prompter`'s I2V mode

## Strong example: UI mockup with dense text

```
Generate a clean mobile app UI mockup, fintech dashboard screen, minimalist 
design, soft neutral background. Header reads "Monthly Overview" in bold 
sans-serif. Below it, three stacked cards, each with a label and value: 
"Income: $4,230.00", "Expenses: $2,115.50", "Savings: $2,114.50", each 
in a clean sans-serif font, high contrast, precise alignment. Bottom 
navigation bar with four icons labeled "Home", "Cards", "Insights", 
"Profile". Flat design, no gradients, aspect ratio 9:16.

Avoid: misspelled text, misaligned labels, decorative fonts, clutter.
```
