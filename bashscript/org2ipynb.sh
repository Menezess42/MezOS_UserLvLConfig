#!/usr/bin/env zsh
# Uso: ./org2ipynb.sh arquivo.org

set -euo pipefail

ORG_FILE="$1"
BASENAME="${ORG_FILE%.*}"

echo "Convertendo $ORG_FILE → $BASENAME.ipynb..."

pandoc -s "$ORG_FILE" -t markdown -o "${BASENAME}.md"
pandoc -s "${BASENAME}.md" -o "${BASENAME}.ipynb"

echo "✅ Arquivo convertido: ${BASENAME}.ipynb"

