---
name: thumbnail-titulo-otimizado
description: >
  Use esta skill sempre que Victor precisar gerar ou decidir a thumbnail e o título
  finais de um vídeo antes de publicar. Trigger em qualquer pedido como "gera a
  thumbnail desse vídeo", "cria títulos pra esse vídeo", "qual desses títulos é
  melhor", "pontua essa thumbnail", "melhora essa thumbnail", "preciso do título
  final", ou quando há um vídeo pronto e falta decidir a capa/nome antes de subir.
  Usa as ferramentas vidIQ de gerar e pontuar thumbnail/título pra fechar o loop
  gerar → pontuar → ajustar → só publicar quando a combinação estiver boa, em vez
  de decidir no olho.
---

# Thumbnail e Título Otimizados

Você decide a capa e o nome de um vídeo com dado de CTR, não no olho. O objetivo é fechar o loop **gerar → pontuar → ajustar → publicar**, nunca gerar uma vez e aceitar de primeira.

---

## Workflow

### 1. Título — gerar e pontuar

Chame `vidiq_generate_titles` com o `videoId` (se já existe no YouTube) ou `title`/`description` do vídeo. Passe:
- `language: "pt-BR"` (a menos que o vídeo seja em outro idioma).
- `type: "long"` ou `"short"` conforme o formato.
- `previousTitles`, se Victor tiver títulos recentes do canal, pra evitar repetição de padrão.

A ferramenta já vem com score embutido, mas para comparar variações escritas por Victor (não só as geradas), rode `vidiq_score_title` uma a uma. Nunca decida por "gosto mais desse" sem olhar o score — mas também não escolha só pelo número mais alto se ele soar clickbait fora do que o vídeo entrega.

### 2. Thumbnail — gerar

Chame `vidiq_generate_thumbnail`. Sempre passe `title` (o título já escolhido no passo 1 — thumbnail e título são lidos juntos pelo espectador, não separadamente) e, quando existir, `subjectImage` (foto da pessoa que deve ser o rosto principal) e `referenceImages` (thumbnails de estilo pra emular, até 10).

Sempre incluir o `imageUrl` retornado na resposta pro Victor poder abrir/salvar — o preview inline não é baixável.

### 3. Thumbnail — pontuar

Chame `vidiq_score_thumbnail` com `videoId` + `title`, ou passando a imagem gerada em `image` se o vídeo ainda não estiver no YouTube. Leia o score e o feedback detalhado (pontos fortes e a melhorar).

**Trate o score como estimativa, não veredito** — não regenerar só pra subir o número, e não liderar a resposta pro Victor com o número puro sem contexto.

### 4. Iterar — uma mudança por vez

Se o score ou o feedback apontar problema específico, use `vidiq_refine_thumbnail` (não gere do zero de novo): passe a thumbnail atual em `sourceThumbnail` e descreva **uma mudança concreta** em `instructions` (ex.: "aumenta o texto", "muda o fundo pra um estádio"). Passar `feedback` do `vidiq_score_thumbnail` pro `vidiq_generate_thumbnail` também é válido quando o ajuste é maior que um refino pontual.

Regra de iteração: uma variável por rodada — ou o texto, ou o fundo, ou a expressão do rosto, nunca várias ao mesmo tempo. Senão não dá pra saber o que melhorou o CTR.

### 5. Critério de parar

Não existe nota "perfeita" — pare de iterar quando:
- O score estiver numa faixa boa pro nicho (não existe threshold universal; comparar com o score de vídeos de referência do próprio canal ajuda a calibrar o "bom o suficiente").
- Ou depois de ~2-3 rodadas de refino sem ganho — nesse ponto o problema provavelmente é o conceito, não o ajuste fino, e vale voltar pro passo 2 com uma direção criativa diferente.

---

## Regras críticas

- Título e thumbnail nunca são avaliados isolados — sempre gerar/pontuar o título primeiro, ele entra como contexto de todo o resto.
- Sempre devolver o `imageUrl` de qualquer thumbnail gerada ou refinada.
- Nunca inventar um score — se a ferramenta falhar ou não retornar nota, diga isso, não estime um número.
- Evitar refinar mais de 3 vezes seguidas sem checar se o conceito (não o detalhe) é o problema.
