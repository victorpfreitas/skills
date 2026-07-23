# Prompt Density

How to group shot rows into 15-second prompts.

## The rule, derived from the source shotlist

Across the canonical shotlist (scenes 13–29 + 61–66), the average is **~1 prompt per 4–5 shot rows**, but this varies wildly by scene:
- Scene 21: 7 rows / 5 prompts (1:1.4) — dense, prompt-per-beat
- Scene 23: 3 rows / 1 prompt (3:1) — collapsed into one continuous emotional unit
- Scene 28: 42 rows / ~9 prompts (4.7:1) — typical action coverage

**There is no fixed ratio. Decide per scene.**

## Decision heuristic

Group shot rows into one prompt when ALL of these are true:
1. They share the same **character set** in frame
2. They share the same **location/subset of location**
3. They form a **continuous emotional/temporal unit** (no time skip, no major mood pivot)
4. They can be staged in **≤15 seconds of screen time**
5. The combined Chinese prompt won't exceed practical generation limits (~2500 chars)

Split into separate prompts when ANY of these fire:
1. **Hard cut between locations** (apartment → flashback)
2. **Major character entrance/exit** changes the handle list
3. **Aspect/lens change** that needs its own setup (wide establish → tight insert)
4. **Performance arc** that needs its own 15-second envelope (a reaction shot that builds across 7 emotional beats deserves its own prompt — don't bundle it with action)
5. **Insert / cutaway** to a prop or screen (these get their own ECU prompt)

## Within a prompt — multi-shot internal cuts

A single 15-second prompt CAN contain internal `【镜头1】 / 【镜头2】 / 【镜头3】` cuts when the cuts share location and characters. This is the "multi-shot prompt" pattern. See [PROMPT_PATTERNS.md](PROMPT_PATTERNS.md) §3 for the syntax.

Use multi-shot when:
- 2–3 fast cuts inside one continuous emotional moment (e.g., wide establish → tight reaction → low-angle finish, all in 15s)
- A montage that's tonally one unit (the polaroid scan in scene 21 — slide across photos, land on NOV 14, hand reaches in — one prompt, three internal beats)

Use one-shot when:
- A single continuous performance moment with one camera move (the dolly across the bridge in scene 18)
- Anything where the emotional weight needs to land without cuts

## Examples from the source

**Scene 23, 3 rows → 1 prompt (collapsed)**
- Row 11.1: Roko in apartment, dark atmosphere
- Row 11.2: Tear falls
- Row 11.3: Closes eyes, breaks into sobs

All three are one continuous emotional collapse on the kitchen floor. One prompt with `【镜头1】【镜头2】` internal beats, both same location, same character, ~15s envelope. **Don't fragment grief.**

**Scene 21, 7 rows → 5 prompts (split)**
- Prompt 1: door open + boots crossing threshold (rows 9.1 partial)
- Prompt 2: hallway walk to living room (own envelope — needs its own breath)
- Prompt 3: living room scan + window + turn toward fridge (one-er, 50mm)
- Prompt 4: fridge ECU — polaroid slide + hand reaches in
- Prompt 5: photo close-up + Roko's face + turn

Five distinct camera setups, five different focal lengths, five different emotional micro-beats. They earn their own prompts.

## When in doubt

Err toward **more prompts, shorter envelopes** rather than packing too much into 15 seconds. Seedance handles tight prompts better than overloaded ones, and the user can always run them in sequence.

## Tagging

Each prompt gets a short bracketed tag for the HTML header — describes what the prompt shows at a glance. Examples:
- `[MS-CU · door open + boots]`
- `[ECU · fridge photo slide + take photo]`
- `[CU · Roko face + turn]`
- `[Wide → MCU · spatial establish + reaction]`
- `[Multi-shot · 3 reactions + dialogue]`

Use the team's existing shot-plan abbreviations (see [PLAN_TYPES.md](PLAN_TYPES.md)).
