#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEVICE="52E4A9C8-F67B-4065-B7B0-0FB01F0EA594"
OUT="$ROOT/test/visual/manual"

mkdir -p "$OUT"

flutter test "$ROOT/integration_test/visual_screenshot_test.dart" -d "$DEVICE" &
TEST_PID=$!

sleep 100
xcrun simctl io "$DEVICE" screenshot "$OUT/01_dashboard_simulator.png"

sleep 55
xcrun simctl io "$DEVICE" screenshot "$OUT/02_transaction_form_simulator.png"

wait "$TEST_PID"
echo "Screenshots saved to $OUT"
