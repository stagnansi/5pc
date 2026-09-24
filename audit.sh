#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

# 5PC audit script. Run with: bash audit.sh
# Checks for duplicates, unused files, orphan content. Reports only, does not fix.

cd ~/5pc

echo "=== DUPLICATE CONTENT FILES (excluding _index.md) ==="
find content -type f -name "*.md" ! -name "_index.md" -exec basename {} \; | sort | uniq -d || true

echo ""
echo "=== DUPLICATE TITLES ==="
grep -rh "^title" content --include="*.md" | sort | uniq -d || true

echo ""
echo "=== DUPLICATE CSS RULES (excluding pseudo-class) ==="
grep -oE "^  \.[a-z-]+ \{" layouts/partials/custom_head.html | sort | uniq -d || true

echo ""
echo "=== LAYOUTS ==="
find layouts -type f -name "*.html" | sort

echo ""
echo "=== UNUSED STATIC FILES ==="
if [ -d static ]; then
  while IFS= read -r f; do
    name=$(basename "$f")
    if ! grep -rq "$name" content layouts hugo.toml 2>/dev/null; then
      echo "UNUSED: $f"
    fi
  done < <(find static -type f ! -name "favicon.ico")
else
  echo "(no static directory)"
fi

echo ""
echo "=== ORPHAN CONTENT (excluding blog essays) ==="
while IFS= read -r f; do
  slug=$(basename "$f" .md)
  if ! grep -rq "$slug" content layouts 2>/dev/null; then
    echo "ORPHAN: $f"
  fi
done < <(find content -type f -name "*.md" ! -name "_index.md" ! -path "content/blog/*")

echo ""
echo "=== GIT STATUS ==="
git status --short
