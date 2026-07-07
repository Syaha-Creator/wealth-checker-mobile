#!/usr/bin/env bash
# scripts/sync-api-docs.sh
#
# Sinkronkan docs/API_REFERENCE.md di repo Flutter ini dari docs/API.md
# di repo backend (wealth-checker), plus catat commit SHA sumbernya.
#
# Jalankan manual:
#   - Setiap kali curiga API backend berubah (lihat commit message wealth-checker)
#   - Sebelum mulai sprint baru yang menyentuh endpoint tertentu
#   - Kalau ada bug aneh dan mau pastikan kontrak API belum berubah
#
# Kalau repo wealth-checker balik jadi PRIVATE, set env var GITHUB_TOKEN
# (personal access token dengan scope "repo") sebelum jalankan script ini.

set -euo pipefail

REPO="Syaha-Creator/wealth-checker"
BRANCH="main"
SOURCE_PATH="docs/API.md"
DEST_PATH="docs/API_REFERENCE.md"
MARKER_PATH="docs/API_REFERENCE.version"

RAW_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/${SOURCE_PATH}"
COMMITS_URL="https://api.github.com/repos/${REPO}/commits?path=${SOURCE_PATH}&sha=${BRANCH}&per_page=1"

AUTH_HEADER=()
if [[ -n "${GITHUB_TOKEN:-}" ]]; then
  AUTH_HEADER=(-H "Authorization: Bearer ${GITHUB_TOKEN}")
fi

mkdir -p "$(dirname "$DEST_PATH")"

echo "Mengambil ${SOURCE_PATH} dari ${REPO}@${BRANCH}..."
curl -sSfL "${AUTH_HEADER[@]}" "$RAW_URL" -o "$DEST_PATH"

echo "Mencatat commit terakhir yang mengubah file ini..."
COMMIT_JSON=$(curl -sSf "${AUTH_HEADER[@]}" "$COMMITS_URL")
LATEST_SHA=$(echo "$COMMIT_JSON" | grep -m1 '"sha"' | cut -d'"' -f4)
LATEST_DATE=$(echo "$COMMIT_JSON" | grep -m1 '"date"' | cut -d'"' -f4)
LATEST_MSG=$(echo "$COMMIT_JSON" | grep -m1 '"message"' | cut -d'"' -f4)

cat > "$MARKER_PATH" <<EOF
source_repo: ${REPO}
source_path: ${SOURCE_PATH}
source_branch: ${BRANCH}
synced_commit: ${LATEST_SHA}
synced_commit_date: ${LATEST_DATE}
synced_commit_message: "${LATEST_MSG}"
synced_at: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
EOF

echo ""
echo "Selesai. API reference tersinkron ke commit ${LATEST_SHA:0:7} (${LATEST_DATE})."
echo "Pesan commit sumber: ${LATEST_MSG}"
echo ""
echo "Cek perubahan: git diff ${DEST_PATH}"
