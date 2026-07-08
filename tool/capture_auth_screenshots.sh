#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEVICE="${WC_SCREENSHOT_DEVICE:-52E4A9C8-F67B-4065-B7B0-0FB01F0EA594}"
OUT="$ROOT/test/visual/manual"
TEST="$ROOT/integration_test/auth_pages_screenshot_test.dart"
SIGNAL_PREFIX="@@SCREENSHOT@@:"

mkdir -p "$OUT"

FIFO="$(mktemp -u "${TMPDIR:-/tmp}/wc_auth_screenshot.XXXXXX")"
mkfifo "$FIFO"
trap 'rm -f "$FIFO"' EXIT

flutter test "$TEST" -d "$DEVICE" >"$FIFO" 2>&1 &
FLUTTER_PID=$!

while IFS= read -r line; do
  printf '%s\n' "$line"
  case "$line" in
    *"${SIGNAL_PREFIX}"*)
      stem="${line##*${SIGNAL_PREFIX}}"
      stem="${stem//$'\r'/}"
      xcrun simctl io "$DEVICE" screenshot "$OUT/${stem}.png"
      echo "Captured $OUT/${stem}.png"
      ;;
  esac
done <"$FIFO"

wait "$FLUTTER_PID"

echo "Auth screenshots saved to $OUT"
