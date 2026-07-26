# Consistência entre Modelos

Um personagem geralmente precisa aparecer em mais de um modelo — imagem de referência num modelo, produção em outro, vídeo animado a partir da imagem. O problema: **cada modelo cita uma imagem de referência de personagem de um jeito diferente**, e misturar a sintaxe de um modelo com outro é uma causa comum de drift. Isso já é uma nota do `image-prompter`; aqui ela é aplicada especificamente ao caso de personagem recorrente.

---

## Convenção de referência por modelo

| Modelo | Como cita a imagem de referência do personagem |
|---|---|
| **Nano Banana 2** | Descrição natural ("Reference 1", "the character in the first image") — aceita até 5 personagens + 14 objetos por prompt. |
| **Seedream 5.0 Pro** | Referência **por descrição de conteúdo** ("o personagem de terno preto"), nunca por índice numérico — até 10 referências. |
| **GPT Image 2** | Descrição natural, similar ao Nano Banana — até 16 referências, boa transferência de personagem entre edições em lote. |
| **Seedance 2.0** (vídeo) | Tags explícitas `@Image1`, `@Image2`... — quando o usuário sobe imagens em sequência, cada uma vira uma tag numerada usada no prompt de vídeo (modo R2V). |

Nunca escreva `@Image1` num prompt de Nano Banana/Seedream/GPT Image 2 — essa sintaxe é exclusiva do Seedance. E nunca peça "reference 1" num prompt de Seedream — ele precisa da descrição de conteúdo, não de índice.

## O CHARACTER BLOCK é o que não muda

A parte que atravessa todos os modelos sem alteração é o **CHARACTER BLOCK** em si (ver `CHARACTER_BLOCK_TEMPLATE.md`) — a descrição fixa do personagem. O que muda entre modelos é só **como a imagem de referência é citada** ao lado desse bloco. Fluxo recomendado:

1. Gere a imagem de referência oficial do personagem uma vez (normalmente no Nano Banana, pela velocidade de iteração).
2. Ao gerar em outro modelo de imagem (Seedream, GPT Image 2), inclua o CHARACTER BLOCK completo + cite a referência na sintaxe daquele modelo especificamente.
3. Ao animar em Seedance, suba a imagem de referência aprovada, trate-a como `@Image1`, e ainda assim inclua o CHARACTER BLOCK no prompt de vídeo — a tag de imagem ajuda o modelo a ancorar visualmente, mas o bloco de texto continua sendo o que declara os traços inegociáveis que a imagem sozinha pode não deixar claro em todo ângulo/movimento.

## Continuidade entre clipes de vídeo (Seedance)

Quando o personagem aparece em vários clipes seguidos de uma sequência, ancore o próximo clipe no que **de fato** ficou no clipe anterior aprovado (o frame final, a pose, o estado do figurino), não na intenção original do CHARACTER BLOCK sozinha — mesma regra de continuidade que o `seedance-prompter` já aplica a clipes em sequência, só que aqui o "estado observado" é o do personagem especificamente (verificar se um acessório saiu de lugar, se a pose final do clipe anterior bate com a inicial do próximo).

## Erro mais comum: aplicar regra de um modelo em outro

Se um prompt de personagem sair estranho, o primeiro diagnóstico é: a sintaxe de referência usada bate com o modelo de destino? Um prompt escrito pensando em Nano Banana (referência por descrição solta) colado sem ajuste num prompt de Seedream frequentemente falha porque o Seedream exige que a referência seja descrita por conteúdo específico, não genérico.
