#!/usr/bin/env bash

set -euo pipefail

REPO="nlkli/recol"
FORMULA="Formula/recol.rb"

# Get the latest version or use the argument.
VERSION="${1:-$(
  git ls-remote --tags --refs "https://github.com/${REPO}.git" |
    awk -F/ '{print $3}' |
    grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' |
    sort -V |
    tail -n1
)}"

if [[ -z "$VERSION" ]]; then
  echo "Error: version not found"
  exit 1
fi

URL="https://github.com/${REPO}/archive/refs/tags/${VERSION}.tar.gz"

TMP_FILE="$(mktemp)"
trap 'rm -f "$TMP_FILE"' EXIT

echo "Version: $VERSION"
echo "Downloading: $URL"

curl -fsSL "$URL" -o "$TMP_FILE"

SHA256="$(shasum -a 256 "$TMP_FILE" | awk '{print $1}')"

echo "SHA256: $SHA256"

sed -i.bak \
  -E "s#url \"[^\"]+\"#url \"${URL}\"#" \
  "$FORMULA"

sed -i.bak \
  -E "s#sha256 \"[a-f0-9]+\"#sha256 \"${SHA256}\"#" \
  "$FORMULA"

rm -f "${FORMULA}.bak"

echo
echo "Updated $FORMULA"
git diff -- "$FORMULA"
