# Troubleshooting — Personagem Saindo Diferente

Sintoma → causa provável → correção. Consulte antes de tentar de novo com o mesmo prompt.

---

### Personagem parece "quase" o mesmo, mas algo está sutilmente errado

**Causa provável:** o CHARACTER BLOCK foi resumido ou parafraseado em vez de colado word-for-word.
**Correção:** volte ao bloco original na bíblia e cole exatamente como está escrito, sem tentar "resumir pra ficar mais natural" — a variação de texto é o que abre espaço pro modelo reinterpretar.

### Traço distintivo (símbolo, cicatriz, marca) sumiu ou ficou fraco

**Causa provável:** o traço foi descrito sem ênfase suficiente, ou está descrito só uma vez no meio de um parágrafo longo.
**Correção:** isole o traço numa frase própria, em CAPS ou com "CRITICAL", e repita a exigência no fechamento do prompt (ex.: "Do not omit the scar", "Do not make the symbol flat").

### Elemento 3D/em relevo saiu chapado ou impresso

**Causa provável:** a descrição não especificou o acabamento físico (relevo, sombra própria, highlight especular) — só descreveu a forma/cor.
**Correção:** declare explicitamente "in high physical 3D relief, casts its own shadow, has specular highlight" — sem isso o modelo tende a tratar qualquer marca/símbolo como padrão impresso na superfície.

### Vista traseira do personagem mostra algo errado

**Causa provável:** a bíblia não documentou a vista traseira, e o modelo assumiu uma genérica.
**Correção:** adicionar uma seção explícita "BACK FACE"/vista traseira ao CHARACTER BLOCK sempre que o personagem tiver chance de aparecer de costas (ver `CHARACTER_BLOCK_TEMPLATE.md`).

### Variante A saiu com traço de variante B (cores/acessórios trocados)

**Causa provável:** as variantes foram descritas do zero em vez de herdar o bloco base — sem um bloco base compartilhado explícito, cada variante é uma "nova invenção" e detalhes vazam entre elas.
**Correção:** reescreva as variantes no formato "same base construction as @TAG_BASE" + só a diferença específica (ver seção "Variantes" em `CHARACTER_BLOCK_TEMPLATE.md`).

### Personagem consistente numa imagem, mas diverge ao virar vídeo

**Causa provável:** a sintaxe de referência usada no prompt de vídeo não bate com a convenção do Seedance, ou o CHARACTER BLOCK foi omitido achando que a imagem de referência bastava sozinha.
**Correção:** ver `CONSISTENCIA_MULTIMODELO.md` — inclua o CHARACTER BLOCK completo mesmo quando já há imagem de referência via `@Image1`.

### Drift progressivo ao longo de uma sequência de clipes

**Causa provável:** cada clipe novo foi ancorado na intenção original do personagem, não no estado observado no último clipe aprovado (pose final, posição de acessório).
**Correção:** descreva o próximo clipe a partir do frame final do clipe anterior, não do CHARACTER BLOCK isolado — ver nota de continuidade em `CONSISTENCIA_MULTIMODELO.md`.

### Prop ou cenário narrativo (com texto) saiu com texto errado/ilegível

**Causa provável:** o texto exato não foi declarado entre aspas na ficha do prop/cenário — descrição vaga tipo "uma manchete de jornal" deixa o modelo inventar o texto.
**Correção:** sempre citar o texto exato entre aspas na catalogação do prop (ver `CENARIOS_PROPS.md`), incluindo idioma quando for relevante (evita, por exemplo, caracteres do idioma errado aparecendo por engano).

### Personagem sai bem em still, mas a "presença"/postura muda de cena pra cena

**Causa provável:** a bíblia documentou só o visual estático (rosto, roupa) e não uma pista de postura/movimento.
**Correção:** para personagens que aparecem em vídeo, adicionar uma linha de "voice/posture cue" no CHARACTER BLOCK (ver Exemplo 2 em `CHARACTER_BLOCK_TEMPLATE.md`) — não precisa ser extensa, só o suficiente pra ancorar como ele se move/porta por padrão.
