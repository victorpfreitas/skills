# Troubleshooting: ElevenLabs Eleven v3

Problemas recorrentes e a correção direta pra cada um.

## Soa robótico apesar das tags

- Geralmente falta variação de pontuação e pausa dentro do bloco, não só tag emocional. Releia o trecho procurando frases corridas sem `…`, vírgula ou quebra.
- Confirme que a tag está no início do trecho que deveria carregá-la, não solta no meio de um parágrafo maior (ver `MODEL_MECHANICS.md`, item 1).

## A tag parece ignorada, ou a emoção errada aparece

- A tag provavelmente está longe demais do texto que deveria carregar, ou competindo com outra tag no mesmo parágrafo. Separe em dois blocos curtos se precisar de duas emoções diferentes em sequência.

## Pausa longa demais, ritmo arrastado

- Excesso de `…` no mesmo trecho, ou linhas em branco demais separando blocos pequenos. Reduza pra uma pausa por ideia, não por frase.

## Ênfase não aparece no CAPS

- Mais de 3 CAPS no mesmo bloco: o contraste desaparece (ver `MODEL_MECHANICS.md`, item 3). Reduza pra 1-3.
- CAPS numa palavra funcional (artigo, preposição) em vez de palavra de conteúdo (substantivo, número, nome técnico). Mova o CAPS pra palavra que carrega o impacto.

## Termo técnico ou sigla lida errado

- Adicione pontuação ou hífen pra ajudar o modelo a segmentar a palavra.
- Se for uma palavra-chave central do vídeo, teste com CAPS pra reforçar.

## Quer ajustar sem regravar tudo

Mude **uma variável por vez** antes de gerar de novo: uma tag, a pontuação de um trecho específico, ou o Stability (Natural ↔ Creative). Nunca as três juntas, senão não dá pra saber o que resolveu (mesma disciplina usada no `seedance-prompter` e no `image-prompter` deste repositório).
