# Cenários e Props — Catalogação

Quando o personagem vive dentro de um universo recorrente (série, campanha com várias peças), cenários e props recebem o mesmo tratamento do personagem: tag única + descrição fixa, nunca texto livre reinventado a cada prompt.

---

## Cenário (`@LOC_...`)

Cada cenário catalogado precisa responder, numa descrição compacta (não um parágrafo longo — cenário tem menos risco de drift que personagem, então cabe em 2-4 linhas):

- **Elementos fixos obrigatórios** — o que precisa estar sempre presente pra o cenário ser reconhecível (um objeto, uma cor de parede, uma vista específica).
- **Tom de luz/clima** — se o cenário tem uma atmosfera padrão (ex.: "sempre golden hour", "sempre céu dramático pré-chuva"), declarar aqui pra não variar cena a cena sem motivo.
- **Identidade local**, se relevante ao projeto — um detalhe que ancora o cenário num lugar real ou numa cultura específica, quando isso for parte da narrativa (ex.: skyline reconhecível, elemento arquitetônico local).

Template:

```
`@LOC_NOME` — [1 linha de identificação do lugar]
[Elementos fixos obrigatórios, em prosa corrida]. **Tom:** [luz/clima padrão].
```

## Props (`@PROP_...`)

Prop recorrente (objeto que aparece em várias cenas, às vezes carregando peso narrativo) segue o mesmo padrão:

```
`@PROP_NOME` — [1 linha de identificação]
[Material, cor, textura, detalhe que não pode variar]. [Regra de uso, se houver
uma: ex. "sempre em múltiplos, nunca um só" ou "exclusivo de tal personagem"].
```

Regra de props narrativos (aqueles que carregam informação da história, não só decoração): declarar explicitamente o texto/detalhe exato que aparece neles (uma manchete, um símbolo, uma data) — prop narrativo com texto errado ou ilegível quebra a história tanto quanto o personagem sair diferente.

## Quando NÃO catalogar

Cenário ou prop que aparece uma vez só, sem função recorrente, não precisa de tag — isso é overhead sem benefício. Catalogar só o que se repete entre peças/episódios/gerações.

## Inventário rápido

Fechar a bíblia com uma tabela de referência única (personagens + cenários + props), pro time conseguir escanear rapidamente o que existe sem reler o documento inteiro:

```
| Tag | Tipo | Descrição rápida |
|---|---|---|
| @NOME | Personagem | ... |
| @LOC_NOME | Cenário | ... |
| @PROP_NOME | Prop | ... |
```
