# Por que as tags e a formatação funcionam

O `SKILL.md` diz quais tags usar e quando. Este arquivo explica o porquê, útil quando o roteiro tiver um caso que as regras não cobrem literalmente.

## 1. A tag condiciona só o trecho local, não o texto inteiro

Uma tag como `[excited]` afeta a entrega vocal do trecho logo depois dela, não o parágrafo inteiro nem o áudio como um todo. É por isso que a tag precisa ficar no início do trecho que deveria carregar aquela emoção. Uma tag solta no meio de um bloco, sem um trecho claro pra condicionar, se dilui e não muda a entrega.

## 2. Empilhar tags no mesmo trecho faz o modelo misturar duas entregas ao mesmo tempo

Se duas tags emocionais competem no mesmo trecho curto, o modelo tenta atender as duas ao mesmo tempo, e o resultado soa artificial, nem uma coisa nem outra. É por isso que a regra do `SKILL.md` limita tags seguidas: cada trecho carrega uma entrega emocional só, a próxima tag vem depois que a primeira já teve espaço pra soar.

## 3. CAPS cria ênfase pelo contraste, não pelo volume

Ênfase em CAPS funciona porque destaca uma palavra em relação ao resto da frase que não está em CAPS. Se o bloco inteiro (ou muitas palavras) estiver em CAPS, o contraste desaparece e a frase toda soa "gritada" no sentido prosódico, sem nenhuma palavra se destacar de fato. É por isso que a regra é 1-3 CAPS por bloco: menos que isso, sem ênfase suficiente; mais que isso, ênfase nenhuma.

## 4. Pausas com reticências imitam padrão real de fala hesitante ou reflexiva

`…` funciona porque reproduz o jeito como as pessoas realmente pausam pra pensar ou respirar no meio de uma ideia. Pausa longa demais (um parágrafo inteiro tratado como uma respiração só) soa artificial porque ninguém fala assim. É por isso que `<break time="x.xs" />` não funciona bem no v3: é uma pausa mecânica, não uma pausa que nasce do texto e da pontuação.

## 5. A pontuação carrega parte do sinal prosódico

Vírgula, ponto final, reticências e travessão têm pesos de pausa diferentes pro modelo. Escrever um trecho corrido sem pontuação variada tira controle de ritmo do texto, o modelo não tem onde "respirar" mesmo que a ideia peça uma pausa ali.
