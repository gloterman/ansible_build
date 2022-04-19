FROM alpine:latest

LABEL org.opencontainers.image.title='packer_ansible_build'
LABEL org.opencontainers.image.description="A Docker image Ansible"
LABEL org.opencontainers.image.authors='oss@wescale.fr'
LABEL org.opencontainers.image.source='https://github.com/gloterman/ansible_build.git'

MAINTAINER <oss@wescale.fr>

RUN apk --no-cache update && apk --no-cache upgrade

RUN apk --no-cache add \
    python3 py3-pip py3-setuptools py3-wheel

RUN apk --no-cache add --virtual \
      ansible-build-dependencies python3-dev \
      libffi-dev openssl-dev gcc musl-dev && \
    pip install --no-cache-dir -U \
      pip setuptools wheel && \
    pip install --no-cache-dir ansible-core && \
    apk del ansible-build-dependencies

ENV ANSIBLE_HOST_KEY_CHECKING False

ENTRYPOINT ["/bin/sh"]

