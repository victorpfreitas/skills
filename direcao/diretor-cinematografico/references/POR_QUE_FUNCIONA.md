# Por que as escolhas visuais funcionam

As tabelas do `SKILL.md` (enquadramento, câmera, movimento, lente, luz) dizem qual efeito cada escolha produz. Este arquivo explica a lógica por trás, pra quando a cena pedir algo que não está em nenhuma tabela e for preciso derivar a escolha certa em vez de procurar um exemplo pronto.

## 1. Ângulo de câmera imita hierarquia física real

Olhar de baixo pra cima é a experiência de quem está em posição inferior vendo alguém em posição de poder, algo aprendido desde a infância. É por isso que low angle comunica poder sem precisar de nenhum outro elemento na cena: o espectador reconhece a hierarquia pela posição da câmera, não pelo conteúdo do quadro.

## 2. Espaço negativo e enquadramento imitam a experiência subjetiva da emoção

Isolamento sente-se como espaço vazio ao redor, ansiedade sente-se como falta de espaço. Por isso espaço negativo comunica solidão e enquadramento apertado comunica tensão: a composição reproduz fisicamente a sensação que a emoção já provoca no corpo.

## 3. Profundidade de campo rasa imita a atenção humana sob emoção intensa

Em pânico ou êxtase, a atenção filtra o entorno e foca só no estímulo central. Uma lente com bokeh forte (85mm+) faz o mesmo com o quadro: isola o sujeito do fundo. É por isso que close-ups emocionais pedem lente longa e rasa, não só "chegar perto" da cena.

## 4. Movimento de câmera imita o corpo do observador

Handheld comunica que existe alguém ali, fisicamente, correndo o mesmo risco da cena. Dolly suave comunica um observador onisciente e calmo. Orbit comunica exame e contemplação de algo (ou alguém) que merece ser visto de todos os ângulos. A pergunta pra escolher o movimento certo não é "qual fica bonito", é "quem está segurando essa câmera e por quê".

## 5. Luz direcional imita a física real da cena

Luz motivada (vem de uma fonte visível ou implícita na cena) é aceita pelo espectador sem que ele perceba "efeito de iluminação". Luz não motivada é lida como estilização. É por isso que "practical lights only" comunica realismo cru: o espectador não consegue apontar de onde vem a luz artificialmente, então aceita a cena como real.

## 6. Simetria comunica controle porque quebra a assimetria natural do mundo

O olho espera leve assimetria, é como o mundo real é. Simetria perfeita é lida como "alguém está controlando isso" mesmo antes de qualquer outra informação da cena. É por isso que Kubrick e Wes Anderson usam simetria pra comunicar obsessão, artificialidade ou controle institucional, não beleza neutra.

## Quando o resultado gerado não bate com a decupagem

Se o vídeo gerado (Seedance, Veo, Nano Banana etc.) não reproduziu a intenção da decupagem, o problema normalmente não está na leitura da cena, está na tradução decupagem → prompt. Antes de refazer a decupagem do zero:

1. Confira se o handoff seguiu a Seção 7 do `SKILL.md` à risca (emoção em micro-beats, não adjetivo; movimento em vocabulário Seedance, nunca `zoom`; constraints sempre positivos).
2. Consulte `references/TROUBLESHOOTING.md` e `references/RETAKE_PROTOCOL.md` do `seedance-prompter`, é lá que mora o diagnóstico de por que a geração saiu errada, não aqui.
