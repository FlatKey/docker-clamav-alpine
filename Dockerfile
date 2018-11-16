FROM alpine:latest

RUN apk --no-cache add clamav clamav-libunrar clamav-milter \
    && mkdir /run/clamav \
    && chown clamav:clamav /run/clamav

RUN sed -i 's/^#Foreground .*$/Foreground true/g' /etc/clamav/clamd.conf \
    && sed -i 's/^#TCPSocket .*$/TCPSocket 3310/g' /etc/clamav/clamd.conf \
    && sed -i 's/^#Foreground .*$/Foreground true/g' /etc/clamav/freshclam.conf

COPY entrypoint.sh /usr/bin/

EXPOSE 3310
EXPOSE 7357

RUN freshclam --quiet

ENTRYPOINT [ "entrypoint.sh" ]
