#!/usr/bin/env bash
# Doğrulama: SKILL.md var mı, üst bilgi tam mı, olası gizli veri var mı
set -uo pipefail
cd "$(dirname "$0")/.."; rc=0
for d in skills/*/; do s=$(basename "$d"); [[ "$s" == _* ]] && continue
  f="$d/SKILL.md"
  [[ -f $f ]] || { echo "HATA $s: SKILL.md yok"; rc=1; continue; }
  grep -q '^name:' "$f" && grep -q '^description:' "$f" || { echo "HATA $s: name/description eksik"; rc=1; }
  grep -q '^version:' "$f" || echo "UYARI $s: version alanı yok"
  grep -rEn '(api[_-]?key|token|password|sifre)\s*[:=]\s*[A-Za-z0-9]{16,}' "$d" && { echo "HATA $s: olası gizli veri"; rc=1; }
done; exit $rc
