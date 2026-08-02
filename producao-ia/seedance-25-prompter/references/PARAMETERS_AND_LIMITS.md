# Parameters and Limits — 2.0 vs 2.5

**Read this file before setting mode, duration, aspect ratio, or reference volume.** 2.5's limits are much larger than 2.0's — don't assume the numbers from the `seedance-prompter` (2.0) skill apply here.

---

## 1. Reference material limits

| Type | 2.0 | 2.5 |
|---|---|---|
| **Images** | 0–9 images per request | Up to **30 images**, each up to 4K |
| **Videos** | 1 video, duration [2,15]s, up to 3 videos, total ≤15s (actual: [1.8,15.2]s per video, total 15.2s) | Up to **10 videos**, duration [2,30]s each, total ≤30s (actual: [1.8,30.2]s per video, total 30.2s) |
| **Audio** | 1 audio, duration [2,15]s, up to 3 clips, total ≤15s (actual: [1.8,15.2]s, total 15.2s) | Up to **10 audio clips**, duration [2,30]s each, total ≤30s (actual: [1.8,30.2]s, total 30.2s) |
| **Total combined materials** | — | Up to **50 materials** total |
| **Audio-only (no image/video)** | R2V requires at least one image/video — audio alone is not supported | **Supports audio-only** (pure audio driver) |

### Recommended ranges (not technical limits, they're for stability)

| Scenario | Recommendation |
|---|---|
| Distinct subjects in reference images | 1–8 ideal; 9–12 possible but stability drops (may need more attempts) |
| Subjects in reference audio/video | 1–5 ideal; 6–10 possible, stability drops |
| Duration of each subject reference video/audio | 5–10s gives the best effect; longer reduces stability |
| Source video for video editing | best effect up to 20s; longer reduces stability |
| Reference images for video editing | 1–5 ideal; 6–8 possible, stability drops |

**Multiple angles of the same subject:** with 1–5 subjects, both "single view" and "multi-view" work. Above 5 subjects, always prefer a single view per image — split each angle into independent images instead of pasting multiple angles into one collage. Stability: multiple single-view images > one image with multiple views.

---

## 2. Generation duration

| | 2.0 | 2.5 |
|---|---|---|
| Supported range | -1 & [4, 15]s (97–361 frames) | -1 & [4, 30]s (97–721 frames) |
| Native long video | doesn't exist | **Long Video mode**: 30–180s in a single generation |
| Extension | doesn't exist | up to 30s per extension operation, nestable up to 60s total from a 30s base |

## 3. Resolution

Both versions: 480p, 720p (720p+ recommended for production work).

---

## 4. Automatic aspect-ratio and duration locks (2.5-exclusive)

Video editing, first/last-frame, and video extension **automatically lock** some parameters based on the input material. You cannot configure these fields separately on the generation page or via API when the lock applies.

| Task type | Aspect Ratio | Duration |
|---|---|---|
| **Video editing** | Automatically preserves the input video's aspect ratio — not configurable | Approximately preserves the input video's duration — not configurable. Input frame processing can produce a difference of up to ~0.3s |
| **First-frame or first-and-last-frame** | Automatically uses the first image's aspect ratio. First and last must use the same aspect ratio to avoid stretching the last frame | Configurable |
| **Video extension** | Automatically preserves the input video's aspect ratio — not configurable | Configurable (extension duration) |

Parameters locked by these rules cannot be specified separately. Other parameters depend on the options available on the platform at the time.

---

## 5. Official highlight roundup (overview)

Straight from ByteDance's release notes, for context on why each limit changed:

1. **Video extension / lossless continuation** — up to 30s per operation, nestable up to 60s.
2. **Native long video up to 180s** — no need to manually segment/extend.
3. **Precise timestamp control** — second by second.
4. **Expanded support for minority languages** — no need to translate to Chinese/English first.
5. **Removal of unwanted subtitles/BGM** — much more reliable negative-prompt response.
6. **Optimized base generation effect** — less "AI look," more consistent cuts, more complex long-tail actions unlocked.
7. **Comprehensive multimodal reference optimization**: timbre reference, multi-person reference (solves the "twins"/face-swap problem), extension continuity, blockout/white-model control, green-screen editing, BGM removal/separation, "transfer creativity" (doesn't just replicate motion, it captures the emotion/camera language/creative intent of the reference), partial elimination and re-editing of specific objects, camera perspective modification with spatial extrapolation.
8. **Seamless transition between two videos** — the model automatically generates the full in-between interval.
9. **Multi-grid storyboard** — accepts an image grid as plot reference; simple line art/stick figures are recommended.
