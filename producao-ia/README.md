# AI Production

Skills covering the full production pipeline: validating an idea before scripting, generating video, music, and voice prompts for production models (Seedance 2.0, MiniMax H3, Suno, ElevenLabs), and optimizing thumbnail/title before publishing.

Most of these assume the scene's direction has already been decided and focus on turning that decision into a high-performance prompt; `pesquisa-de-conteudo` and `thumbnail-titulo-otimizado` cover the ends before and after generation — research before, thumbnail/title after.

| Skill | What it does |
| --- | --- |
| [`pesquisa-de-conteudo`](./pesquisa-de-conteudo) | Validates whether a video idea has demand and suggests an angle, before scripting. |
| [`seedance-prompter`](./seedance-prompter) | Turns an idea, scene, or visual reference into ready-to-use Seedance 2.0 video prompts. |
| [`minimax-h3-prompter`](./minimax-h3-prompter) | Prompts in MiniMax H3's native format (T2VA/I2VA/FL2VA/L2VA/Ref2VA): video with natively generated audio, dialogue with lip-sync, voice cloning, and editing an existing video. |
| [`elevenlabs-voiceover`](./elevenlabs-voiceover) | Formats a script into a voice-over with ElevenLabs Eleven v3 emotional tags, ready for narration. |
| [`trilha-sonora-prompter`](./trilha-sonora-prompter) | Translates a scene's emotional tone into a ready-to-use Suno music prompt, with vidIQ as an in-conversation alternative. |
| [`thumbnail-titulo-otimizado`](./thumbnail-titulo-otimizado) | Generates and scores thumbnail and title, closing the generate → score → adjust loop before publishing. |
