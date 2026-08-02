# Fórmula Central do Prompt e Sintaxe Especial — Seedance 2.5

**Leia este arquivo no início de toda tarefa.** É a base sobre a qual todos os outros arquivos de referência se apoiam.

---

## 1. Fórmula central

```
Subject + Action or Event + Scene and Environment (Optional) + Visual Style (Optional) + Camera Movement/Cut (Optional) + Audio (Optional)
```

- **Subject + Action or Event** — quem/o quê faz o quê. É a base do vídeo, nunca omita.
- **Scene and Environment** — local, horário, clima, relação espacial, estado do fundo.
- **Visual Style** — luz, cor, materiais, textura de imagem, humor geral.
- **Camera Movement/Cut** — tamanho de plano, ângulo, movimento, foco, transições.
- **Audio** — diálogo, timbre de voz, ambiente, SFX, música.

Elementos opcionais podem ser omitidos. Parâmetros de geração (duração, aspect ratio, resolução) **não** entram no corpo do prompt — são configurados na página de geração ou via API.

### Template básico
```
<Subject> performs <primary action or event> in <scene and environment>.
The visuals feature <visual style>.
Use <shot size, camera angle, camera movement, or cuts>.
Audio includes <dialogue, ambience, sound effects, or music>.
```

### Exemplo
```
A ceramic artist finishes a pale blue cup in a studio at dawn, lifts it from the wheel, and places it in the center of a wooden shelf. Soft morning light enters through the window. The wet clay has a delicate sheen, and the workbench remains tidy. Begin with a medium shot of the wheel-throwing process, slowly push in toward the cup's surface texture, then cut to a frontal view of the shelf. Retain the low hum of the pottery wheel, the friction of clay, and subtle indoor ambience.
```

---

## 2. Fórmula de produção completa (formato longo)

Para prompts de produção mais robustos, use esta estrutura em 4 blocos:

```
Complete prompt = [Creatives Description] + [One-sentence Summary] + [Specific Plot Description] + [Global Supplement (Ending)]
```

- **Creatives Description** — número da referência (na ordem do upload) + propósito específico (qual é personagem/timbre/ação/cena). Omita se não houver referência.
- **One-sentence Summary** — Subject + Location + Event + Theme/Style + Special Camera Movement.
- **Specific Plot Description** — escrito em timeline/storyline. Cada bloco de storyboard/período de tempo contém:
  - ➕ **Descrição positiva**: conteúdo específico da imagem + movimento de câmera + ação + diálogo + SFX
  - ➖ **Descrição reversa (negative prompt)**: elementos indesejados (ex.: "no subtitles", "no bgm")
- **Global Supplement (Ending)** — reforce no final os elementos e detalhes visuais que precisam estar presentes durante todo o vídeo (posição de câmera, características de ambiente/cena, som/atmosfera geral, luz). Também é onde repetir restrições globais (sem legenda, sem BGM).

---

## 3. Sintaxe especial

Prompts podem ser escritos inteiramente em linguagem natural. Quando precisar distinguir música, SFX, diálogo e legenda de forma explícita, use:

| Conteúdo | Sintaxe | Exemplo |
|---|---|---|
| Música | `()` | `(Soft, rhythmic piano music plays in the background)` |
| Efeitos sonoros | `<>` | `<A bell rings in the distance>` |
| Diálogo | `{}` | `{Hello, welcome back.}` |
| Legenda/subtitle | `【】` | `【Chapter One: Departure】` |

### Reforço de idioma do diálogo

Quando o diálogo não é em chinês, especifique o idioma antes da fala:
```
The girl says softly in Japanese: {もう大丈夫です}
```

Se o texto do diálogo está em inglês mas o modelo fala em chinês, ou se precisa de uma variante regional específica, reforce o idioma antes da fala:

```
Dialogue Language + Regional Variety or Accent + Delivery Style + Speaker + {Dialogue}
```

Exemplos:
```
Dialogue language: American English. The girl says in natural, conversational American English: {I thought you weren't coming.}

Dialogue language: authentic Los Angeles English. The young man says in natural Los Angeles vernacular: {No way, you actually made it.}
```

---

## 4. Negative Prompts — mudança crítica em relação ao 2.0

**No Seedance 2.0, negação era ignorada — a regra era descrever só o positivo.** No 2.5 isso mudou: todo exemplo oficial do guia usa um bloco `[Negative Prompts]` explícito, e a ByteDance cita como melhoria oficial "🔇 remove irrelevant subtitles and BGM" — otimização direta de resposta a negative prompts.

Use o bloco no final do prompt:
```
[Negative Prompts]: No exaggerated crying, no fast cuts, no large body movements, no extra dialogue, no BGM, no runny nose, no premature dropping of tears.
```

Boas práticas pro bloco de negative prompt:
- Liste a partir de **[som] + [legenda] + [comportamento] + [pontos fáceis de colapsar]**.
- Seja específico ao que a cena realmente arrisca errar (não uma lista genérica copiada de outra cena).
- Combine com os "Prohibited items" do formato de produção longa (seção 2) quando escrever vídeos de 30s+.

Isso não invalida totalmente boas práticas de descrição positiva — continue descrevendo o que quer que apareça primeiro. O negative prompt é um reforço complementar, não substituto da descrição positiva.

---

## 5. Idiomas suportados

O 2.5 ampliou fortemente o suporte a idiomas — não precisa mais traduzir para chinês/inglês. Prioridade de otimização: chinês, inglês, espanhol, indonésio, malaio. Cobertura completa também para: tailandês, árabe, português, vietnamita, japonês, coreano. Escreva o prompt no idioma mais natural para o conteúdo (ex.: diálogo em português quando fizer sentido para o público).

---

## 6. Checklist de pré-submissão (oficial ByteDance)

- O prompt declara claramente o sujeito e a ação/evento primário?
- Toda referência declara o que usar e o que não usar?
- Todo personagem/produto/prop distinto está nomeado e vinculado a uma referência?
- As referências são selecionadas por cena, não forçadas a aparecer todas ao mesmo tempo?
- Cada estágio de um vídeo longo tem apenas uma mudança primária e um end state claro?
- Número de personagens, roupa, posse de props e relações espaciais permanecem consistentes?
- Para edição de vídeo: o prompt define o "sole editing master", escopo de edição, quantidade de alvo e conteúdo a preservar?
- Emoções abstratas e termos de cinematografia vêm acompanhados de cues diretamente visíveis/audíveis?
- First/last frame e múltiplos keyframes têm um papel por imagem, e first/last usam o mesmo aspect ratio?
- Para storyboard: o prompt declara qual estrutura herdar? Para blockout: identificou coarse vs fine e especificou o que herdar (temporal, estrutural, material, estilo)?
- Video editing, first/last-frame e video extension seguem as regras de trava automática de aspect ratio/duração?
- Para video extension: verificou a imagem de fronteira, tendência de movimento e continuidade de áudio?
- Para one-click video: o prompt define papéis de material, ordem de imagem, quantidade de movimento, estilo de edição e áudio?
- Para transição sem costura: o prompt define o papel dos dois vídeos, ação de gatilho, processo de transição e estado de chegada?
