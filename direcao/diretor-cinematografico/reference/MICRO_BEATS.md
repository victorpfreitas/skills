# Micro-Beats — Catálogo de Performance de Ator

**Nunca deixe uma emoção genérica num prompt.** Toda direção emocional deve se decompor em movimentos musculares específicos, respiração, olhos e pele. Esta é a maior diferença entre um prompt Seedance que produz "vídeo de AI" e um que produz performance de verdade.

---

## 1. A regra base

Quando o usuário (ou o roteiro) escreve "o personagem fica [emoção genérica]" — pare. Decomponha. Se não conseguir decompor com confiança, ofereça variantes ao usuário.

Exemplo para "surpreso":

> *Qual tipo de surpresa?*
> *(a) Surpresa leve positiva — sobrancelhas levemente levantadas, lábios entreabridos, pupilas dilatam por 0.3s, inspiração suave pelo nariz. Sem movimentos extras.*
> *(b) Surpresa-choque — inspiração brusca pela boca, olhos arregalados, corpo congela no lugar, mão sobe involuntariamente ao peito.*
> *(c) Surpresa-descrença — piscar lento, cabeça inclina levemente, lábios se fecham, só uma sobrancelha sobe.*
> *(d) Surpresa-alegria — olhos acendem (catchlight), sorriso constrói gradualmente, ombros relaxam.*
> *Qual serve?*

Mesma abordagem para "tenso", "triste", "bravo", "apavorado", "pensativo", "apaixonado" — todo adjetivo genérico tem 3–5 realizações físicas distintas.

---

## 2. Catálogo por emoção

### Raiva / determinação / fúria

```
- Músculo masseter (mandíbula) visivelmente pulsando através da pele
- Veia carótida no pescoço visível
- Veias temporais afloram
- Narinas expandem nas palavras com ênfase
- Pupilas contraem (focus tightening)
- Canto externo dos olhos se fecha (intensidade genuína, não squinting barato)
- No pico não pisca
- Micro-suor nas têmporas / nariz
```

### Ansiedade / nervosismo

```
- Um gole visível na garganta (visible swallow)
- Uma inspiração curta e rasa antes da fala (quick nasal inhale)
- Língua umedece o lábio inferior seco
- Lábio inferior levemente recolhido
- Capilares das bochechas ficam vermelhos
- Pupilas dilatam nas palavras-chave
- ⚠️ Sem choro, a não ser que o roteiro especifique
```

### Tristeza / vulnerabilidade (sem lágrimas)

```
- Canto externo dos olhos cai
- Olhos úmidos com catchlight — mas ⚠️ sem escorrer, sem piscar lágrimas
- Centro das sobrancelhas franzido (corrugator muscle)
- Lábios com leve tremor
- Cabeça levemente baixa
```

### Controle / calma / superioridade

```
- Respiração lenta e uniforme (contrasta com oponente tenso)
- Dedos / braços relaxados
- Piscar lento e uniforme (slow blink)
- Queixo levemente erguido (chin lift)
- Sorriso Duchenne — rugas finas no canto externo dos olhos. ⚠️ Constrói gradualmente, não começa já completo
```

### Peso / esgotamento

```
- Ombros baixos e pesados (heavy shoulders)
- Cabeça levemente caída
- Respiração profunda e lenta
- Voz mais grave e abafada que o normal
- Cabeça inclina levemente ao responder (5–15°)
```

### Choque / freeze

```
- No início do plano — corpo congela por 0.3–0.5 seg, sem nenhum movimento
- Pupilas dilatam no instante do congelamento
- Lábios se entreabrem levemente mas sem som
- Uma inspiração nasal brusca e atrasada após o freeze
- Olhos travados na fonte do choque — sem piscar, sem desviar o olhar
```

### Emoção suprimida (a mais difícil — resistência física)

