#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEVICE="${WC_SCREENSHOT_DEVICE:-52E4A9C8-F67B-4065-B7B0-0FB01F0EA594}"
OUT="$ROOT/test/visual/manual"
TEST="$ROOT/integration_test/checklist_persistence_test.dart"
SIGNAL_PREFIX="@@SCREENSHOT@@:"
BUNDLE_ID="cloud.velrox.wealthCheckerMobile"

mkdir -p "$OUT"

echo "Preparing screenshot test user profile and budget plan"
chmod +x "$ROOT/tool/setup_screenshot_test_user.sh"
"$ROOT/tool/setup_screenshot_test_user.sh"

run_phase() {
  local phase="$1"
  local fifo
  fifo="$(mktemp -u "${TMPDIR:-/tmp}/wc_checklist_screenshot.XXXXXX")"
  mkfifo "$fifo"
  trap 'rm -f "$fifo"' RETURN

  flutter test "$TEST" -d "$DEVICE" \
    --dart-define="CHECKLIST_PHASE=$phase" >"$fifo" 2>&1 &
  local flutter_pid=$!

  while IFS= read -r line; do
    printf '%s\n' "$line"
    case "$line" in
      *"${SIGNAL_PREFIX}"*)
        local stem="${line##*${SIGNAL_PREFIX}}"
        stem="${stem//$'\r'/}"
        xcrun simctl io "$DEVICE" screenshot "$OUT/${stem}.png"
        echo "Captured $OUT/${stem}.png"
        ;;
    esac
  done <"$fifo"

  wait "$flutter_pid"
}

echo "Phase 1: toggle checklist items and capture before-close screenshots"
run_phase toggle

echo "Terminating app on simulator ($BUNDLE_ID)"
xcrun simctl terminate "$DEVICE" "$BUNDLE_ID" || true
sleep 2

echo "Phase 2: reopen app and verify persisted checklist state"
run_phase verify

echo "Checklist persistence screenshots saved to $OUT"
ls -la "$OUT"/legacy_checklist_*.png "$OUT"/budgeting_tips_*.png 2>/dev/null || true
