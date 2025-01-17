FROM alpine:edge

MAINTAINER jcdavenport

ADD conf /conf
ADD run.sh /run.sh
ADD run /run
ADD frp /usr/local/frp

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing">>/etc/apk/repositories && \
    apk update && \
    apk add curl supervisor bash openssh git \
    terminator terminus-font wireshark-gtk \
    xfce4 xvfb x11vnc firefox wqy-zenhei gnome-icon-theme && \
    ssh-keygen -A && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "root:root" chpasswd && \
    rm -rf /var/cache/apk/* && \
    chmod +x /run.sh && \
    chmod +x /run/*.sh && \
    chmod +x /usr/local/frp/frps && \
    chmod +x /usr/local/frp/frpc

RUN apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache --virtual=.build-dependencies ca-certificates && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    apk del .build-dependencies

EXPOSE 80 22 5900 6800

CMD ["/run.sh"]
