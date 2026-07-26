# Criando um Personagem Novo do Zero

Quando Victor traz só uma ideia solta ("preciso de um mascote pra campanha X", "quero um agente fixo pra série"), a identidade visual nasce em rodadas curtas — a mesma lógica de perguntar-antes-de-escrever do `roteirista-interativo`, aplicada ao visual em vez do texto. Nunca decidir tudo de uma vez e entregar um character sheet fechado sem checar cada camada com o Victor.

---

## A ordem importa

Cada camada restringe a próxima, então a ordem evita perguntas abertas demais:

```
1. Função        -- por que esse personagem existe (mascote de marca, protagonista
                     fixo de série, avatar de host)?
2. Silhueta       -- forma geral reconhecível a distância/em miniatura, antes de
                     qualquer detalhe (humano realista? proporção estilizada?
                     mascote com prop vestível como o keycap da Livelo?)
3. Traço inegociável -- o ÚNICO elemento que precisa sobreviver a toda geração,
                     mesmo que tudo em volta mude (um símbolo, uma cor exclusiva,
                     uma proporção incomum, um objeto que ele sempre carrega)
4. Sistema de cor/variantes -- se vai ter mais de uma versão (par masculino/
                     feminino, traje de trabalho/lazer), decidir agora o código
                     de cor que distingue cada variante
5. Nome e tag     -- nome do personagem + a tag técnica (@NOME_PERSONAGEM) que
                     vai aparecer em todo prompt daqui pra frente
```

## Por que "traço inegociável" vem antes do resto

É o elemento mais fácil de perder numa geração nova — se ele não for nomeado explicitamente e repetido em todo prompt, o modelo troca ele por algo genérico assim que a cena muda (ângulo de câmera diferente, cenário diferente, variante diferente). Exemplos de traço inegociável forte: o símbolo Livelo sempre em alto-relevo 3D nunca impresso; um tom de pele/textura de material exclusivo; uma proporção de corpo que não é humana padrão. Um traço fraco é aquele que pode ser descrito de várias formas sem perder a identidade ("uma roupa legal") — isso não segura consistência.

## Silhueta antes de detalhe

Pergunte primeiro pela forma reconhecível numa silhueta (contorno preto, sem detalhe interno) — se o personagem só é reconhecível pelo detalhe fino (textura de tecido, cor exata), ele não sobrevive a variações de luz/ângulo entre gerações. Um bom teste: "se eu tirar a cor e mostrar só o contorno, ainda dá pra saber que é esse personagem?".

## Sistema de variantes — decidir o código antes de criar a segunda versão

Se o personagem vai ter mais de uma versão (ex.: par masculino/feminino, traje de cada estação/cenário), decida agora:
- O que é **compartilhado** entre todas as variantes (a base que nunca muda).
- O que **muda por variante** (cor, acessório, cenário típico) e como isso fica visualmente óbvio (ex.: toda variante "resort" descalça e com acessório de praia).

Sem esse código definido antes, cada variante nova vira uma decisão isolada e a família de personagens perde coesão.

## Nome e tag

A tag técnica (`@NOME_PERSONAGEM`, em maiúsculas, sem espaço) é o que entra em todo prompt — decida ela junto com o nome comum, não depois. Convenção recomendada: `@[FUNÇÃO_OU_NOME]_[VARIANTE_SE_HOUVER]`, ex. `@CHAR_PONTO`, `@AGENTE_MIB_BR`.

## Depois do briefing

Assim que as 5 camadas estiverem fechadas, escreva o CHARACTER BLOCK formal (`CHARACTER_BLOCK_TEMPLATE.md`) e gere a primeira imagem de referência via `image-prompter` — essa imagem aprovada vira a fonte de verdade visual pra toda geração futura.
