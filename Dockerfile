FROM alpine:edge

MAINTAINER jcdavenport

ADD conf /conf
ADD run.sh /run.sh
ADD run /run
ADD frp /usr/local/frp

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing">>/etc/apk/repositories && \
    apk update && \
    apk add --no-cache --virtual=build-dependencies wget ca-certificates tar xz \
    curl supervisor bash openssh git \
    terminator terminus-font wireshark-gtk \
    xfce4 xvfb x11vnc firefox wqy-zenhei \
    wget --progress=dot:mega https://archive.archlinux.org/packages/m/mono/mono-mono-5.4.1.7-2-x86_64.pkg.tar.xz -O /tmp/mono.pkg.tar.xz && \
    tar -xJf /tmp/mono.pkg.tar.xz && \
    mozroots --import --ask-remove && \
    ssh-keygen -A && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "root:root" chpasswd && \
    apk del build-dependencies && \
    rm /tmp/* && \
    rm -rf /var/cache/apk/* && \
    chmod +x /run.sh && \
    chmod +x /run/*.sh && \
    chmod +x /usr/local/frp/frps && \
    chmod +x /usr/local/frp/frpc

EXPOSE 80 22 5900 6800

CMD ["/run.sh"]
