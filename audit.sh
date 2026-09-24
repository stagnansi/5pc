#!/data/data/com.termux/files/usr/bin/bash
# 5PC audit script. Run with: bash audit.sh

cd ~/5pc

echo "=== DUPLICATE CONTENT FILES (excluding _index.md) ==="
find content -type f -name "*.md" ! -name "_index.md" -exec basename {} \; | sort | uniq -d

echo ""
echo "=== DUPLICATE TITLES ==="
grep -rh "^title" content --include="*.md" | sort | uniq -d

echo ""
echo "=== DUPLICATE CSS RULES (excluding pseudo-class) ==="
grep -oE "^  \.[a-z-]+ \{" layouts/partials/custom_head.html | sort | uniq -d

echo ""
echo "=== LAYOUTS ==="
find layouts -type f -name "*.html" | sort

echo ""
echo "=== UNUSED STATIC FILES ==="
if [ -d static ]; then
  for f in $(find static -type f ! -name "favicon.ico"); do
    name=$(basename "$f")
    if ! grep -rq "$name" content layouts hugo.toml 2>/dev/null; then
      echo "UNUSED: $f"
    fi
  done
else
  echo "(no static directory)"
fi

echo ""
echo "=== ORPHAN CONTENT (excluding blog essays) ==="
for f in $(find content -type f -name "*.md" ! -name "_index.md" ! -path "content/blog/*"); do
  slug=$(basename "$f" .md)
  if ! grep -rq "$slug" content layouts 2>/dev/null; then
    echo "ORPHAN: $f"
  fi
done

echo ""
echo "=== GIT STATUS ==="
git status --short
