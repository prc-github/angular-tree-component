#!/usr/bin/env bash
# Linux equivalent of build_tarball.bat.
# Packs dist/angular-tree-component into dist_package/<name>.tgz
# with the npm-style top-level "package/" folder.
#
# Usage: ./build_tarball.sh [tarball-name]
#   default name: angular-tree-component-<version>-scroll-fix.tgz
#
# Run "npm run build:lib && npm run copy:files" first.
set -euo pipefail

cd "$(dirname "$0")"

SRC=dist/angular-tree-component
OUT=dist_package

if [ ! -f "$SRC/package.json" ]; then
  echo "Error: $SRC not found - run 'npm run build:lib && npm run copy:files' first." >&2
  exit 1
fi

VERSION=$(node -p "require('./$SRC/package.json').version")
NAME=${1:-angular-tree-component-${VERSION}-scroll-fix.tgz}

rm -rf "$OUT/package" "$OUT/$NAME"
mkdir -p "$OUT/package"
cp -a "$SRC/." "$OUT/package/"

tar -czf "$OUT/$NAME" -C "$OUT" package

echo "Created $OUT/$NAME"
