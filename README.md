# skills

O método que uso em produção pra dirigir IA generativa: roteiro, cinematografia e voz, condensados em skills reutilizáveis.

## A ideia

IA generativa não substitui direção. Ela precisa de alguém guiando o processo: decidindo o enquadramento, o tom do roteiro, a luz da cena, o timbre da voz. Sem direção, um modelo gera conteúdo genérico. Com direção, ele vira ferramenta de produção real.

Este repositório é esse método, aberto. Não são prompts soltos, é o raciocínio de roteirista, diretor de fotografia e produtor que uso todo dia, escrito como skills reutilizáveis. O que está aqui é o que eu de fato uso, não uma versão de vitrine.

Funciona com qualquer agente que suporte skills em Markdown (Claude Code, Codex e outros).

## Skills

| Skill | Categoria | O que faz |
| --- | --- | --- |
| [`diretor-cinematografico`](./direcao/diretor-cinematografico) | Direção | Decupagem, shot list, câmera, lente, luz, cor e blocking. Traduz roteiro em linguagem visual pronta para geração de vídeo com IA. |
| [`nano-banana-prompter`](./producao-ia/nano-banana-prompter) | Produção IA | Gera prompts cinematográficos para Nano Banana 2 (Gemini Image): storyboards, grids de imagem, composições de foto/cinema. |
| [`seedance-prompter`](./producao-ia/seedance-prompter) | Produção IA | Transforma ideia, cena ou referência visual em prompts de vídeo prontos para o Seedance 2.0. |
| [`elevenlabs-voiceover`](./producao-ia/elevenlabs-voiceover) | Produção IA | Formata roteiro em voice-over com tags emocionais do ElevenLabs Eleven v3, pronto para narração. |
| [`roteirista-interativo`](./roteiro/roteirista-interativo) | Roteiro | Roteirista que constrói roteiro, escaleta ou cena em conjunto, bloco por bloco, perguntando antes de escrever cada parte. |

## Como usar

**No Claude Code**, o repo é também um plugin marketplace: instala uma vez e atualiza sozinho a cada mudança.

```
/plugin marketplace add victorpfreitas/skills
/plugin install victorpfreitas-skills@victorpfreitas
```

Depois de instalado, os skills disparam pelo contexto da conversa (ex.: "monta a decupagem dessa cena", "formata esse roteiro pro elevenlabs"), sem precisar chamar por nome.

**Em qualquer outro agente** (Codex, etc.), basta apontar para a pasta do skill desejado ou colar o conteúdo do `SKILL.md`. São arquivos Markdown puros, sem dependência de nenhuma plataforma.

## Licença

MIT. Veja [LICENSE](./LICENSE).

---

Um método de [Victor Freitas](https://madebyhuman.com.br/victor) ([@victorpfreitas](https://x.com/victorpfreitas)), direção criativa com IA na **[Made by Human](https://madebyhuman.com.br/victor)**.
