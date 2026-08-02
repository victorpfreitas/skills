# Audio Patterns — SFX, Ambience and Dialogue

**Read this file to build complete `audio:` blocks.**

---

## Absolute rule

**Seedance 2.0 generates music by default.** If you don't declare `music: none` + the SFX you want, the model fills in generic music that ruins the video's sound.

The `audio:` field is **mandatory** in every prompt. Never leave it empty.

---

## Block structure

```yaml
audio:
  music: none
  sfx: "[effect 1], [effect 2], [effect 3]"
  sound: "[specific ambient sound — not generic]"
  dialogue: '[Character] [speech mode]: "[line]" — [vocal timbre/quality]'  # only if there's speech
```

---

## SFX library by scene type

### Action / Combat
```yaml
sfx: "sword unsheathing metallic ring, impact shockwave, heavy footsteps on stone, debris scatter, glass shattering"
sfx: "gunshot echo, brass casing hitting floor, slide racking, distant car alarm triggered by blast"
sfx: "fist impact on flesh, exhale of effort, body hitting concrete, fabric tear"
sfx: "explosion low-end rumble, debris impact, dust cloud settling, distant car alarms"
```

### Vehicle / Racing
```yaml
sfx: "engine roar at full throttle, tire scream on wet asphalt, turbo whistle, exhaust pop on deceleration"
sfx: "car door slam, engine startup, gravel crunch under tires, transmission shift"
sfx: "motorcycle engine blip, chain rattle, wind against helmet, rubber on road"
```

### Nature / Exterior
```yaml
sfx: "wind through leaves, water droplets on metal, branch snap underfoot"
sfx: "ocean waves against hull, rigging tension creak, seabirds distant"
sfx: "forest ambience, distant bird call, dried leaf crunch, pine branches brushing"
sfx: "rain on glass, thunder distant, puddle splash, drainage gurgle"
```

### Urban / Interior
```yaml
sfx: "distant city traffic hum, HVAC hiss, fluorescent light buzz, keyboard clicks"
sfx: "footsteps on marble, echo in empty corridor, elevator ding, door closing"
sfx: "crowd murmur background, glass clink, cutlery on plate, music bleed from another room"
sfx: "paper slide on desk, pen click, drawer open, chair creak"
```

### VFX / Supernatural
```yaml
sfx: "electric crackling, energy hum building, particle rush, pressure wave release"
sfx: "reality distortion low-frequency rumble, glass resonance, time-stretch audio artifact"
sfx: "water roar, blue energy condensing, steam burst, impact shockwave"
```

### Emotional / Silence
```yaml
sfx: "cloth movement, shallow breath, distant traffic muffled through glass"
sfx: "single footstep, breath catch, fabric rustle, near-silence room tone"
sfx: "wind against window, faint heartbeat, barely audible ambient hiss"
```

---

## Ambient sound library (sound:)

**Rule:** be specific. "Ambient sound" is useless. "High urban ambience — wind dominant, faint traffic below" gives the model direction.

### Urban exterior
```yaml
sound: "urban nightscape — muffled traffic far below, rain on concrete, distant siren"
sound: "busy street level — engines, horn blasts, foot traffic, construction distant"
sound: "rooftop ambience — wind dominant, city noise low-band only below"
```

### Urban interior
```yaml
sound: "empty office floor — HVAC hum, distant phone, outside traffic muffled by glass"
sound: "underground parking — echo, drip, fluorescent flicker hum"
sound: "hospital corridor — soft PA system, rubber soles on linoleum, distant monitor beep"
```

### Domestic interior
```yaml
sound: "quiet apartment — refrigerator hum, neighbor footsteps above, street muffled"
sound: "kitchen ambience — running water, background radio, drawer open"
```

### Nature
```yaml
sound: "misty forest ambience, wind through pine canopy, settling silence after impact"
sound: "night exterior — cricket chorus, distant owl, leaf movement in wind"
sound: "ocean cliff — wave crash rhythm, wind gusts, seagull distant"
```

### Dramatic silence
```yaml
sound: "near-silence — only room tone and character breathing audible"
sound: "dead room ambience — no reflections, hyper-intimate sonic space"
```

---

## Dialogue — how to declare it

Use `dialogue:` only when there's audible speech in the scene. Always specify mode and timbre.

### Speech modes
```yaml
dialogue: 'Character whispers: "line" — breathless, barely audible'
dialogue: 'Character says quietly: "line" — controlled, measured cadence'
dialogue: 'Character speaks with restrained force: "line" — jaw tight, volume contained'
dialogue: 'Character shouts: "line" — raw, voice breaking at peak'
dialogue: 'Character murmurs: "line" — eyes forward, lips barely moving'
```

---

## Full examples by scene type

### Nighttime thriller
```yaml
audio:
  music: none
  sfx: "footsteps on wet concrete, distant police radio, rain on parked cars, door latch click"
  sound: "urban nightscape — rain dominant, muffled traffic, wind through alley"
```

### Samurai / epic combat
```yaml
audio:
  music: none
  sfx: "water roar, sword unsheathing metallic ring, ground explosion, electric crackling, thunderous collision shockwave, trees snapping"
  sound: "misty forest ambience, wind through leaves, settling silence after impact"
```

### Vehicle reveal
```yaml
audio:
  music: none
  sfx: "light rain on rooftop, water droplets on metal, distant city ambience, gentle wind"
  sound: "urban nightscape — muffled traffic far below, rain on concrete"
```

### Emotional drama — face close-up
```yaml
audio:
  music: none
  sfx: "wind gusting against fabric, distant city hum"
  sound: "high urban ambience — wind dominant, faint traffic below"
```

### Action — chase
```yaml
audio:
  music: none
  sfx: "engine at full throttle, tire screech on wet road, impact, debris, crowd scatter shout"
  sound: "urban exterior — engine noise dominant, distance crowd ambience"
```
