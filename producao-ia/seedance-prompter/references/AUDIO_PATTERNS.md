# Audio Patterns — SFX, Ambiente e Diálogo

**Leia este arquivo para construir blocos `audio:` completos.**

---

## Regra absoluta

**O Seedance 2.0 gera música por padrão.** Se você não declarar `music: none` + SFX desejados, o modelo preenche com trilha genérica que destrói o som do vídeo.

O campo `audio:` é **obrigatório** em todo prompt. Nunca deixe vazio.

---

## Estrutura do bloco

```yaml
audio:
  music: none
  sfx: "[efeito 1], [efeito 2], [efeito 3]"
  sound: "[ambiente sonoro específico — não genérico]"
  dialogue: '[Personagem] [modo de fala]: "[fala]" — [timbre/qualidade vocal]'  # apenas se houver fala
```

---

## Biblioteca de SFX por cena

### Ação / Combate
```yaml
sfx: "sword unsheathing metallic ring, impact shockwave, heavy footsteps on stone, debris scatter, glass shattering"
sfx: "gunshot echo, brass casing hitting floor, slide racking, distant car alarm triggered by blast"
sfx: "fist impact on flesh, exhale of effort, body hitting concrete, fabric tear"
sfx: "explosion low-end rumble, debris impact, dust cloud settling, distant car alarms"
```

### Veículo / Racing
```yaml
sfx: "engine roar at full throttle, tire scream on wet asphalt, turbo whistle, exhaust pop on deceleration"
sfx: "car door slam, engine startup, gravel crunch under tires, transmission shift"
sfx: "motorcycle engine blip, chain rattle, wind against helmet, rubber on road"
```

### Natureza / Exterior
```yaml
sfx: "wind through leaves, water droplets on metal, branch snap underfoot"
sfx: "ocean waves against hull, rigging tension creak, seabirds distant"
sfx: "forest ambience, distant bird call, dried leaf crunch, pine branches brushing"
sfx: "rain on glass, thunder distant, puddle splash, drainage gurgle"
```

### Urbano / Interior
```yaml
sfx: "distant city traffic hum, HVAC hiss, fluorescent light buzz, keyboard clicks"
sfx: "footsteps on marble, echo in empty corridor, elevator ding, door closing"
sfx: "crowd murmur background, glass clink, cutlery on plate, music bleed from another room"
sfx: "paper slide on desk, pen click, drawer open, chair creak"
```

### VFX / Sobrenatural
```yaml
sfx: "electric crackling, energy hum building, particle rush, pressure wave release"
sfx: "reality distortion low-frequency rumble, glass resonance, time-stretch audio artifact"
sfx: "water roar, blue energy condensing, steam burst, impact shockwave"
```

### Emocional / Silêncio
```yaml
sfx: "cloth movement, shallow breath, distant traffic muffled through glass"
sfx: "single footstep, breath catch, fabric rustle, near-silence room tone"
sfx: "wind against window, faint heartbeat, barely audible ambient hiss"
```

---

## Biblioteca de ambientes sonoros (sound:)

**Regra:** seja específico. "Ambient sound" é inútil. "High urban ambience — wind dominant, faint traffic below" direciona o modelo.

### Exterior urbano
```yaml
sound: "urban nightscape — muffled traffic far below, rain on concrete, distant siren"
sound: "busy street level — engines, horn blasts, foot traffic, construction distant"
sound: "rooftop ambience — wind dominant, city noise low-band only below"
```

### Interior urbano
```yaml
sound: "empty office floor — HVAC hum, distant phone, outside traffic muffled by glass"
sound: "underground parking — echo, drip, fluorescent flicker hum"
sound: "hospital corridor — soft PA system, rubber soles on linoleum, distant monitor beep"
```

### Interior doméstico
```yaml
sound: "quiet apartment — refrigerator hum, neighbor footsteps above, street muffled"
sound: "kitchen ambience — running water, background radio, drawer open"
```

### Natureza
```yaml
sound: "misty forest ambience, wind through pine canopy, settling silence after impact"
sound: "night exterior — cricket chorus, distant owl, leaf movement in wind"
sound: "ocean cliff — wave crash rhythm, wind gusts, seagull distant"
```

### Silêncio dramático
```yaml
sound: "near-silence — only room tone and character breathing audible"
sound: "dead room ambience — no reflections, hyper-intimate sonic space"
```

---

## Diálogo — como declarar

Use `dialogue:` apenas quando há fala audível na cena. Sempre especifique modo e timbre.

### Modos de fala
```yaml
dialogue: 'Character whispers: "fala" — breathless, barely audible'
dialogue: 'Character says quietly: "fala" — controlled, measured cadence'
dialogue: 'Character speaks with restrained force: "fala" — jaw tight, volume contained'
dialogue: 'Character shouts: "fala" — raw, voice breaking at peak'
dialogue: 'Character murmurs: "fala" — eyes forward, lips barely moving'
```

---

## Exemplos completos por tipo de cena

### Thriller noturno
```yaml
audio:
  music: none
  sfx: "footsteps on wet concrete, distant police radio, rain on parked cars, door latch click"
  sound: "urban nightscape — rain dominant, muffled traffic, wind through alley"
```

### Combate samurai / épico
```yaml
audio:
  music: none
  sfx: "water roar, sword unsheathing metallic ring, ground explosion, electric crackling, thunderous collision shockwave, trees snapping"
  sound: "misty forest ambience, wind through leaves, settling silence after impact"
```

### Reveal de veículo
```yaml
audio:
  music: none
  sfx: "light rain on rooftop, water droplets on metal, distant city ambience, gentle wind"
  sound: "urban nightscape — muffled traffic far below, rain on concrete"
```

### Drama emocional — close de rosto
```yaml
audio:
  music: none
  sfx: "wind gusting against fabric, distant city hum"
  sound: "high urban ambience — wind dominant, faint traffic below"
```

### Ação — perseguição
```yaml
audio:
  music: none
  sfx: "engine at full throttle, tire screech on wet road, impact, debris, crowd scatter shout"
  sound: "urban exterior — engine noise dominant, distance crowd ambience"
```
