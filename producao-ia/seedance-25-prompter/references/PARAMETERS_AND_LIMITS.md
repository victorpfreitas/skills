# Parâmetros e Limites — 2.0 vs 2.5

**Leia este arquivo antes de definir modo, duração, aspect ratio ou volume de referências.** Os limites do 2.5 são muito maiores que os do 2.0 — não assuma os números do skill `seedance-prompter` (2.0) aqui.

---

## 1. Limites de material de referência

| Tipo | 2.0 | 2.5 |
|---|---|---|
| **Imagens** | 0–9 imagens por request | Até **30 imagens**, cada uma até 4K |
| **Vídeos** | 1 vídeo, duração [2,15]s, até 3 vídeos, total ≤15s (real: [1.8,15.2]s por vídeo, total 15.2s) | Até **10 vídeos**, duração [2,30]s cada, total ≤30s (real: [1.8,30.2]s por vídeo, total 30.2s) |
| **Áudio** | 1 áudio, duração [2,15]s, até 3 clipes, total ≤15s (real: [1.8,15.2]s, total 15.2s) | Até **10 áudios**, duração [2,30]s cada, total ≤30s (real: [1.8,30.2]s, total 30.2s) |
| **Total de materiais combinados** | — | Até **50 materiais** no total |
| **Áudio isolado (sem imagem/vídeo)** | R2V exige pelo menos uma imagem/vídeo — áudio sozinho não é suportado | **Suporta áudio isolado** (pure audio driver) |

### Faixas recomendadas (não são limites técnicos, são pra estabilidade)

| Cenário | Recomendação |
|---|---|
| Sujeitos distintos em imagens de referência | 1–8 ideal; 9–12 possível mas estabilidade cai (pode precisar de mais tentativas) |
| Sujeitos em áudio/vídeo de referência | 1–5 ideal; 6–10 possível, estabilidade cai |
| Duração de cada vídeo/áudio de referência de sujeito | 5–10s tem melhor efeito; mais longo reduz estabilidade |
| Vídeo fonte para video editing | melhor efeito até 20s; mais longo reduz estabilidade |
| Imagens de referência para video editing | 1–5 ideal; 6–8 possível, estabilidade cai |

**Múltiplos ângulos do mesmo sujeito:** se há 1–5 sujeitos, tanto "single view" quanto "multi-view" funcionam. Acima de 5 sujeitos, prefira sempre view única por imagem — separe cada ângulo em imagens independentes em vez de colar vários ângulos numa colagem só. Estabilidade: múltiplas imagens de view única > uma imagem com múltiplas views.

---

## 2. Duração de geração

| | 2.0 | 2.5 |
|---|---|---|
| Faixa suportada | -1 & [4, 15]s (97–361 frames) | -1 & [4, 30]s (97–721 frames) |
| Vídeo longo nativo | não existe | **Long Video mode**: 30–180s numa geração só |
| Extensão | não existe | até 30s por operação de extensão, aninhável até 60s total a partir de uma base de 30s |

## 3. Resolução

Ambas as versões: 480p, 720p (720p+ recomendado para trabalho de produção).

---

## 4. Travas automáticas de aspect ratio e duração (exclusivo 2.5)

Video editing, first/last-frame e video extension **travam automaticamente** alguns parâmetros com base no material de entrada. Você não pode configurar esses campos separadamente na página de geração nem via API quando a trava se aplica.

| Tipo de tarefa | Aspect Ratio | Duração |
|---|---|---|
| **Video editing** | Preserva automaticamente o aspect ratio do vídeo de entrada — não configurável | Preserva aproximadamente a duração do vídeo de entrada — não configurável. Processamento de frame de entrada pode gerar diferença de até ~0.3s |
| **First-frame ou first-and-last-frame** | Usa automaticamente o aspect ratio da primeira imagem. First e last devem usar o mesmo aspect ratio pra evitar esticar o último frame | Configurável |
| **Video extension** | Preserva automaticamente o aspect ratio do vídeo de entrada — não configurável | Configurável (duração da extensão) |

Parâmetros travados por essas regras não podem ser especificados separadamente. Os demais parâmetros dependem das opções disponíveis na plataforma no momento.

---

## 5. Novidades de highlight oficiais (visão geral)

Direto do release notes da ByteDance, pra contextualizar por que cada limite mudou:

1. **Extensão de vídeo / continuação sem perda** — até 30s por operação, aninhável até 60s.
2. **Vídeo longo nativo até 180s** — sem precisar segmentar/estender manualmente.
3. **Controle de timestamp preciso** — segundo a segundo.
4. **Suporte ampliado a idiomas minoritários** — sem precisar traduzir para chinês/inglês antes.
5. **Remoção de legendas/BGM indesejados** — resposta a negative prompt muito mais confiável.
6. **Efeito de geração base otimizado** — menos "cara de IA", cortes mais consistentes, mais ações complexas de cauda longa (long-tail) desbloqueadas.
7. **Otimização abrangente de referência multimodal**: referência de timbre, referência multi-pessoa (resolve o problema de "gêmeos"/troca de rosto), continuidade de extensão, controle de blockout/white model, edição green screen, remoção/separação de BGM, "transfer creativity" (não só replica movimento, captura emoção/linguagem de câmera/intenção criativa da referência), eliminação parcial e re-edição de objetos específicos, modificação de perspectiva de câmera com extrapolação espacial.
8. **Transição sem costura entre dois vídeos** — o modelo gera o intervalo completo automaticamente.
9. **Storyboard multi-grid** — aceita grid de imagens como referência de enredo; recomenda-se line art/stickman simples.
