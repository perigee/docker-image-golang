FROM golang:1.8.3-jessie

RUN useradd -s /bin/bash -u 1000 golang
RUN curl https://glide.sh/get | sh
USER golang