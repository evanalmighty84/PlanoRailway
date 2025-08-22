#!/bin/sh
set -eu

CONF="/etc/tinyproxy/tinyproxy.conf"

if [ -n "${PROXY_USER:-}" ] && [ -n "${PROXY_PASS:-}" ]; then
  echo "BasicAuth ${PROXY_USER} ${PROXY_PASS}" >> "$CONF"
  echo "[tinyproxy] Auth enabled"
else
  echo "[tinyproxy] Auth DISABLED (open proxy)"
fi

exec tinyproxy -d -c "$CONF"
