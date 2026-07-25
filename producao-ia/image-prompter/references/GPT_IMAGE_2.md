# GPT Image 2 (OpenAI)

## Specs

- **Aspect ratio:** 3:1 a 1:3
- **Resolução:** 2K nativa, 4K em beta
- **Referências:** até 16 imagens, com boa transferência de personagem, marca e material entre edições
- **Forças:** texto/tipografia quase perfeita, layout limpo, mockup de UI, composição de produto, edição cirúrgica, lote de imagens coerentes

## Diferencial 1: texto de altíssima fidelidade

Renderiza texto com ~95-99% de acurácia em múltiplos scripts, incluindo títulos longos, parágrafos densos e rótulos pequenos de embalagem/UI. É o mais forte dos três nisso, prefira GPT Image 2 sempre que o pedido tiver texto extenso ou legibilidade crítica (placa de loja, capa de produto, slide, infográfico).

## Diferencial 2: lote de imagens coerentes

Gera até 8 imagens coerentes a partir de um único prompt, com continuidade de personagem e objeto entre elas. É um mecanismo diferente do grid-em-um-prompt-só do Nano Banana: aqui são imagens separadas de uma série, não painéis de uma imagem única.

```
Generate a coherent set of 4 images of the same young chef in a white 
double-breasted jacket, consistent face and outfit across all four: 
(1) plating a dessert close-up, (2) tasting from a spoon mid-kitchen, 
(3) wide shot walking through the kitchen line, (4) portrait looking 
directly at camera, arms crossed. Same lighting setup and color grade 
across the set: warm tungsten kitchen light, shallow depth of field.
```

## Diferencial 3: edição com alta estabilidade de pixel

Ao editar uma imagem existente, muda só a região pedida e mantém o resto do frame estável, sem o restante "regenerar" junto. Bom pra ajuste fino em asset já aprovado (trocar só um produto, só um texto, só uma cor) sem risco de a composição inteira mudar de novo.

## Thinking Mode (lado criativo, sem busca externa)

Antes de renderizar, o modelo raciocina sobre composição, contagem de objetos, luz e restrições. Isso reduz reroll em briefings com muitas instruções simultâneas (ex.: "3 pessoas, 2 delas sentadas, uma de pé atrás, cada uma segurando um objeto diferente, luz vindo de duas fontes"). Esta skill usa só esse lado de seguir instrução complexa. O Thinking Mode também suporta busca na web pra conteúdo fact-grounded (infográfico com dado real), o que fica fora do escopo desta skill.

## Onde usar

- Texto/tipografia extenso ou crítico (placa, capa, slide, embalagem)
- Mockup de UI e composição de produto densa em elementos
- Série de imagens com continuidade de personagem (lote de até 8)
- Frame pronto pra virar vídeo: um still gerado aqui pode entrar direto como referência no modo I2V do `seedance-prompter`

## Exemplo forte: mockup de UI com texto denso

```
Generate a clean mobile app UI mockup, fintech dashboard screen, minimalist 
design, soft neutral background. Header reads "Monthly Overview" in bold 
sans-serif. Below it, three stacked cards, each with a label and value: 
"Income: $4,230.00", "Expenses: $2,115.50", "Savings: $2,114.50", each 
in a clean sans-serif font, high contrast, precise alignment. Bottom 
navigation bar with four icons labeled "Home", "Cards", "Insights", 
"Profile". Flat design, no gradients, aspect ratio 9:16.

Avoid: misspelled text, misaligned labels, decorative fonts, clutter.
```
