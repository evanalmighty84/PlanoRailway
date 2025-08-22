                       #!/bin/sh
                       set -eu

                       CONF=/etc/tinyproxy/tinyproxy.conf

                       # If you set PROXY_USER / PROXY_PASS in this service's Variables,
                       # we append BasicAuth automatically.
                       if [ -n "${PROXY_USER:-}" ] && [ -n "${PROXY_PASS:-}" ]; then
                         echo "BasicAuth ${PROXY_USER} ${PROXY_PASS}" >> "$CONF"
                         echo "[entrypoint] Added BasicAuth"
                       fi

                       echo "[entrypoint] Starting tinyproxy on 0.0.0.0:8888"
                       exec tinyproxy -d -c "$CONF"
