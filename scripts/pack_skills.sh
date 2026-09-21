#!/usr/bin/env bash
# Her skill klasörünü claude.ai'ye yüklenebilir zip'e paketler: dist/<skill>_v<sürüm>_<tarih>.zip
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist; today=$(date +%F)
for d in skills/*/; do
  s=$(basename "$d"); [[ "$s" == _* ]] && continue
  [[ -f "$d/SKILL.md" ]] || { echo "ATLA: $s (SKILL.md yok)"; continue; }
  v=$(grep -m1 '^version:' "$d/SKILL.md" | awk '{print $2}'); v=${v:-0.0}
  out="dist/${s}_v${v}_${today}.zip"; rm -f "$out"
  (cd skills && zip -qr "../$out" "$s" -x '*.DS_Store' '*/.gitkeep')
  echo "OK  $out"
done
