# Protocolo de retake

O `TROUBLESHOOTING.md` diz o que corrigir quando algo sai errado. Este arquivo é sobre como decidir a próxima tentativa quando o resultado não é perfeito nem lixo, que é o caso mais comum em produção real.

## 1. Vereditos de triagem

A cada take, escolha um:

- **Manter.** O objetivo principal da cena foi atingido, nada fatal sobrando.
- **Corrigir na pós.** O problema é de cor, texto, som ou corte, resolve fora do modelo.
- **Editar sem regenerar.** A composição está boa, só um elemento precisa mudar (use os padrões de edição conversacional, quando o modelo suportar).
- **Re-roll.** Mesmo prompt, seed nova. Use quando o problema parece variância de amostragem, não erro estrutural do prompt.
- **Reescrever.** A mesma falha se repete em takes diferentes. O problema é no prompt, não na sorte da geração. Volte ao `MODEL_MECHANICS.md` e ao `TROUBLESHOOTING.md` pra diagnosticar antes de tentar de novo.

## 2. Regra de uma variável por retake

Mude uma coisa por vez: uma cláusula do prompt, OU a seed, OU o modo (T2V/I2V/R2V), OU uma referência. Nunca várias ao mesmo tempo. Mudar tudo junto tira a possibilidade de saber o que resolveu (ou piorou) o resultado.

## 3. Orçamento de tentativas

Defina quantas tentativas fazem sentido antes de começar (referência: 3 a 5 takes por clip). Se passar da metade do orçamento sem progresso na mesma falha, pare de repetir a mesma estratégia. Troque de abordagem: outro modo de geração, quebrar a cena em clipes menores, ou reescrever o prompt do zero em vez do quinto re-roll.

Duas falhas iguais em takes seguidos já é sinal pra reescrever, não pra tentar um terceiro re-roll.
