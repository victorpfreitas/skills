---
name: trilha-sonora-prompter
description: >
  Use esta skill sempre que Victor precisar decidir ou gerar a trilha sonora de um
  vídeo, separada dos clipes de imagem/vídeo gerados por IA. Trigger em qualquer
  pedido como "que música combina com essa cena", "gera um prompt de trilha pro
  Suno", "preciso de uma música de fundo", "cria o prompt de música", "qual trilha
  usar nessa sequência", "monta o style prompt do Suno", ou quando um clipe do
  seedance-prompter (que sempre gera com `music: none`) precisa de música por
  fora. Traduz o tom/ritmo emocional já definido pelo diretor-cinematografico ou
  pelo roteiro em um prompt de geração de música pronto pra colar no Suno (style
  field + meta tags de estrutura), com o vidiq_generate_music como alternativa
  quando a geração precisa acontecer direto na conversa.
---

# Trilha Sonora Prompter

Você traduz a intenção emocional de uma cena ou vídeo em um prompt de geração de música: gênero, clima, instrumentação, tempo — nunca uma referência vaga tipo "algo tipo épico". O `seedance-prompter` sempre declara `music: none` no bloco de áudio dos clipes de vídeo (decisão deliberada de manter a trilha fora do prompt de vídeo), então essa é a skill que fecha essa ponta separadamente. Victor gera a trilha no **Suno** normalmente — essa é a saída padrão desta skill. O `vidiq_generate_music`, disponível direto nesta conversa, é a alternativa pra quando a geração precisa acontecer sem sair do chat.

---

## Arquivos de referência

| Arquivo | Quando ler |
|---|---|
| `references/SUNO.md` | Sempre antes de montar o style prompt final — fórmula de descritores, lista de meta tags de estrutura, campo Exclude, e os cuidados específicos do Suno (negação limitada, placement no final) |

---

## Quando usar

Depois que o clipe (ou sequência de clipes) já foi gerado pelo `seedance-prompter`, ou junto com o roteiro/decupagem do `diretor-cinematografico`, quando chega a hora de decidir a trilha. Nunca durante a escrita do prompt de vídeo em si — música e vídeo são gerados por ferramentas separadas neste fluxo.

---

## Workflow

### 1. Ler a intenção emocional da cena

Antes de pensar em gênero musical, identifique o que a cena precisa emocionalmente — mesma leitura que o `diretor-cinematografico` já faz pra câmera e luz: o que muda no espectador do início ao fim do trecho, qual é o ritmo interno (tensão crescente, alívio, contemplação, urgência). Se o roteiro ou a decupagem já descrevem isso, reaproveite — não reinvente a leitura emocional do zero.

### 2. Montar o style prompt (campo "Style of Music" do Suno)

Leia `references/SUNO.md` pra fórmula completa. Resumo: `[Gênero/subgênero], [Tempo/energia/BPM], [Instrumentos-chave], [Estilo vocal], [Produção/clima], [Modificadores]` — 4 a 8 descritores, separados por vírgula (o Suno lê melhor tags separadas do que parágrafo corrido), gênero e tipo de vocal logo no início.

### 3. Decidir estrutura (campo "Lyrics", se a trilha tiver seções/letra)

Trilha de fundo pura costuma ser só o style prompt + `instrumental` no fim, sem preencher o campo de letra. Quando a peça precisa de seções marcadas (intro/build/drop, ou tem hook cantado), use meta tags em colchetes (`[Intro]`, `[Build]`, `[Chorus]`, `[Outro]`) — ver a lista em `references/SUNO.md`.

### 4. Exclusões — o que não deve entrar

Ao contrário do Seedance (onde negação nunca funciona), o Suno aceita exclusão limitada, mas com regras próprias: veja `references/SUNO.md` pra saber quando usar o campo dedicado **Exclude** (mais confiável) versus escrever a exclusão no fim do próprio style prompt.

### 5. Sincronizar com o ritmo do corte (se já houver montagem)

Se já existe uma referência de ritmo de corte (do `montagem-prompter` ou de uma decisão de edição), o tempo/BPM da trilha deve casar com esse ritmo — cortes rápidos pedem tempo mais alto ou crescendo, planos longos pedem tempo mais estável. Isso evita gerar uma trilha que depois não encaixa na montagem.

### 6. Entregar

Formato de entrega padrão (pronto pra colar no Suno em modo Custom):

```
## Trilha: [nome da cena/vídeo]

**Style of Music:**
[gênero/subgênero], [tempo/BPM], [instrumentos], [vocal], [clima/produção], [modificadores]

**Exclude (se aplicável):**
[o que remover, campo dedicado ou inline no fim do style, ver SUNO.md]

**Lyrics (se aplicável):**
[meta tags de estrutura + letra, ou "instrumental" se não houver]
```

### Alternativa — gerar direto na conversa via vidIQ

Se Victor pedir pra gerar o áudio sem sair do chat (em vez de levar o prompt pro Suno), use `vidiq_generate_music`:
- Monte o prompt na mesma ordem — gênero + clima + instrumentação + tempo + vocal — mas **nunca use negação** aqui: ao contrário do Suno, o `vidiq_generate_music` não suporta frase negativa ("sem bateria") de forma nenhuma; descreva só o que quer, acrescente "instrumental" quando não quiser vocal.
- `durationSeconds` (10-180) é aproximado — a ferramenta é assíncrona (`mcpJobId`), poll com `vidiq_job_poll` até `completed` pra pegar a duração real e o link de download.
- Se o filtro de segurança do provedor bloquear o prompt, isso é comum mesmo em pedidos inofensivos — sugira UMA reformulação e espere a confirmação de Victor antes de tentar de novo.

---

## Regras críticas

- Nunca escreva o prompt de música só olhando o tema do vídeo — a leitura emocional da cena vem primeiro, o gênero é consequência dela, não o ponto de partida.
- Suno e vidIQ tratam negação de forma diferente — não misture a regra de um com o outro (ver `references/SUNO.md` pro detalhe do Suno; vidIQ nunca aceita negação).
- Uma trilha por vídeo/sequência, a menos que Victor peça variação explícita por bloco (ex.: intro vs. corpo vs. CTA).
- Sempre entregar o prompt pronto pra colar (no Suno) ou pollar o job até `completed` antes de entregar o link (no vidIQ) — nunca prometa o áudio antes de confirmar que terminou.
