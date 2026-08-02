# Por que as regras funcionam — Seedance 2.5

As regras do `SKILL.md` e dos outros arquivos de referência dizem o quê fazer. Este arquivo explica o porquê, pra quando o caso não estiver coberto pelos exemplos e for preciso derivar a solução em vez de copiar um padrão pronto.

---

## 1. Por que negative prompts passaram a funcionar (mudança em relação ao 2.0)

No 2.0, o modelo tratava negação como gramática fraca em volta de uma ativação forte — "sem sangue" ainda evocava o conceito de sangue. O 2.5 foi otimizado especificamente pra resolver isso: um dos itens de release oficial é "🔇 remove irrelevant subtitles and BGM" — otimização direta de resposta a negative prompt, motivada por feedback de usuários do 2.0 sobre legendas e trilha indesejadas aparecendo sem serem pedidas.

Isso não significa que negação virou mais forte que descrição positiva — a fórmula de produção continua sendo positivo primeiro, negativo como reforço no final (`[Negative Prompts]`). Mas agora o bloco negativo tem efeito real, e por isso todo exemplo oficial do 2.5 inclui um.

## 2. Por que mapeamento explícito de referência importa mais no 2.5

Com até 50 materiais possíveis (vs. 9 imagens/3 vídeos no 2.0), a chance de ambiguidade cresce proporcionalmente ao número de referências. Sem mapeamento (`<Character A> corresponds to @Image 1`), o modelo precisa inferir qual imagem representa qual personagem — e quanto mais materiais, mais chances de inferência errada, mistura de identidade ("gêmeos") ou troca de rosto. O mapeamento não é burocracia, é a única forma de o modelo saber a que cada referência se aplica quando há muitas ao mesmo tempo.

## 3. Por que "sole editing master" existe

Editar um vídeo existente é fundamentalmente diferente de gerar do zero: o modelo precisa saber que a maior parte do conteúdo (personagens, cena, câmera, áudio, ordem de eventos) **não deve mudar**, e só uma parte específica deve. Sem declarar @Video 1 como autoridade única, o modelo trata a edição como uma geração nova influenciada pelo vídeo — não como uma edição cirúrgica. É por isso que junto do "sole editing master" sempre vem `[Edit Scope]` (o que muda) e `[Content to Preserve]` (o que não muda) — as duas metades da mesma instrução.

## 4. Por que o frame de fronteira vem antes do conteúdo novo em extensão

Extensão de vídeo é geração condicionada no ponto de conexão. Se você descreve o conteúdo novo primeiro e só depois menciona a continuidade, o modelo já alocou atenção pro conteúdo novo antes de saber que precisa ancorar no estado exato do frame de fronteira — e a instrução de continuidade (pose, luz, posição) fica mais fraca. Descrever a fronteira primeiro garante que ela seja tratada como restrição dura, não como nota de rodapé.

## 5. Por que estágios (Stages) pedem um "end state" cada

Cada frame gerado a partir do anterior herda e amplifica pequenos erros do frame de origem — esse princípio não mudou do 2.0 pro 2.5. A diferença é que agora, com vídeos de até 180s, o acúmulo de erro sem checkpoints seria catastrófico. Um "end state" declarado por estágio funciona como um checkpoint verificável: o modelo sabe exatamente onde a cena precisa estar ao final de cada bloco, o que reduz o drift acumulado ao longo de um vídeo longo.

## 6. Por que "seleção por cena" existe em vez de usar tudo de uma vez

Com até 50 materiais, forçar todos a aparecerem simultaneamente sobrecarrega qualquer cena individual — não há espaço visual/temporal pra 10 personagens e 8 props na mesma tomada. A lógica de multi-referência do 2.5 assume que o conjunto de materiais é um **elenco disponível**, não um elenco obrigatório por cena. Declarar "Use: X, Y, Z" por cena é o que permite ao modelo ignorar corretamente o resto do elenco naquele momento.

## 7. Por que travas automáticas de aspect ratio/duração existem

Video editing, first/last-frame e video extension partem de material físico já existente (um vídeo real, uma imagem real). Deixar o aspect ratio livre nesses casos forçaria o modelo a decidir entre respeitar a geometria do material de entrada ou obedecer um parâmetro conflitante — a plataforma resolve essa ambiguidade travando o parâmetro automaticamente na fonte, e por isso tentar configurá-lo via prompt ou API nesses workflows não tem efeito.

## 8. Princípios herdados do 2.0 que continuam válidos

- **Atenção é finito**: as primeiras palavras do prompt dominam a influência sobre o resultado.
- **Detalhe de uma região escala com o espaço que ocupa no frame**: microexpressão e reação de rosto pedem enquadramento fechado.
- **Áudio e vídeo nascem do mesmo processo**: nomear som com precisão ancora timing tanto quanto descrição visual.
- **Referência pesa mais que texto**: descrever em palavras o que a própria referência já mostra cria instrução concorrente, não reforço — declare o papel da referência, não o conteúdo que ela já exibe.
