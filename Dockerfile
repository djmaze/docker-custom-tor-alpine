FROM alpine:edge

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' \
    >> /etc/apk/repositories && \
    apk --update --no-cache add tor@testing su-exec curl

COPY torrc /etc/tor/torrc
COPY /docker-entrypoint /

VOLUME /var/lib/tor
ENTRYPOINT ["/docker-entrypoint"]
CMD ["/usr/bin/tor"]
EXPOSE 9050
HEALTHCHECK --interval=1m --timeout=7s --start-period=30s \
  CMD curl -I --fail --socks5 127.0.0.1:9050 https://check.torproject.org || killall -HUP tor
