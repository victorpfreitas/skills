# Protocolo de retake — Seedance 2.5

O `TROUBLESHOOTING.md` diz o que corrigir quando algo sai errado. Este arquivo é sobre como decidir a próxima tentativa quando o resultado não é perfeito nem lixo — o caso mais comum em produção real.

---

## 1. Vereditos de triagem

A cada take, escolha um:

- **Manter.** O objetivo principal da cena/estágio foi atingido, nada fatal sobrando.
- **Corrigir na pós.** O problema é de cor, texto, som ou corte — resolve fora do modelo.
- **Editar sem regenerar.** Use o workflow de **Video Editing** (`VIDEO_EDITING.md`) em vez de regerar do zero — o 2.5 foi desenhado exatamente pra esse caso: composição boa, só um elemento (objeto, fundo, áudio) precisa mudar.
- **Estender em vez de regenerar tudo.** Se só o final (ou início) da cena está errado e o resto está bom, use **Video Extension** (`VIDEO_EXTENSION_AND_TRANSITIONS.md`) a partir do último frame bom, em vez de descartar o take inteiro.
- **Re-roll.** Mesmo prompt, seed nova. Use quando o problema parece variância de amostragem, não erro estrutural do prompt.
- **Reescrever.** A mesma falha se repete em takes diferentes. O problema é no prompt, não na sorte da geração. Volte ao `MODEL_MECHANICS.md` e ao `TROUBLESHOOTING.md` pra diagnosticar antes de tentar de novo.

**Diferença em relação ao 2.0:** no 2.0 não havia como editar ou estender um take já gerado — a única saída era re-roll ou reescrever do zero. No 2.5, antes de descartar um take imperfeito, pergunte-se se **Video Editing** ou **Video Extension** resolvem o problema pontual sem perder o que já ficou bom.

---

## 2. Regra de uma variável por retake

Mude uma coisa por vez: uma cláusula do prompt, OU a seed, OU o workflow (T2V/R2V/Editing/Extension), OU uma referência. Nunca várias ao mesmo tempo. Mudar tudo junto tira a possibilidade de saber o que resolveu (ou piorou) o resultado.

---

## 3. Orçamento de tentativas

Defina quantas tentativas fazem sentido antes de começar (referência: 3–5 takes por clip/estágio; sobe pra 6–10 tentativas se estiver operando acima das faixas recomendadas de referência — ver `PARAMETERS_AND_LIMITS.md` §1). Se passar da metade do orçamento sem progresso na mesma falha, pare de repetir a mesma estratégia. Troque de abordagem: outro workflow, quebrar a cena em estágios menores, ou reescrever o prompt do zero em vez do quinto re-roll.

Duas falhas iguais em takes seguidos já é sinal pra reescrever, não pra tentar um terceiro re-roll.

---

## 4. Retake em vídeo longo/multi-estágio

Quando um vídeo de 30–180s falha num estágio específico:
- Não reescreva o vídeo inteiro. Isole qual estágio quebrou e ajuste só o `Primary event`/`End state` daquele estágio.
- Se o problema é drift de identidade entre estágios, confirme primeiro que o bloco `[Maintain Consistency]` está presente e específico o suficiente — esse costuma ser o ponto de falha antes de ser variância de amostragem.
- Considere gerar o estágio problemático como um clip separado (T2V/R2V) e depois usar **Video Extension** pra conectar, em vez de regenerar os 180s inteiros.
