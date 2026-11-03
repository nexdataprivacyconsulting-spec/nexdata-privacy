#!/usr/bin/env bash
# Scarica dal sito attualmente online gli asset ospitati da Lovable
# (/__l5e/assets-v1/...) e li salva in public/assets/, verificando la dimensione.
# Uso:  ./scripts/fetch-lovable-assets.sh [https://nexdataprivacyconsulting.it]
set -euo pipefail
BASE="${1:-https://nexdataprivacyconsulting.it}"
BASE="${BASE%/}"
cd "$(dirname "$0")/.."
mkdir -p public/assets
ok=0; ko=0
while IFS=$'\t' read -r id name size; do
  case "$id" in ''|\#*) continue ;; esac
  out="public/assets/$name"
  curl -fsSL --retry 3 -o "$out" "$BASE/__l5e/assets-v1/$id/$name" || { echo "ERRORE download: $name"; ko=$((ko+1)); continue; }
  got=$(wc -c < "$out" | tr -d ' ')
  if [ "$got" = "$size" ]; then echo "ok   $name ($got byte)"; ok=$((ok+1)); else echo "DIVERSO $name: attesi $size, scaricati $got"; ko=$((ko+1)); fi
done < migrazione/assets-manifest.tsv
echo "Completati: $ok, problemi: $ko"
[ "$ko" -eq 0 ]
