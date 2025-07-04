#!/usr/bin/env zsh
# Uso: ./ipynb2org.sh arquivo.ipynb

set -euo pipefail

IPYNB_FILE="$1"
BASENAME="${IPYNB_FILE%.*}"

echo "Convertendo $IPYNB_FILE → $BASENAME.org..."

pandoc -s "$IPYNB_FILE" -t markdown -o "${BASENAME}.md"
pandoc -s "${BASENAME}.md" -t org -o "${BASENAME}.org"

echo "✅ Arquivo convertido: ${BASENAME}.org"
