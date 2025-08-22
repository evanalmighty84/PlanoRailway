#!/usr/bin/env bash
set -euo pipefail

CONF="/etc/tinyproxy/tinyproxy.conf"
mkdir -p /etc/tinyproxy
cp /tmp/tinyproxy.conf "$CONF"

if [[ -n "${PROXY_USER:-}" && -n "${PROXY_PASS:-}" ]]; then
  echo "BasicAuth $PROXY_USER $PROXY_PASS" >> "$CONF"
  echo "[tinyproxy] Auth enabled"
else
  echo "[tinyproxy] Auth DISABLED (open proxy)"
fi

echo "[tinyproxy] Starting with config:"
grep -E '^(Port|Listen|Allow|ConnectPort|BasicAuth|LogLevel)' "$CONF" || true

# -d keeps logs on stdout/stderr, perfect for Railway logs
exec tinyproxy -d -c "$CONF"
