#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEVICE="52E4A9C8-F67B-4065-B7B0-0FB01F0EA594"
OUT="$ROOT/test/visual/manual"

mkdir -p "$OUT"

flutter test "$ROOT/integration_test/main_shell_screenshot_test.dart" -d "$DEVICE" &
TEST_PID=$!

sleep 120
xcrun simctl io "$DEVICE" screenshot "$OUT/03_beranda_simulator.png"

sleep 25
xcrun simctl io "$DEVICE" screenshot "$OUT/04_tab_impian_simulator.png"

sleep 25
xcrun simctl io "$DEVICE" screenshot "$OUT/05_tab_analitik_simulator.png"

sleep 25
xcrun simctl io "$DEVICE" screenshot "$OUT/06_beranda_return_simulator.png"

wait "$TEST_PID"
echo "Screenshots saved to $OUT"
