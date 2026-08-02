# Changelog

## v0.5 (2026-08-02)

- Adiciona **`seedance-25-prompter`** em `producao-ia/`, skill nova e separada de `seedance-prompter` (2.0) para o Dreamina Seedance 2.5. O 2.5 diverge estruturalmente do 2.0 — sintaxe nova de prompt (`()`/`<>`/`{}`/`【】`), negative prompts passam de proibidos para recomendados, limites de referência sobem de 9 imagens/3 vídeos para até 50 materiais, e surgem workflows sem equivalente no 2.0 (video editing, video extension, seamless transitions entre vídeos, blockout, vídeo longo nativo de 30–180s). `seedance-prompter` (2.0) permanece intocado. Inclui 12 reference files extraídos dos guias oficiais ByteDance/Dreamina.
- Adiciona **`README.en.md`**, tradução em inglês do README, com link cruzado no topo dos dois arquivos. As skills continuam só em português — é a primeira etapa de um possível repositório bilíngue.

## v0.4 (2026-07-26)

- Adiciona **`biblia-personagem`** em `producao-ia/`: generaliza o padrão de fonte-de-verdade de personagens/cenários/props usado na skill de campanha `livelo` pra qualquer projeto novo — cria personagem do zero (workflow de perguntas) ou documenta um já existente, com regras de consistência entre Nano Banana 2, Seedream 5.0 Pro, GPT Image 2 e Seedance 2.0. Inclui 4 reference files: criação de personagem novo, template de CHARACTER BLOCK, catalogação de cenários/props, consistência multimodelo e troubleshooting.
- Reescreve `trilha-sonora-prompter` com o **Suno** como saída padrão (era só `vidiq_generate_music`, que Victor não usa no dia a dia): novo `references/SUNO.md` com a fórmula de style prompt, meta tags de estrutura e o campo Exclude. O `vidiq_generate_music` continua documentado como alternativa pra gerar direto na conversa.

## v0.3 (2026-07-26)

- Adiciona 4 skills novas em `producao-ia/`, fechando as pontas antes e depois do fluxo existente (roteiro → direção → geração):
  - `pesquisa-de-conteudo` — valida se uma ideia de vídeo tem demanda antes de roteirizar.
  - `trilha-sonora-prompter` — traduz o tom emocional de uma cena em prompt de música, para trilhas separadas dos clipes de vídeo (`seedance-prompter` sempre gera com `music: none`).
  - `montagem-prompter` — decide ritmo de corte, transições, sincronia com a trilha e legenda ao montar os clipes gerados.
  - `thumbnail-titulo-otimizado` — fecha o loop gerar → pontuar → ajustar de thumbnail/título antes de publicar.

## v0.2 (2026-07-25)

- `nano-banana-prompter` deu lugar a **`image-prompter`**: uma skill só de geração de imagem, cobrindo Nano Banana 2, Seedream 5.0 Pro e GPT Image 2, com uma seção de decisão ("qual modelo usar") e um reference file por modelo.

## v0.1 (2026-07-23)

Lançamento inicial com 5 skills:

- `diretor-cinematografico`
- `nano-banana-prompter`
- `seedance-prompter`
- `elevenlabs-voiceover`
- `roteirista-interativo`
