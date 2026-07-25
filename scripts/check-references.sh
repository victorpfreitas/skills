#!/usr/bin/env bash
# Confere se todo path de arquivo citado entre crases em cada SKILL.md
# (ex.: `references/CAMERA_EMOTION.md`) realmente existe em disco,
# relativo à pasta do próprio SKILL.md.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

missing=0

while IFS= read -r -d '' skill_file; do
  skill_dir="$(dirname "$skill_file")"

  while IFS= read -r ref; do
    [ -z "$ref" ] && continue
    resolved="$skill_dir/$ref"
    if [ ! -f "$resolved" ]; then
      echo "MISSING: $skill_file referencia '$ref', mas '$resolved' não existe"
      missing=$((missing + 1))
    fi
  done < <(grep -oE '`[A-Za-z0-9_./-]+/[A-Za-z0-9_.-]+\.md`' "$skill_file" | tr -d '`' | sort -u)
done < <(find . -name "SKILL.md" -print0)

if [ "$missing" -gt 0 ]; then
  echo ""
  echo "$missing referência(s) quebrada(s) encontrada(s)."
  exit 1
fi

echo "Todas as referências de SKILL.md apontam para arquivos existentes."
