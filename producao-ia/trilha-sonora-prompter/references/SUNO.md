# Suno — Style Prompt, Meta Tags e Exclude

Referência de sintaxe atual do Suno (v5.5) pra montar o prompt de trilha. Suno tem dois campos separados no modo Custom: **Style of Music** (como a música soa) e **Lyrics** (o que é cantado e a estrutura, via meta tags).

---

## Style of Music — fórmula

```
[Gênero/subgênero], [Tempo/energia/BPM], [Instrumentos-chave], [Estilo vocal], [Produção/clima], [Modificadores]
```

- **4 a 8 descritores**, nunca um parágrafo corrido — o Suno interpreta melhor tags separadas por vírgula do que prosa.
- **Gênero e tipo de vocal logo no início** — são os descritores que mais ancoram o resultado.
- Exemplo pra trilha de fundo tensa: `dark cinematic trailer score, mid-tempo building to fast, deep strings and pulsing sub-bass, instrumental, tense atmospheric production, slow crescendo`.
- Exemplo pra trilha de abertura otimista: `upbeat indie pop, 120 BPM, acoustic guitar and claps, warm female vocal, bright polished production, feel-good`.

## Lyrics — meta tags de estrutura

Meta tags ficam entre colchetes, em linha própria, logo antes do trecho que afetam. Servem tanto pra estrutura de seção quanto pra instrução pontual de instrumento/dinâmica:

| Categoria | Tags comuns |
|---|---|
| Estrutura | `[Intro]`, `[Verse]`, `[Pre-Chorus]`, `[Chorus]`, `[Bridge]`, `[Outro]` |
| Instrumental/dinâmica | `[Guitar Solo]`, `[Build]`, `[Drop]`, `[Instrumental Break]`, `[Fade Out]` |
| Vocal | `[Whispered]`, `[Spoken]`, `[Ad-lib]` |

Pra **trilha de fundo pura** (o caso mais comum vindo do `seedance-prompter`), normalmente não se preenche o campo Lyrics com letra nenhuma — só o style prompt + a palavra `instrumental` no final resolve. Meta tags de estrutura entram quando a peça precisa de seções marcadas (ex.: um jingle com hook cantado, ou uma trilha que precisa de um build/drop sincronizado com um momento específico do vídeo).

## Exclusão — duas formas, confiabilidade diferente

- **Campo dedicado Exclude** (Custom Mode → Advanced Options, disponível em planos Pro/Premier): descreva em texto simples o que não quer (ex.: `choir, backing vocals, distorted guitar`). É a forma **mais confiável** de excluir algo.
- **Inline no fim do style prompt**, quando o campo dedicado não está disponível: escreva a exclusão como frase, no final do prompt, nunca no início (o Suno processa os descritores positivos primeiro) — ex.: `..., warm acoustic production, instrumental, no vocals`.
- Tags são **hints probabilísticos, não comandos** — o Suno segue na maioria das vezes mas pode ignorar. Se uma exclusão for ignorada, regenerar ou simplificar a frase (evitar tag complexa ou incomum) costuma resolver melhor do que insistir na mesma frase.

## Vocal e Voices

Se a trilha precisar de um vocal específico consistente entre gerações (ex.: uma "voz de marca" recorrente), o recurso é **Voices** (antigo "Personas") — clona/fixa uma referência vocal pra reuso. Fora esse caso, deixar o estilo vocal só como descritor no style prompt (`warm female vocal`, `deep male baritone`) é suficiente.

## Checklist antes de entregar o prompt

- [ ] Style prompt com 4-8 descritores, gênero e vocal no início, separados por vírgula.
- [ ] `instrumental` presente no final quando não houver vocal.
- [ ] Exclusão (se houver) no campo Exclude dedicado, ou no fim do style prompt — nunca no início.
- [ ] Meta tags de estrutura só quando a peça realmente tiver seções/letra — trilha de fundo pura não precisa.
- [ ] BPM/tempo do style prompt compatível com o ritmo de corte já decidido (ver `montagem-prompter`), se aplicável.
