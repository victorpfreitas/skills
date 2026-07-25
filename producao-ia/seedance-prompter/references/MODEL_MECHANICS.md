# Por que as regras funcionam

As "Regras críticas" do `SKILL.md` dizem o quê fazer. Este arquivo explica o porquê, pra quando o caso não estiver coberto pelos exemplos e for preciso derivar a solução em vez de copiar um padrão pronto.

## 1. Atenção é um recurso finito

Cada palavra do prompt compete por uma quantidade limitada de influência sobre o resultado. As primeiras palavras dominam; o que vem depois pesa cada vez menos. É por isso que a regra de ouro do `SKILL.md` (palavras no início pesam mais) existe: não é estilo, é como o modelo aloca atenção.

## 2. Negação ativa em vez de excluir

Dizer "sem sangue" ainda evoca o conceito de sangue no modelo. Negação é gramática fraca em volta de uma ativação forte. Por isso a regra de nunca usar constraints negativos: descreva o que quer que apareça, não o que não quer. A exceção é o campo `fallback`/constraint declarado fora do corpo do prompt, que o Seedance trata como parâmetro, não como texto descritivo.

## 3. Erros de identidade se acumulam entre frames

Cada frame gerado a partir do anterior herda e amplifica pequenos erros do frame de origem. Um clip longo sem timestamps deixa esse erro compor sem controle. É por isso que clipes curtos e precisos vencem um clip longo só: menos frames de recomposição, menos chance de drift.

## 4. Referências pesam mais que texto

Uma imagem ou vídeo de referência carrega mais informação por "token" do que uma frase descrevendo a mesma coisa. Reescrever em texto o que a referência já mostra cria uma instrução concorrente, não reforço. Descreva na referência só o que ela não consegue mostrar sozinha (o papel dela na cena, não a aparência que ela já define).

## 5. Detalhe de uma região escala com o espaço que ela ocupa no frame

Um rosto ocupando 10% do frame recebe proporcionalmente menos "orçamento" de detalhe do que um rosto em close-up. É por isso que microexpressão e reação de rosto pedem enquadramento mais fechado: não é só estética, é o único jeito de garantir fidelidade de detalhe.

## 6. Áudio e vídeo são gerados juntos

O som não é adicionado depois da imagem, os dois nascem do mesmo processo. Nomear o som com precisão ancora o timing da cena tanto quanto a descrição visual. Diálogo exige enquadramento estável, porque o modelo resolve imagem e fonema ao mesmo tempo.
