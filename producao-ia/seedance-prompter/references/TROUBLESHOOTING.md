# Troubleshooting: Seedance 2.0

Problemas recorrentes de produção real e a correção direta pra cada um. Consulte quando o resultado sair fraco antes de reescrever o prompt do zero.

## Rosto distorcendo ou deformando

- Adicione `razor-sharp facial geometry, no morphing` no bloco de constraints.
- Se o clip tem microexpressão (rosto muda de expressão), reduza a duração pra 4-5s. Rosto deforma mais em clipes longos com muita mudança de expressão.

## Câmera não se move mesmo pedindo movimento

- Confirme `fixed_camera: false` em `params`.
- Coloque o movimento de câmera logo no início do bloco `camera:`, não no meio da descrição da ação.

## Drift de identidade entre clipes de uma sequência

- Sintoma: personagem muda sutilmente de rosto, roupa ou proporção entre um clip e o próximo da mesma cena.
- Ancore a descrição do clip seguinte no estado real do clip anterior aprovado (ver "Continuidade entre clipes" no `SKILL.md`), não na intenção original.
- Em R2V, repita a mesma tag de referência (`@Image1`) em todos os clipes que precisam manter a mesma identidade.

## Física ou proporção quebrando em cenas de ação/VFX

- Adicione `anatomically accurate proportions throughout` no final do prompt.
- Quebre a ação em timestamps (Tipo B ou C) em vez de descrever tudo num bloco só. O modelo perde consistência física em clipes longos sem timestamps explícitos.

## I2V contradizendo a imagem de referência

- Releia a imagem antes de escrever: gênero, roupa, cenário e objeto precisam bater com o que já está na imagem.
- Nunca descreva algo que a imagem já contradiz (ex.: imagem mostra homem, prompt descreve mulher).

## Prompt ignorado ou parcialmente atendido

- Confirme que não há constraints negativos (`sem`, `no`, `not`). Seedance ignora negação, descreva o que quer no positivo.
- Confirme que as palavras mais importantes estão no início do prompt, não enterradas no meio de uma frase longa.

## Áudio genérico ou ausente

- SFX genéricos (`ambient sound`) tendem a sair fracos. Troque por SFX específicos do que está na cena (`water roar`, `metallic ring`, `ground explosion`).
- Confirme que `audio.music: none` está declarado. Sem isso, o modelo às vezes injeta trilha não pedida.
