FROM golang:1.8.3-jessie

RUN useradd -D -s /bin/bash golang
RUN curl https://glide.sh/get | sh
USER golang