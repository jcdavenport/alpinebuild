# alpinebuild
Custom dockerfile for building an Alpine linux container with vnc, mono, and wireshark.

1. Clone repo to host
2. cd ~/alpinebuild
3. docker build -t alpinevnc .
4. docker run -d --rm -it -p 5902:5900 --name=alpvnc1 --hostname=alpinevnc alpinevnc
5. Use a vncviewer on host (i.e. Tigervnc) to connect at docker_ipaddr:5902
  

*This image is based on leenchan/alpine-vnc and neoeinstein/docker-mono-alpine

