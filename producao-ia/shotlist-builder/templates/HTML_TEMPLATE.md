# HTML Template

The output is a single self-contained HTML file. Use the exact CSS/JS from the team's house template (the one in `Shotlist_21_23_EN.html` you generated previously is canonical).

## Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Shotlist — Scenes {SCOPE} (with Seedance 2.0 提示词)</title>
  <style>{HOUSE_CSS}</style>
</head>
<body>
<div class="container">
  <header class="top">
    <h1>Shotlist — <span>Scenes {SCOPE} (with Seedance 2.0 提示词)</span></h1>
    <div class="sub">Prepared for {USERNAME} · {N_SHOTS} shots across {N_SCENES} scenes · with detailed Chinese cinematic prompts</div>
    <div class="stats">
      <div class="stat"><div class="v">{N_SCENES}</div><div class="l">scenes</div></div>
      <div class="stat"><div class="v">{N_SHOTS}</div><div class="l">total shots</div></div>
      <div class="stat"><div class="v">{N_PLANS}</div><div class="l">plan types</div></div>
    </div>
  </header>

  <div class="toolbar">
    <input type="text" id="search" placeholder="Search by text, dialogue, locations...">
    <select id="planFilter">
      <option value="">All plans</option>
      {PLAN_OPTIONS}
    </select>
    <button onclick="window.print()">🖨 Print / PDF</button>
    <button class="clear" onclick="resetFilters()">Reset</button>
  </div>

  <div class="toc">
    <div class="toc-row"><span class="toc-label">Scenes</span>{TOC_LINKS}</div>
  </div>

  <h2 class="block-title first">Scenes {SCOPE}</h2>

  {SCENE_BLOCKS}

  <div class="empty-state" id="emptyState" style="display:none;">Nothing found. Try resetting the filters.</div>
</div>
<script>{HOUSE_JS}</script>
</body>
</html>
```

## Per-scene block

```html
<section class="scene pal-red" id="sc{N}">
  <div class="scene-head">
    <div class="scene-num-row">
      <span class="scene-num">SCENE {N}</span>
    </div>
    <h2 class="scene-title">{INT_EXT_HEADER}</h2>
    <div class="scene-meta">
      <span><b>Location:</b> {LOCATION_DESC}</span>
      <span><b>Mood:</b> <i>{MOOD}</i></span>
      <span class="shot-count">{N_SHOTS} shots</span>
    </div>
  </div>
  <div class="table-wrap">
    <table class="shotlist">
      <colgroup>
        <col style="width:60px"><col style="width:140px"><col style="width:140px"><col style="width:auto"><col style="width:30%"><col style="width:35%">
      </colgroup>
      <thead>
        <tr><th>#</th><th>Plan</th><th>Camera</th><th>Action</th><th>Scene text</th><th>Seedance 2.0 提示词</th></tr>
      </thead>
      <tbody>
        {SHOT_ROWS_WITH_PROMPTS}
      </tbody>
    </table>
  </div>
</section>
```

## Shot row + prompt cell

The first row of a prompt group carries the rowspanned `c-script` and `c-prompt` cells. Subsequent rows in the same group only have `c-num`, `c-plan`, `c-cam`, `c-act`.

```html
<tr data-scene="{N}" data-plan="{PLAN_CODE}">
  <td class="c-num">{SHOT_NUM}</td>
  <td class="c-plan"><span class="badge p-{PLAN_CLASS}">{PLAN_LABEL}</span></td>
  <td class="c-cam">{CAMERA_NOTE}</td>
  <td class="c-act">{ACTION_BEAT_EN}</td>
  <td class="c-script" rowspan="{GROUP_SIZE}">
    <div class="script-inner">{FULL_SCENE_TEXT_EN}</div>
  </td>
  <td class="c-prompt" rowspan="{GROUP_SIZE}">
    <div style="font-size:11px; line-height:1.6;">
      {PROMPT_BLOCKS}
    </div>
  </td>
</tr>
{ADDITIONAL_ROWS_NO_RIGHT_CELLS}
```

## Prompt block (one per 15-sec prompt)

```html
<div style="border-top:1px solid #333; margin:12px 0 8px; padding-top:8px;">
  <b style="color:#22c55e;">提示词 {N}</b>
  <span style="color:#666; font-size:10px;">[{TAG}]</span>
  <button style="margin-left:8px;padding:2px 8px;background:#27272a;border:1px solid #3f3f46;border-radius:4px;color:#a1a1aa;font-size:10px;cursor:pointer" onclick="navigator.clipboard.writeText(this.parentElement.nextElementSibling.textContent)">Copy</button>
</div>
<div class="prompt-block">{CHINESE_PROMPT}</div>
```

The `{TAG}` is a short bracketed shorthand like `[MS-CU · door open + boots]` or `[ECU · polaroid + Roko face]` — describes the prompt at a glance.

## CSS + JS

Reuse the team's house CSS/JS verbatim. Do not modify palettes, fonts, or layout. Director palette logic (`pal-black` / `pal-blue` / `pal-red`) defaults to `pal-red` for all scenes unless director assignment is explicitly requested.

**Note on plan codes:** the skill now uses English plan codes (`WS`, `MS`, `CU`, `ECU`, `MACRO`, `PAN`, `OS`, `VO`, `VO+MS`, `DISSOLVE`) for both the visible badge label and the `data-plan` attribute. The plan filter dropdown's `<option value>` should match. If reusing CSS from older Cyrillic-coded HTMLs, swap the badge classes (`p-op` → `p-ws`, `p-sp` → `p-ms`, `p-kp` → `p-cu`, `p-dkp` → `p-ecu`, `p-vyk` → `p-os`) — the colors stay the same; only class names change.

## Filter dropdown

```html
<select id="planFilter">
  <option value="">All plans</option>
  <option value="WS">Wide shot</option>
  <option value="MS">Medium shot</option>
  <option value="CU">Close-up</option>
  <option value="ECU">Extreme close-up</option>
  <option value="MACRO">Macro</option>
  <option value="PAN">Pan</option>
  <option value="OS">Off-screen sound</option>
  <option value="VO">Voice-over</option>
  <option value="VO+MS">VO · medium shot</option>
  <option value="DISSOLVE">Dissolve</option>
</select>
```
