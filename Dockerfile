FROM golang:1.8.3-jessie

ARG CONTAINER_UID
ENV CONTAINER_UID ${CONTAINER_UID:-1000}

RUN useradd -s /bin/bash -u CONTAINER_UID golang
RUN curl https://glide.sh/get | sh
USER golang