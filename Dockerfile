#
# Dockerfile for shadowsocks-go
#
 
FROM busybox:uclibc
LABEL maintainer="mr.muzea@gmail.com"

ENV SS_VER 1.2.1
ENV SS_URL https://github.com/shadowsocks/shadowsocks-go/releases/download/$SS_VER/shadowsocks-server.tar.gz

ADD $SS_URL /

RUN tar zxf shadowsocks-server.tar.gz

ENV SERVER_PORT 8388
ENV METHOD      "chacha20"
ENV PASSWORD    "hualihushao"
ENV TIMEOUT     60
 
EXPOSE $SERVER_PORT/tcp
EXPOSE $SERVER_PORT/udp
 
CMD /bin/shadowsocks-server -p $SERVER_PORT -k $PASSWORD -m  $METHOD -t  $TIMEOUT -u

