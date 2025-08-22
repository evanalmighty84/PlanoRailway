FROM alpine:3.20
RUN apk add --no-cache tinyproxy ca-certificates

# Bake the config into the image directly
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Entrypoint just tweaks auth and launches
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && sed -i 's/\r$//' /entrypoint.sh

EXPOSE 8888
CMD ["/entrypoint.sh"]
