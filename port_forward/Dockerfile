FROM ghcr.io/linuxserver/baseimage-alpine:arm32v7-3.12
RUN apk add --no-cache transmission-cli
ADD pia-port.sh /scripts/pia-port.sh
RUN chmod +x /scripts/*.sh
CMD ["/scripts/pia-port.sh"]
