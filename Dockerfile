FROM golang:1.12.9-alpine3.10

ENV PROTOC_VERSION 3.9.1


RUN adduser -D -u 1000 golang
RUN apk add --no-cache \
    git \
    curl\
    unzip \
    make \
    ca-certificates \
    &&  curl -o tmp.zip -L https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip \
    && unzip -o tmp.zip -d /usr/local bin/protoc \
    && unzip -o tmp.zip -d /usr/local include/* \
    && rm -rf tmp.zip

RUN go get google.golang.org/grpc \
    && go get -u github.com/golang/protobuf/protoc-gen-go \
    && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
    #&& curl https://glide.sh/get | sh \
    && mkdir $GOPATH/src/workspace \
    && chown -R golang:golang $GOPATH


WORKDIR $GOPATH/src/workspace

USER golang
