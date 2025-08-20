#!/usr/bin/env bash
set -e

CONF="/etc/tinyproxy/tinyproxy.conf"
mkdir -p /etc/tinyproxy
cp /tmp/tinyproxy.conf "$CONF"

if [[ -n "$PROXY_USER" && -n "$PROXY_PASS" ]]; then
  echo "BasicAuth $PROXY_USER $PROXY_PASS" >> "$CONF"
  echo "[tinyproxy] Auth enabled"
else
  echo "[tinyproxy] Auth DISABLED (open proxy) — not recommended"
fi

exec tinyproxy -d -c "$CONF"
