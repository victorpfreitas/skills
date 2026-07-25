# Por que as tags e a formatação funcionam

O `SKILL.md` diz quais tags usar e quando. Este arquivo explica o porquê, útil quando o roteiro tiver um caso que as regras não cobrem literalmente.

## 1. A tag condiciona só o trecho local, não o texto inteiro

Uma tag como `[excited]` afeta a entrega vocal do trecho logo depois dela, não o parágrafo inteiro nem o áudio como um todo. É por isso que a tag precisa ficar no início do trecho que deveria carregar aquela emoção. Uma tag solta no meio de um bloco, sem um trecho claro pra condicionar, se dilui e não muda a entrega.

## 2. Empilhar tags demais faz o modelo misturar entregas incompatíveis

Duas tags compatíveis no mesmo trecho (`[curious] [impressed]`) ainda dá pro modelo compor uma entrega coerente, é uma combinação, não uma disputa. O problema aparece a partir da terceira tag no mesmo trecho: o modelo não tem mais uma direção clara de qual emoção prevalece, e o resultado soa artificial, sem nenhuma das entregas pretendidas de fato aparecer. É por isso que a regra do `SKILL.md` limita a no máximo duas tags por trecho.

## 3. CAPS cria ênfase pelo contraste, não pelo volume

Ênfase em CAPS funciona porque destaca uma palavra em relação ao resto da frase que não está em CAPS. Se muitas palavras da mesma frase estiverem em CAPS, o contraste desaparece e a frase toda soa "gritada" no sentido prosódico, sem nenhuma palavra se destacar de fato, e o modelo passa a tratar a maiúscula como ruído, não como sinal. É por isso que a regra é 1-2 CAPS por frase: menos que isso, sem ênfase suficiente; mais que isso, ênfase nenhuma.

## 4. Pausas com reticências imitam padrão real de fala hesitante ou reflexiva

`…` funciona porque reproduz o jeito como as pessoas realmente pausam pra pensar ou respirar no meio de uma ideia. Pausa longa demais (um parágrafo inteiro tratado como uma respiração só) soa artificial porque ninguém fala assim. É por isso que `<break time="x.xs" />` não funciona bem no v3: é uma pausa mecânica, não uma pausa que nasce do texto e da pontuação.

## 5. A pontuação carrega parte do sinal prosódico

Vírgula, ponto final, reticências e travessão têm pesos de pausa diferentes pro modelo. Escrever um trecho corrido sem pontuação variada tira controle de ritmo do texto, o modelo não tem onde "respirar" mesmo que a ideia peça uma pausa ali.

## 6. Stability troca responsividade à tag por previsibilidade

O parâmetro Stability não é "mais ou menos emoção", é o quanto o modelo se permite desviar do padrão de voz treinado pra obedecer uma tag. Robust mantém a voz o mais perto possível do padrão, então basicamente ignora a tag (é por isso que o comportamento lembra o v2, que não tinha tags). Creative permite o desvio máximo, por isso responde mais forte às tags, mas o mesmo mecanismo que permite a tag "torcer" a entrega também permite ela alucinar um som que ninguém pediu. Natural é o meio-termo: desvia o suficiente pra tag fazer efeito, sem soltar a mão do padrão de voz.
