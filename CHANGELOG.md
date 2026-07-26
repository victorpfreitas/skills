# Changelog

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
