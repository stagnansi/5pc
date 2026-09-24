#!/data/data/com.termux/files/usr/bin/bash
# 5PC audit script. Run with: bash audit.sh

cd ~/5pc

echo "=== DUPLICATE CONTENT FILES ==="
find content -type f -name "*.md" | xargs -I{} basename {} | sort | uniq -d

echo ""
echo "=== DUPLICATE TITLES ==="
grep -rh "^title" content --include="*.md" | sort | uniq -d

echo ""
echo "=== DUPLICATE CSS RULES (custom_head) ==="
grep -oE "^  \.[a-z-]+" layouts/partials/custom_head.html | sort | uniq -d

echo ""
echo "=== LAYOUTS ==="
find layouts -type f -name "*.html" | sort

echo ""
echo "=== UNUSED STATIC FILES ==="
if [ -d static ]; then
  for f in $(find static -type f); do
    name=$(basename "$f")
    grep -rq "$name" content layouts 2>/dev/null || echo "UNUSED: $f"
  done
else
  echo "(no static directory)"
fi

echo ""
echo "=== ORPHAN CONTENT (not linked anywhere) ==="
for f in $(find content -type f -name "*.md" ! -name "_index.md"); do
  slug=$(basename "$f" .md)
  grep -rq "$slug" content layouts 2>/dev/null || echo "ORPHAN: $f"
done

echo ""
echo "=== GIT STATUS ==="
git status --short
