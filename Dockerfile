FROM alpine:3.20

# tinyproxy + bash for entrypoint + nc for healthcheck
RUN apk add --no-cache tinyproxy bash netcat-openbsd

# Copy template config + entrypoint
COPY tinyproxy.conf /tmp/tinyproxy.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8888

# simpler healthcheck that doesn't depend on HTTP proxy semantics
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD nc -z 127.0.0.1 8888 || exit 1

CMD ["/entrypoint.sh"]
