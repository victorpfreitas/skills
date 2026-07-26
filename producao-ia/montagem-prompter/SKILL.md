---
name: montagem-prompter
description: >
  Use esta skill sempre que Victor precisar decidir como montar os clipes já
  gerados (Seedance, imagem animada, etc.) num vídeo final coeso. Trigger em
  qualquer pedido como "como monto esses clipes", "qual ritmo de corte usar",
  "que transição encaixa aqui", "monta a sequência de edição", "como sincronizo
  com a trilha", "estilo de legenda pra esse vídeo", ou quando os clipes já
  foram gerados e falta decidir a montagem final antes de exportar. Fecha a
  ponte que hoje não existe entre "clipe individual gerado" e "vídeo pronto pra
  postar": ritmo de corte, tipo de transição, ponto de sincronia com a trilha
  sonora e estilo de legenda queimada.
---

# Montagem Prompter

Você decide como os clipes já gerados se juntam num vídeo coeso: ritmo de corte, transições, sincronia com a trilha e legenda. Isso é a etapa que fica entre "clipe pronto" (saída do `seedance-prompter`/`image-prompter`) e "vídeo publicável" — hoje sem skill de apoio nenhuma.

---

## Quando usar

Depois que todos os clipes de uma sequência já foram gerados e aprovados (não durante a geração — nessa hora quem decide é o `seedance-prompter`), e antes de exportar/publicar. Se a trilha sonora ainda não existe, gere-a primeiro com o `trilha-sonora-prompter` — o ritmo de corte e o tempo da música precisam casar.

---

## Workflow

### 1. Ritmo de corte por tipo de conteúdo

O ritmo certo depende do que o bloco está fazendo, não é um número fixo pro vídeo inteiro (mesma lógica de segmentar por função de bloco que o `elevenlabs-voiceover` já usa pro roteiro/voz):

| Tipo de bloco | Ritmo de corte | Por quê |
|---|---|---|
| Hook (primeiros 2-3s) | Corte muito rápido, 1-2s por clipe | Prender atenção antes do espectador decidir sair |
| Contexto/explicação | Corte moderado, 3-5s por clipe | Dar tempo de processar informação sem arrastar |
| Ponto alto/revelação | Um corte só, plano mais longo, ou corte seco no beat exato | Deixar o momento respirar, não picotar o clímax |
| Tutorial/passo a passo | Corte alinhado à ação (um corte por passo concluído) | Ritmo dita pela tarefa, não por tempo fixo |
| CTA/fechamento | Corte moderado a lento | Reduzir energia, preparar pra ação do espectador |

### 2. Transições

Regra geral: **corte seco é o padrão**, transição chamativa (fade, wipe, zoom transition) é exceção que precisa de motivo. Use transição além do corte seco só quando:
- Muda de cenário/tempo (fade ou dissolve comunica passagem de tempo).
- É uma virada de assunto dentro do mesmo vídeo (um whip pan ou zoom rápido separa blocos).
- O próprio ritmo da trilha tem um beat marcante que pede um efeito sincronizado nele.

Nunca empilhar mais de um tipo de transição chamativa no mesmo vídeo sem motivo — isso é o análogo visual da regra de "não empilhar mais de duas tags emocionais" do `elevenlabs-voiceover`: cada elemento de estilo a mais dilui o anterior.

### 3. Sincronia com a trilha

Se já existe uma trilha (via `trilha-sonora-prompter`), alinhe os cortes principais aos beats musicais mais fortes — não todo corte precisa cair no beat, mas os cortes de transição de bloco (hook→contexto, contexto→revelação) ganham muito impacto quando caem exatamente no batimento. Se a trilha ainda não existe, informe o ritmo de corte decidido aqui pra quem for gerar a música, pra ela nascer já compatível.

### 4. Estilo de legenda queimada

Decidir junto com o ritmo de corte, não depois:
- **Densidade**: quantas palavras por tela — mais denso em conteúdo de contexto/tutorial, mais esparso (1-3 palavras) em hook e ponto alto, pra não competir com a imagem no momento que mais precisa de impacto.
- **Timing**: legenda entra no corte ou meio segundo depois — entrar exatamente no corte reforça o ritmo, atrasar levemente cria uma sensação mais orgânica.
- **Ênfase visual**: palavra-chave da frase pode ganhar destaque (cor, tamanho) — usar com a mesma moderação da regra de CAPS do `elevenlabs-voiceover` (1-2 palavras por frase, não a frase toda).

### 5. Entregar a decisão de montagem

Formato de entrega — não é um EDL técnico de editor profissional, é uma instrução clara pra quem for montar (Victor mesmo, ou uma ferramenta de edição):

```
## Montagem: [nome do vídeo/sequência]

**Ordem dos clipes:** [lista numerada]

**Ritmo de corte por bloco:**
- Hook: [duração/critério]
- [demais blocos]

**Transições:** corte seco padrão; exceção em [onde e por quê]

**Sincronia com trilha:** cortes de bloco alinhados a [descrição do beat]

**Legenda:** [densidade, timing, ênfase]
```

---

## Regras críticas

- Ritmo de corte é decisão por bloco, nunca um número único pro vídeo inteiro.
- Corte seco é o padrão — toda transição chamativa precisa justificar por que não é um corte seco.
- Decidir legenda e ritmo de corte juntos, nunca a legenda como afterthought depois que a montagem já está fechada.
- Se a trilha ainda não existe, gerar ela primeiro (`trilha-sonora-prompter`) ou pelo menos definir o BPM alvo antes de travar o ritmo de corte final.
