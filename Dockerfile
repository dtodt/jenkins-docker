FROM jenkins
USER root

RUN mkdir -p /tmp/download && \
 curl -L https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 addgroup docker && \
 addgroup jenkins docker && \
 addgroup root docker

RUN apt-get update && \
 apt-get install -y nodejs npm nodejs-legacy && \
 apt-get clean -y

user jenkins