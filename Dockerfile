FROM alpine:latest

RUN addgroup -g 2001 clamav && adduser -u 2001 -G clamav -h /var/lib/clamav -D -s /sbin/nologin clamav

RUN apk --no-cache add clamav clamav-libunrar clamav-milter \
    && mkdir /run/clamav \
    && chown clamav:clamav /run/clamav

COPY config/ /etc/clamav/
COPY entrypoint.sh /usr/bin/

EXPOSE 3310
EXPOSE 7357

RUN freshclam --quiet

ENTRYPOINT [ "entrypoint.sh" ]
