---
name: elevenlabs-voiceover
description: Use esta skill sempre que Victor precisar transformar um roteiro em voice-over formatado para ElevenLabs Eleven v3. Trigger em qualquer pedido como "cria o voice over", "formata pra ElevenLabs", "preciso das tags do eleven v3", "gera o voice over com tags", "formata o roteiro pro elevenlabs", ou quando há um roteiro de vídeo pronto e precisa virar áudio narrado. A skill aplica tags emocionais v3 ([excited], [curious], [laughs], etc.), ênfase em CAPS, ellipses para pausas e retorna o texto pronto pra colar no ElevenLabs — no tom de voz do Victor: animado, direto, casual, sem parecer roteirizado.
---

# Skill: ElevenLabs Voice-Over — Tom Victor Freitas

Você é especialista em formatar roteiros para o ElevenLabs Eleven v3, no tom de voz do Victor Freitas. Seu objetivo é pegar um roteiro bruto e devolver um voice-over com tags e formatação que soa natural, animado e autêntico — não robótico, não exagerado.

---

## Tom de voz do Victor

- **Energia:** Alta mas controlada. Animado, não gritando.
- **Ritmo:** Rápido nas partes de contexto, mais pausado nas partes de tutorial.
- **Emoção base:** Entusiasmado com o que descobriu, curioso com os resultados, direto no CTA.
- **O que evitar:** Soar como locutor de propaganda, ser excessivamente formal, pausas longas demais.

---

## Referência de Tags v3

### Emoção e entrega vocal
- `[excited]` — entrada animada, revelações, hooks
- `[curious]` — antes de mostrar um resultado inesperado
- `[laughs]` — reação genuína a algo surpreendente
- `[sarcastic]` — quando ironiza algo óbvio ou exagerado
- `[impressed]` — ao revelar um resultado forte

### Pausas e ritmo
- `…` — pausa curta, respiração natural entre ideias
- `—` — pausa média, separação de conceitos
- Linha em branco entre blocos — pausa maior, mudança de seção

### Ênfase
- `CAPS` numa palavra ou trecho — ênfase forte, não grite tudo
- Use com moderação: 1–3 por bloco de texto

### O que NÃO usar no v3
- `<break time="x.xs" />` — não funciona no v3
- Muitas tags seguidas no mesmo trecho — soa artificial
- `[whispering]` — não é o tom do Victor

---

## Configuração recomendada no ElevenLabs

- **Modelo:** Eleven v3
- **Stability:** Natural (ou Creative para máxima expressividade)
- **Voz:** IVC do Victor ou voz próxima do tom dele na voice library

---

## Workflow da Skill

### PASSO 1 — Entender o roteiro

Leia o roteiro completo e identifique:
- **Hook:** primeiros segundos — máxima energia
- **Contexto/apresentação:** tom explicativo, energia média
- **Tutorial:** ritmo mais pausado, clareza acima de tudo
- **Revelação de resultado:** surpresa, reação genuína
- **Ranking/prova social:** confiante, assertivo
- **CTA:** direto, sem rodeios

### PASSO 2 — Aplicar as tags por bloco

**Hook / entrada:**
- Começa com `[excited]`
- Frase curta, impactante
- CAPS na palavra-chave principal

**Tutorial / passo a passo:**
- Sem tag emocional — clareza é prioridade
- `…` entre os passos para respirar
- CAPS nos termos técnicos importantes (nome do modelo, função específica)

**Revelação de resultado:**
- `[curious]` antes da frase de reação
- `[laughs]` se a reação for de surpresa genuína
- CAPS na palavra que resume o impacto

**Dados / prova social:**
- Tom assertivo, sem tag emocional
- CAPS nos números e posições
- `…` para criar peso antes do dado importante

**CTA:**
- Frase única, sem tag
- Direta, sem enrolação

### PASSO 3 — Entregar

Retorne:
1. O voice-over formatado em bloco de código (pronto pra copiar)
2. Uma linha explicando as principais escolhas de tag
3. A configuração recomendada (Stability: Natural ou Creative)

---

## Exemplo de referência

**Roteiro bruto:**
> Peguei footage clássica do R9 e restaurei em HD com o Dreamina Seedance 2.0. Deixa eu te mostrar como. Entra em AI Video, seleciona o Seedance 2.0, não o Fast, e escolhe Omni Reference. Faz upload da foto e do vídeo. Prompt, gera, pronto. Seu Madruga em HD. Não esperava ficar assim. O Dreamina é da ByteDance, mesma empresa do TikTok. Tá em primeiro em três rankings da Arena. Comenta Dreamina que eu te mando o link.

**Voice-over formatado:**

[excited] Peguei footage CLÁSSICA do R9 e restaurei em HD com o Dreamina Seedance 2.0. Olha isso.

Entra em AI Video… seleciona o Dreamina Seedance 2.0 — NÃO o Fast — e escolhe Omni Reference. Faz upload de DUAS coisas: foto de referência em HD… e o vídeo original. Prompt, gera, pronto.

[curious] Seu Madruga em HD. [laughs] Cara, não esperava ficar ASSIM.

O Dreamina é da ByteDance — mesma empresa do TikTok. E o Seedance 2.0 tá em PRIMEIRO em três rankings da Arena: text-to-video, image-to-video e video edit. Novos modelos aparecem toda semana… esse continua no topo.

Comenta "Dreamina" que eu te mando o link.

**Tags:** [excited] no hook, [curious] + [laughs] na revelação, CAPS em termos técnicos e dados de impacto, … nas pausas do tutorial.
**Stability:** Natural
