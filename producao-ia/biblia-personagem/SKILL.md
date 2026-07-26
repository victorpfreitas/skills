---
name: biblia-personagem
description: >
  Use esta skill sempre que Victor precisar criar um personagem novo com consistência
  visual entre gerações de imagem/vídeo, ou documentar um já decidido numa bíblia de
  produção. Trigger em: "cria um personagem novo pra essa campanha", "personagem fixo
  pra série", "monta a bíblia desse personagem", "character sheet", "documenta esse
  personagem pra manter consistência", "esse personagem tá saindo diferente a cada
  geração", "cria o mascote da marca", ou qualquer personagem (mascote, protagonista
  de série, avatar de marca) que apareça em várias gerações e precise parecer sempre
  a mesma entidade. Generaliza o padrão da skill de campanha `livelo` pra qualquer
  projeto novo, e cobre também criar o personagem do zero, não só documentar um
  pronto. Sempre combinar com `image-prompter` ou `seedance-prompter` na hora de gerar.
---

# Bíblia de Personagem

Você é **co-diretor de arte** responsável por manter um personagem visualmente idêntico em toda geração de imagem ou vídeo, não importa quantas vezes ele for recriado, por qual modelo, ou em qual cenário. Uma bíblia de personagem é o documento de referência único que qualquer prompt de imagem/vídeo consulta antes de descrever esse personagem — nunca se descreve o personagem de improviso.

Esta skill cobre dois modos de trabalho:

- **Criar um personagem novo** — Victor tem só uma ideia solta ("quero um mascote pra essa campanha", "preciso de um agente fixo pra série") e a bíblia nasce junto com o design.
- **Documentar um personagem já decidido** — o visual já existe (referência de imagem, descrição informal, personagem de uma campanha anterior) e falta consolidar numa bíblia formal antes de escalar produção.

---

## Arquivos de referência

| Arquivo | Quando ler |
|---|---|
| `references/CRIANDO_PERSONAGEM_NOVO.md` | Sempre que o personagem ainda não existe — workflow de perguntas pra desenhar a identidade visual do zero |
| `references/CHARACTER_BLOCK_TEMPLATE.md` | Na hora de escrever a ficha formal de qualquer personagem — template do bloco word-for-word + dois exemplos preenchidos (mascote vestível e humano realista) |
| `references/CENARIOS_PROPS.md` | Quando o personagem precisar de cenários e props catalogados junto (série, campanha) — como taggear e documentar sem depender de descrição livre |
| `references/CONSISTENCIA_MULTIMODELO.md` | Antes de gerar em mais de um modelo (Nano Banana, Seedream, GPT Image 2, Seedance) — cada um lê referência de personagem de um jeito diferente |
| `references/TROUBLESHOOTING.md` | Quando o personagem sair diferente entre gerações — sintoma → causa → correção |

---

## Regra #1 — nunca descrever o personagem em texto livre

Descrição solta ("um cara vestindo uma roupa preta") faz o modelo reinterpretar o personagem a cada geração. A bíblia existe pra impedir isso. Sempre:

- Dar ao personagem uma **tag única** (`@NOME_PERSONAGEM`), nunca se refira a ele só pelo nome comum na hora de montar o prompt.
- Escrever um **CHARACTER BLOCK** fixo (ver `CHARACTER_BLOCK_TEMPLATE.md`) e colar **word-for-word** em todo prompt que use esse personagem — nunca resumir, nunca parafrasear.
- Fechar com a frase `"Reproduce exactly as @image reference. Do not reinterpret."` quando houver imagem de referência do personagem já aprovada.

## Regra #2 — todo traço distintivo precisa de uma frase que force a distinção

Um personagem quase-genérico (silhueta humana comum, roupa comum) vaza pra "qualquer pessoa parecida" já na segunda geração. A bíblia precisa nomear explicitamente **o que nunca pode variar** — um símbolo, uma proporção incomum, uma cor exclusiva, uma textura de material — e repetir isso em CAPS ou com "CRITICAL, DO NOT REINTERPRET" no bloco. Ver exemplos em `CHARACTER_BLOCK_TEMPLATE.md`.

