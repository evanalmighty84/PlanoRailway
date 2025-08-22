#!/bin/sh
set -eu

CONF="/etc/tinyproxy/tinyproxy.conf"

# Sanity check
if [ ! -f "$CONF" ]; then
  echo "[tinyproxy] $CONF not found (did the image COPY it?)"
  ls -la /etc/tinyproxy || true
  exit 1
fi

# Optional BasicAuth from env
if [ -n "${PROXY_USER:-}" ] && [ -n "${PROXY_PASS:-}" ]; then
  echo "BasicAuth $PROXY_USER $PROXY_PASS" >> "$CONF"
  echo "[tinyproxy] Auth enabled"
else
  echo "[tinyproxy] Auth DISABLED (open proxy)"
fi

echo "[tinyproxy] Starting..."
exec tinyproxy -d -c "$CONF"
