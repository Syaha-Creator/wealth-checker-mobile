#!/usr/bin/env bash
set -euo pipefail

API="${WC_API_BASE_URL:-https://wealth.velrox.cloud}"
EMAIL="${WC_SCREENSHOT_EMAIL:-wc-txform-1783390317@example.com}"
PASS="${WC_SCREENSHOT_PASSWORD:-TestPass123!}"
ORIGIN="app://wealth-checker-mobile"

TOKEN=$(curl -sS -D - -o /tmp/wc_signin.json -X POST "$API/api/auth/sign-in/email" \
  -H "Content-Type: application/json" \
  -H "Origin: $ORIGIN" \
  -d "{\"email\":\"$EMAIL\",\"password\":\"$PASS\"}" | tr -d '\r' | awk -F': ' '/^set-auth-token:/ {print $2; exit}')

if [ -z "$TOKEN" ]; then
  TOKEN=$(python3 -c "import json; print(json.load(open('/tmp/wc_signin.json')).get('token',''))")
fi

if [ -z "$TOKEN" ]; then
  echo "Failed to obtain auth token for $EMAIL" >&2
  exit 1
fi

curl -sS -X PUT "$API/api/profile" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -H "Origin: $ORIGIN" \
  -d '{
    "tanggalLahir": "1990-05-15",
    "rencanaUsiaPensiun": 55,
    "rencanaUsiaWarisan": 80,
    "anggotaKeluargaDitanggung": 3,
    "pemasukanBulananRataRata": 10000000,
    "pengeluaranBulananRataRata": 7000000
  }' >/dev/null

curl -sS -X POST "$API/api/budget-plans" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -H "Origin: $ORIGIN" \
  -d '{"rencanaPemasukanBulanan": 10000000}' >/dev/null || true

echo "Prepared screenshot test user: $EMAIL"