## Regra #3 — variantes do mesmo personagem herdam o bloco base, não recriam do zero

Quando o personagem tem versões (traje de praia, traje de trabalho, variante feminina/masculina de um mesmo par) a bíblia declara um **bloco base compartilhado** (o que nunca muda entre variantes) e depois só a **diferença** de cada variante (roupa, acessório, cenário típico). Isso evita que uma variante divirja no que deveria ser idêntico entre elas.

---

## Workflow

### Modo A — Criar personagem novo

1. Leia `references/CRIANDO_PERSONAGEM_NOVO.md` e conduza o briefing em rodadas curtas (não decida tudo de uma vez) — função do personagem, silhueta/proporção, traço distintivo inegociável, sistema de cor/variantes, nome e tag.
2. Assim que a identidade estiver fechada, escreva o CHARACTER BLOCK formal (`CHARACTER_BLOCK_TEMPLATE.md`).
3. Gere a primeira imagem de referência do personagem via `image-prompter`, usando o CHARACTER BLOCK recém-escrito como o próprio prompt.
4. Depois de aprovada essa imagem, ela vira a referência visual oficial — toda geração futura cita essa imagem com `"Reproduce exactly as @image reference"`.

### Modo B — Documentar personagem existente

1. Reúna o que já existe (imagem de referência, descrição informal, personagem de campanha anterior) e organize no CHARACTER BLOCK formal — não invente traços novos, só formalize o que já foi decidido.
2. Se o personagem tiver cenários/props recorrentes (série, campanha), catalogue com `references/CENARIOS_PROPS.md`.
3. Preencha o checklist de consistência abaixo antes de considerar a bíblia pronta.

### Nos dois modos — antes de qualquer geração de produção

1. Leia `references/CONSISTENCIA_MULTIMODELO.md` pra saber como citar a referência do personagem no modelo escolhido (a sintaxe muda entre Nano Banana, Seedream, GPT Image 2 e Seedance).
2. Monte o prompt combinando o CHARACTER BLOCK + cenário/prop (se houver) + a fórmula do `image-prompter` ou `seedance-prompter`.
3. Rode o checklist de consistência abaixo.
4. Se o resultado sair divergente, use `references/TROUBLESHOOTING.md` antes de tentar de novo.

---

## Checklist de consistência

- [ ] Personagem tem tag única (`@NOME`) — nunca citado só pelo nome comum no prompt.
- [ ] CHARACTER BLOCK colado word-for-word, não resumido.
- [ ] Traço distintivo inegociável está declarado em CAPS/CRITICAL no bloco.
- [ ] Se há variantes, o bloco base compartilhado está separado da diferença específica da variante.
- [ ] `"Reproduce exactly as @image reference. Do not reinterpret."` presente quando já existe imagem de referência aprovada.
- [ ] A convenção de citar a referência bate com o modelo usado nesta geração (ver `CONSISTENCIA_MULTIMODELO.md`).
- [ ] Estilo visual master do projeto (se houver, ex.: paleta de cor, câmera, grain) appendado no final do prompt.

---

## Combinações

- **`image-prompter`** — gera a imagem de referência do personagem e as imagens de produção subsequentes.
- **`seedance-prompter`** — anima o personagem em vídeo, usando `@Image1`/`@Image2`... pra R2V (ver `CONSISTENCIA_MULTIMODELO.md`).
- **`roteirista-interativo`** (referência de construção de personagem narrativo, arquivo `personagem` dentro de `references/` daquela skill) — essa é a camada narrativa (função na história, desejo, flaw, voz). A bíblia de personagem aqui é a camada **visual** (como ele se parece). Um personagem fixo de série normalmente precisa das duas: a narrativa decide quem ele é, esta skill decide como ele nunca deixa de parecer o mesmo.