```
- Ele está tentando segurar — cada músculo da face lutando contra a emoção que sobe
- Músculo zigomático se contrai lentamente
- Um gole tardio e forçado na garganta
- Olhos gradualmente úmidos, lacrimais acumulam fazendo os olhos brilhar — mas lágrima não cai
- Uma inspiração lenta, funda, controlada — tórax visivelmente se expande
- Mandíbula treme uma vez — imediatamente recolhida
```

### Variantes de surpresa

**Leve positiva:**
```
- Sobrancelhas levemente erguidas
- Lábios entreabridos
- Pupilas dilatam por ~0.3 seg
- Uma inspiração suave pelo nariz
- Sem movimentos extras
```

**Choque:**
```
- Inspiração brusca pela boca (sharp mouth inhale)
- Olhos arregalados, pupilas dilatadas
- Corpo congela no lugar
- Uma mão sobe involuntariamente ao peito
- Lábios entreabridos sem som
```

**Descrença:**
```
- Um piscar lento
- Cabeça inclina levemente
- Lábios fechados e tensos
- Só uma sobrancelha sobe
- Olhar travado na fonte
```

**Surpresa + alegria:**
```
- Olhos acendem (catchlight se intensifica)
- Sorriso constrói gradualmente — ⚠️ não começa já completo
- Ombros relaxam e caem
- Uma expiração leve
```

---

## 3. Arco emocional dentro de um único plano

Quando a emoção muda dentro de um take contínuo, escreva como sequência numerada de beats com indicadores musculares/respiração/olhos por beat:

```
① Início — [emoção A] — [indicadores musculares específicos]
② Transição — [gatilho do evento] — [quais músculos relaxam / tensionam]
③ Próxima fase — [emoção B] — [novos indicadores]
④ ...
⑦ Final — [emoção final] — [indicadores finais]
```

Declare também o que **deve permanecer visível no rosto** ao longo do arco (sobrancelhas, mandíbula, respiração, olhos).

Amarre cada beat numerado à fase correspondente da câmera (ver CAMERA_EMOTION.md §2).

---

## 4. Diálogo e timing

Cada linha falada recebe:
- **Pre-line beat** (o que acontece antes da primeira palavra): gole, inspiração, passar a língua no lábio, mudança de postura
- **Durante a fala**: quais palavras são enfatizadas via narinas, entonação, pupilas
- **Post-line beat**: ~0.5 seg de respiração retida antes do próximo movimento, depois liberação

Exemplo:
```
Pre-line: one quick nasal inhale, visible throat swallow.
Line: "Don't ask me again." — emphasis on "again", nostrils flare on that word.
Post-line: hold gaze on other character for 0.5 sec — then slowly look away.
```

---

## 5. Personagens desfocados em bokeh

Se o personagem focal está em foco e outros estão desfocados — **eles não estão estáticos**. Especifique:
- Para onde estão apontando a cabeça e o olhar
- Micro-movimentos de ombros e cabeça
- Reação nos momentos-chave (mesmo em bokeh)
- Offset de timing claro (ex: "Personagem A vira a cabeça primeiro; 0.4 seg depois, B; mais 0.4 seg, C")

Três personagens nunca sincronizam perfeitamente — sempre escalonar por 0.3–0.5 seg.

---

## 6. Proibido em performance

- ❌ "Fica parado falando" — sempre há micro-movimentos
- ❌ Caretas exageradas / over-mugging
- ❌ "Olha pro teto" para pensar — nomear uma direção de olhar específica
- ❌ Lágrimas por padrão — só se o roteiro especifica
- ❌ Sincronização perfeita entre múltiplos personagens — sempre escalonar
- ❌ "Parece tenso" / "parece feliz" — sempre decompor em músculos, respiração, olhos

---

## 7. O teste anti-AI

Antes de entregar qualquer prompt, leia a seção de performance e pergunte:
> *Isso poderia vir de um template de prompt de AI? Ou parece anotações de um diretor que assistiu o ator ensaiar?*

Se parecer template, reescreva. Os micro-beats devem parecer de uma performance específica, não de um checklist.
