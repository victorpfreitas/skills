# Troubleshooting — Seedance 2.5

Problemas recorrentes e a correção direta pra cada um. Consulte quando o resultado sair fraco antes de reescrever o prompt do zero.

---

## Prompt ignora referências ou mistura personagens ("gêmeos")

- Confirme que cada personagem/prop/cena tem mapeamento individual explícito (`<Character A> corresponds to @Image 1`) — nunca "@Images 1-4 defnot four characters".
- Adicione a linha `Do not interchange the characters' appearances, clothing, actions, positions, or dialogue.`
- Acima de 5 sujeitos em imagens de referência, prefira uma view por imagem em vez de colagem multi-view numa imagem só (ver `PARAMETERS_AND_LIMITS.md` §1).

## Vídeo longo/multi-estágio perde consistência entre estágios

- Confirme que o bloco `[Maintain Consistency]` está presente no final.
- Confirme que cada estágio tem só **uma** mudança de estado primária — estágios sobrecarregados tendem a comprimir/pular eventos.
- Releia o `end state` do estágio anterior antes de escrever o próximo — ancore no que ficou definido, não na intenção original do roteiro.

## Timestamps não batem com o que foi pedido

- Lembre-se: faixas de tempo são orçamento, não corte exato — diferenças de até alguns décimos de segundo são esperadas.
- Faixa com conteúdo demais causa corte excessivo ou eventos omitidos — reduza o que cada faixa precisa cobrir.
- Não peça frequências dentro de uma faixa (ex.: "três ações em um segundo") — o modelo não trata timestamp como métrica de contagem.

## Video Editing não preserva o resto do vídeo

- Confirme que `[Source Video Role]` está declarado com @Video 1 como "sole editing master".
- Confirme que `[Content to Preserve]` lista explicitamente o que não pode mudar — sem essa lista o modelo tem mais liberdade do que o esperado.
- Lembre que aspect ratio e duração são travados automaticamente nesse workflow — não adianta tentar configurar via prompt.

## Video Extension quebra a continuidade no ponto de fronteira

- Confirme que a descrição do frame de fronteira vem **antes** da descrição do conteúdo novo, não depois.
- Extensão backward: confirme que materiais que só deveriam aparecer depois do vídeo fonte estão marcados como tal.
- Lembre que boundary frames se conectam naturalmente, não pixel a pixel — pequenas variações no ponto de conexão são esperadas.

## Seamless Transition não conecta bem os dois vídeos

- Confirme que `@Video 1`/`@Video 2` têm papel de "before"/"after" declarado.
- Confirme que a ação de gatilho, o movimento de câmera durante a transição, e o estado de chegada em `@Video 2` estão todos descritos — omitir qualquer um deles deixa a ponte ambígua.
- Não prometa preservação pixel-idêntica dos dois vídeos — a meta é continuidade visual/sonora, não corte idêntico.

## Blockout gera resultado rígido ou com interpretação errada da estrutura

- Confirme se identificou coarse vs fine antes de escrever — os dois pedem prompts diferentes.
- Coarse: evite braços/asas/apêndices na geometria a menos que a sequência de ação esteja completa.
- Fine: confirme que o material está limpo — linhas de trajeto, eixos de coordenada e frustums de câmera residuais confundem o modelo.

## Negative prompts não parecem funcionar

- Confirme que o bloco `[Negative Prompts]` está separado no final do prompt, não misturado dentro da descrição positiva.
- Seja específico ao risco real da cena, não uma lista genérica — negative prompt genérico tende a ser menos eficaz que um mirado no que a cena de fato arrisca errar.

## Prompt ultrapassa o limite de material/duração recomendado

- Revise `PARAMETERS_AND_LIMITS.md` — 30 imagens / 10 vídeos (≤30s total) / 10 áudios (≤30s total) / 50 materiais no total.
- Acima das faixas recomendadas (1-8 sujeitos em imagem, 1-5 em áudio/vídeo), espere estabilidade menor e talvez precisar de mais tentativas ("gacha").

## Áudio genérico, música indesejada, ou legenda aparecendo sem pedir

- Use o bloco `[Negative Prompts]` explicitamente: `No subtitles, no background music.` — o 2.5 responde muito melhor a essa instrução do que o 2.0.
- Para remover música mantendo voz num vídeo já existente, use o workflow de edição de áudio (`VIDEO_EDITING.md` §5), não regeneração do zero.

---

## Limitações conhecidas do 2.5 (não são bugs, são o teto atual do modelo)

- Timestamps alocam tempo para eventos; não são pontos de edição precisos por frame.
- Prompts de edição de vídeo aumentam a probabilidade de eventos críticos se alinharem com o vídeo fonte, mas não garantem sobreposição quadro a quadro.
- Para legendas, fórmulas, placas ou especificações de produto que precisam ser 100% exatas, combine referências preparadas + geração de vídeo + pós-produção — não confie só no prompt.
- Video editing trava aspect ratio e duração aproximada do vídeo de entrada; diferença de até ~0.3s é esperada.
- First/last-frame trava aspect ratio na primeira imagem; duração é configurável.
- Video extension trava aspect ratio do vídeo fonte; o volume de áudio do segmento estendido pode diferir levemente do original.
- One-click video: se ordem de imagem ou mapeamento de personagem importa, declare explicitamente — o modelo pode reorganizar por conta própria se não for dito o contrário.
- Seamless transitions visam continuidade visual/sonora, não preservação pixel-idêntica dos dois vídeos fonte.
