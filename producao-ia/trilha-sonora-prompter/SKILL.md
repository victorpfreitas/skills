---
name: trilha-sonora-prompter
description: >
  Use esta skill sempre que Victor precisar decidir ou gerar a trilha sonora de um
  vídeo, separada dos clipes de imagem/vídeo gerados por IA. Trigger em qualquer
  pedido como "que música combina com essa cena", "gera uma trilha pra esse vídeo",
  "preciso de uma música de fundo", "cria o prompt de música", "qual trilha usar
  nessa sequência", ou quando um clipe do seedance-prompter (que sempre gera com
  `music: none`) precisa de música por fora. Traduz o tom/ritmo emocional já
  definido pelo diretor-cinematografico ou pelo roteiro em um prompt de geração de
  música (BPM, instrumentação, referência de artista/trilha), pronto para o
  vidiq_generate_music ou outra ferramenta de geração musical (Suno, Udio).
---

# Trilha Sonora Prompter

Você traduz a intenção emocional de uma cena ou vídeo em um prompt de geração de música: gênero, clima, instrumentação, tempo, sem depender de referência vaga tipo "algo tipo épico". O `seedance-prompter` sempre declara `music: none` no bloco de áudio dos clipes de vídeo — decisão deliberada de manter a trilha fora do prompt de vídeo — então essa é a skill que fecha essa ponta separadamente.

---

## Quando usar

Depois que o clipe (ou sequência de clipes) já foi gerado pelo `seedance-prompter`, ou junto com o roteiro/decupagem do `diretor-cinematografico`, quando chega a hora de decidir a trilha. Nunca durante a escrita do prompt de vídeo em si — música e vídeo são gerados por ferramentas separadas neste fluxo.

---

## Workflow

### 1. Ler a intenção emocional da cena

Antes de pensar em gênero musical, identifique o que a cena precisa emocionalmente — mesma leitura que o `diretor-cinematografico` já faz pra câmera e luz: o que muda no espectador do início ao fim do trecho, qual é o ritmo interno (tensão crescente, alívio, contemplação, urgência). Se o roteiro ou a decupagem já descrevem isso, reaproveite — não reinvente a leitura emocional do zero.

### 2. Traduzir emoção em parâmetros musicais

Monte o prompt com esta ordem (funciona melhor nessa sequência: gênero/estilo → clima → instrumentação → tempo/ritmo → vocal):

| Elemento | Pergunta a responder |
|---|---|
| Gênero/estilo | Que gênero carrega esse clima sem precisar de letra explicando (lo-fi, orquestral, synthwave, folk, trap instrumental)? |
| Clima | Que 2-3 adjetivos descrevem a sensação (tenso, nostálgico, triunfante, urgente)? |
| Instrumentação | Que instrumentos carregam esse clima (piano solo, cordas, bateria eletrônica, baixo synth)? |
| Tempo/ritmo | BPM aproximado e se o ritmo é constante ou tem crescendo |
| Vocal | Instrumental (padrão pra trilha de fundo) ou com voz — e em que idioma, se houver letra |

Referência de artista/trilha é opcional e só ajuda quando for um estilo reconhecível (ex.: "no estilo de Hans Zimmer" comunica mais que uma lista de adjetivos) — não force uma referência quando o clima já está claro sem ela.

### 3. Gerar

Use `vidiq_generate_music` com o prompt montado no passo 2, seguindo a ordem genre + mood + instrumentação + tempo + vocal. Regras da própria ferramenta:
- **Nunca usar negação** ("sem bateria") — não é suportado; descreva o que quer, não o que não quer (mesmo princípio do `seedance-prompter`: regra 1, "nunca use constraints negativos").
- Adicionar a palavra "instrumental" no prompt quando não quiser vocal.
- `durationSeconds` (10-180) é aproximado — a ferramenta é assíncrona (`mcpJobId`), poll com `vidiq_job_poll` até `completed` pra pegar a duração real e o link de download.
- Se o filtro de segurança do provedor bloquear o prompt, isso é comum mesmo em pedidos inofensivos — sugira UMA reformulação e espere a confirmação de Victor antes de tentar de novo.

### 4. Sincronizar com o ritmo do corte (se já houver montagem)

Se já existe uma referência de ritmo de corte (do `montagem-prompter` ou de uma decisão de edição), o tempo/BPM da trilha deve casar com esse ritmo — cortes rápidos pedem tempo mais alto ou crescendo, planos longos pedem tempo mais estável. Isso evita gerar uma trilha que depois não encaixa na montagem.

---

## Regras críticas

- Nunca escreva o prompt de música só olhando o tema do vídeo — a leitura emocional da cena vem primeiro, o gênero é consequência dela, não o ponto de partida.
- Nunca use negação no prompt de música — mesma regra do Seedance, e aqui é uma limitação técnica confirmada da ferramenta, não só boa prática.
- Uma trilha por vídeo/sequência, a menos que Victor peça variação explícita por bloco (ex.: intro vs. corpo vs. CTA).
- Sempre poll o job até `completed` antes de entregar o link — nunca prometa o áudio antes de confirmar que terminou.
