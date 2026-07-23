# skills

Claude Code Skills que uso em produção como diretor criativo trabalhando com IA generativa.

## Por que isso existe

IA generativa não substitui direção — ela precisa de alguém guiando o processo: decidindo o enquadramento, o tom do roteiro, a luz da cena, o timbre da voz. Sem direção, um modelo gera conteúdo genérico. Com direção, ele vira ferramenta de produção real.

Esses skills são o método que uso pra dirigir esse processo com o Claude Code — não prompts soltos, mas o raciocínio de roteirista, diretor de fotografia e produtor condensado em skills reutilizáveis. Publico aqui o que uso de verdade, não uma versão de vitrine.

Mais sobre o trabalho em [madebyhuman.com.br/victor](https://madebyhuman.com.br/victor).

## Skills

| Skill | Categoria | O que faz |
| --- | --- | --- |
| [`diretor-cinematografico`](./direcao/diretor-cinematografico) | Direção | Decupagem, shot list, câmera, lente, luz, cor e blocking — traduz roteiro em linguagem visual pronta para geração de vídeo com IA. |
| [`nano-banana-prompter`](./producao-ia/nano-banana-prompter) | Produção IA | Gera prompts cinematográficos para Nano Banana 2 (Gemini Image) — storyboards, grids de imagem, composições de foto/cinema. |
| [`seedance-prompter`](./producao-ia/seedance-prompter) | Produção IA | Transforma ideia, cena ou referência visual em prompts de vídeo prontos para o Seedance 2.0. |
| [`shotlist-builder`](./producao-ia/shotlist-builder) | Produção IA | A partir de um roteiro completo, monta o shotlist de produção com prompts Seedance por cena. |
| [`elevenlabs-voiceover`](./producao-ia/elevenlabs-voiceover) | Produção IA | Formata roteiro em voice-over com tags emocionais do ElevenLabs Eleven v3, pronto para narração. |
| [`roteirista`](./roteiro/roteirista) | Roteiro | Roteirista para curta, longa, série, Reels, comerciais e documentários — cena, diálogo, escaleta e arco de personagem. |
| [`roteirista-interativo`](./roteiro/roteirista-interativo) | Roteiro | Constrói o roteiro em conjunto, bloco por bloco, perguntando antes de escrever cada parte. |

## Instalação

Este repositório é um [Claude Code Plugin Marketplace](https://code.claude.com/docs/en/plugin-marketplaces). Adicione uma vez e os skills ficam disponíveis — e se atualizam sozinhos a cada mudança no repo.

```
/plugin marketplace add victorpfreitas/skills
/plugin install victorpfreitas-skills@victorpfreitas
```

Depois de instalado, os skills disparam automaticamente pelo contexto da conversa (ex.: "monta a decupagem dessa cena", "cria um roteiro para Reels"), sem precisar chamar por nome.

## Licença

MIT — veja [LICENSE](./LICENSE).

---

Victor Freitas, Made by Human · [madebyhuman.com.br/victor](https://madebyhuman.com.br/victor)
