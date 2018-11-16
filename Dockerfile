FROM alpine:latest

RUN apk --no-cache add clamav clamav-libunrar clamav-milter \
    && mkdir /run/clamav \
    && chown clamav:clamav /run/clamav

COPY config/ /etc/clamav/
COPY entrypoint.sh /usr/bin/

EXPOSE 3310
EXPOSE 7357

RUN freshclam --quiet

ENTRYPOINT [ "entrypoint.sh" ]
