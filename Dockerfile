FROM alpine:3.20

RUN apk add --no-cache tinyproxy ca-certificates

# copy config + entrypoint
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8888
CMD ["/entrypoint.sh"]
