# alpinebuild
Dockerfile for building an Alpine linux container with vnc, mono, and wireshark.

NOTE: 
Check for the latest version of mono from https://archive.archlinux.org/packages/m/mono/
and replace, if needed, in Dockerfile before building.

1. Clone repo to host
2. cd ~/alpinebuild
3. docker build -t alpinevnc .
4. docker run -d --rm -it -p 5902:5900 --name=alpvnc1 alpinevnc
5. Use a vncviewer on host (i.e. Tigervnc) to connect at <localhost>:5902
  

This image is based on leenchan/alpine-vnc and neoeinstein/docker-mono-alpine

