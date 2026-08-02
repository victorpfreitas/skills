# Why the tags and formatting work

`SKILL.md` tells you which tags to use and when. This file explains why, useful when the script has a case the rules don't literally cover.

## 1. A tag conditions only the local passage, not the whole text

A tag like `[excited]` affects the vocal delivery of the passage right after it, not the whole paragraph or the entire audio. That's why the tag needs to sit at the start of the passage that should carry that emotion. A tag dropped in the middle of a block, without a clear passage to condition, dilutes and doesn't change the delivery.

## 2. Stacking too many tags makes the model blend incompatible deliveries

Two compatible tags in the same passage (`[curious] [impressed]`) still let the model compose a coherent delivery — it's a combination, not a conflict. The problem starts at the third tag in the same passage: the model no longer has a clear sense of which emotion should dominate, and the result sounds artificial, without any of the intended deliveries actually coming through. That's why the `SKILL.md` rule caps it at two tags per passage.

## 3. CAPS creates emphasis through contrast, not volume

CAPS emphasis works because it highlights one word relative to the rest of the sentence that isn't in CAPS. If too many words in the same sentence are in CAPS, the contrast disappears and the whole sentence sounds "shouted" in a prosodic sense, without any single word actually standing out — and the model starts treating capitalization as noise instead of signal. That's why the rule is 1-2 CAPS per sentence: fewer than that, not enough emphasis; more than that, no emphasis at all.

## 4. Ellipsis pauses mimic real hesitant or reflective speech patterns

`…` works because it reproduces the way people actually pause to think or breathe in the middle of an idea. A pause that's too long (treating an entire paragraph as a single breath) sounds artificial because nobody talks that way. That's why `<break time="x.xs" />` doesn't work well in v3: it's a mechanical pause, not one that emerges from the text and its punctuation.

## 5. Punctuation carries part of the prosodic signal

Commas, periods, ellipses, and dashes carry different pause weights for the model. Writing a passage as a run-on without varied punctuation removes rhythm control from the text — the model has nowhere to "breathe" even if the idea calls for a pause there.

## 6. Stability trades tag responsiveness for predictability

The Stability parameter isn't "more or less emotion" — it's how much the model is allowed to deviate from its trained voice pattern in order to obey a tag. Robust keeps the voice as close as possible to the baseline, so it basically ignores the tag (which is why the behavior resembles v2, which had no tags). Creative allows maximum deviation, so it responds more strongly to tags, but the same mechanism that lets a tag "bend" the delivery also lets it hallucinate a sound nobody asked for. Natural is the middle ground: it deviates enough for the tag to take effect, without letting go of the voice pattern entirely.
