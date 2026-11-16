#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
case "$1" in
  login|product) cp "variants/$1-v$2.html" "$1.html" ;;
  catalog) cp "variants/catalog-testid-v$2.html" catalog-testid.html
           cp "variants/catalog-dynamic-v$2.html" catalog-dynamic.html ;;
  *) echo "usage: ./switch.sh login|product|catalog N"; exit 1 ;;
esac
git add -A && git commit -qm "switch $1 -> v$2" && git push -q && echo "OK: $1 -> v$2 (GitHub Pages оновиться за ~1 хв)"
