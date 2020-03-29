FROM alpine:latest

MAINTAINER Adam Garibay <adam.garibay@gmail.com>

RUN mkdir -pv /etc/murmur

RUN adduser -DHs /sbin/nologin murmur

RUN apk update && \
    apk upgrade && \
    apk add murmur && \
    rm -rf /var/cache/apk/*

RUN mv /etc/murmur.ini /etc/murmur/murmur.ini && \
    chown -R murmur:murmur /etc/murmur

EXPOSE 64738/tcp 64738/udp 50051

USER murmur

VOLUME /etc/murmur

CMD /usr/bin/murmurd -v -fg -ini /etc/murmur/murmur.ini
