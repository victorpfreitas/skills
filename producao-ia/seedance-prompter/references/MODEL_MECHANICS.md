# Why the rules work

The "Critical rules" in `SKILL.md` say what to do. This file explains why, for when a case isn't covered by the examples and the solution needs to be derived instead of copied from a ready-made pattern.

## 1. Attention is a finite resource

Every word in the prompt competes for a limited amount of influence over the result. The first words dominate; what comes after carries progressively less weight. That's why the golden rule in `SKILL.md` (words at the start carry more weight) exists: it's not a style choice, it's how the model allocates attention.

## 2. Active negation instead of exclusion

Saying "no blood" still evokes the concept of blood in the model. Negation is weak grammar wrapped around a strong activation. That's why the rule against negative constraints exists: describe what you want to appear, not what you don't want. The exception is the `fallback`/constraint field declared outside the prompt body, which Seedance treats as a parameter, not as descriptive text.

## 3. Identity errors compound across frames

Each frame generated from the previous one inherits and amplifies small errors from the source frame. A long clip without timestamps lets that error compound unchecked. That's why short, precise clips beat one long clip: fewer recomposition frames, less chance of drift.

## 4. References carry more weight than text

An image or video reference carries more information per "token" than a sentence describing the same thing. Rewriting in text what the reference already shows creates a competing instruction, not reinforcement. In the reference description, describe only what it can't show on its own (its role in the scene, not the appearance it already defines).

## 5. Detail in a region scales with the space it occupies in the frame

A face occupying 10% of the frame gets proportionally less "detail budget" than a face in close-up. That's why microexpression and facial reaction call for a tighter frame: it's not just aesthetics, it's the only way to guarantee detail fidelity.

## 6. Audio and video are generated together

Sound isn't added after the image — both are born from the same process. Naming the sound precisely anchors the scene's timing just as much as the visual description does. Dialogue requires a stable frame, because the model resolves image and phoneme at the same time.
