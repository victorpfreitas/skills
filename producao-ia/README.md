# AI Production

Skills covering the full production pipeline: validating an idea before scripting, keeping a character consistent across generations, generating image, video, music, and voice prompts for production models (Nano Banana 2, Seedream 5.0 Pro, GPT Image 2, Seedance 2.0, Seedance 2.5, Suno, ElevenLabs), assembling clips into a final video, and optimizing thumbnail/title before publishing.

Most of these assume the scene's direction has already been decided and focus on turning that decision into a high-performance prompt; `pesquisa-de-conteudo`, `biblia-personagem`, `montagem-prompter`, and `thumbnail-titulo-otimizado` cover the ends before and after generation — research and character before, assembly and thumbnail/title after.

| Skill | What it does |
| --- | --- |
| [`pesquisa-de-conteudo`](./pesquisa-de-conteudo) | Validates whether a video idea has demand and suggests an angle, before scripting. |
| [`biblia-personagem`](./biblia-personagem) | Creates a new character or documents an existing one in a visual-consistency bible across image/video generations. |
| [`image-prompter`](./image-prompter) | Generates cinematic image prompts and decides which model to use among Nano Banana 2, Seedream 5.0 Pro, and GPT Image 2. |
| [`seedance-prompter`](./seedance-prompter) | Turns an idea, scene, or visual reference into ready-to-use Seedance 2.0 video prompts. |
| [`seedance-25-prompter`](./seedance-25-prompter) | Prompts for Seedance 2.5: multi-reference (up to 50 materials), editing/extending/transitioning an existing video, native 30–180s long video, blockout, and storyboard. |
| [`elevenlabs-voiceover`](./elevenlabs-voiceover) | Formats a script into a voice-over with ElevenLabs Eleven v3 emotional tags, ready for narration. |
| [`trilha-sonora-prompter`](./trilha-sonora-prompter) | Translates a scene's emotional tone into a ready-to-use Suno music prompt, with vidIQ as an in-conversation alternative. |
| [`montagem-prompter`](./montagem-prompter) | Decides cut rhythm, transitions, music sync, and captions when assembling generated clips into a final video. |
| [`thumbnail-titulo-otimizado`](./thumbnail-titulo-otimizado) | Generates and scores thumbnail and title, closing the generate → score → adjust loop before publishing. |
