#!/usr/bin/env bash


source .env

docker build -t ansible_build -f Dockerfile \
    --build-arg ANSIBLE_VERSION=${ANSIBLE_VERSION} \
    --build-arg JINJA_VERSION=${JINJA_VERSION} \
    --build-arg NETADDR_VERSION=${NETADDR_VERSION} \
    --build-arg BOTO3_VERSION=${BOTO3_VERSION} \
    .
