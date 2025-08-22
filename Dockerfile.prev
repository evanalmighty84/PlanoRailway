# tinyproxy on Alpine, started via our entrypoint
FROM alpine:3.20

# tinyproxy + bash for our entrypoint + nc for optional healthcheck
RUN apk add --no-cache tinyproxy bash netcat-openbsd

# Put the config where entrypoint expects it
COPY tinyproxy.conf /tmp/tinyproxy.conf

# Add entrypoint and make it executable
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8888

# Optional: basic TCP healthcheck (Tinyproxy listens on 8888)
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD nc -z localhost 8888 || exit 1

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
