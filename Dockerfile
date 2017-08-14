FROM golang:1.8.3-alpine3.5


ENV PROTOC_VERSION 3.3.0

RUN adduser -D -u 1000 -s bash golang
RUN apk --update --no-cache add git curl build-base autoconf automake libtool

WORKDIR /tmp/protoc/protobuf-$PROTOC_VERSION
RUN curl -sL https://github.com/google/protobuf/archive/v$PROTOC_VERSION.tar.gz | tar zxvf - -C /tmp/protoc

RUN ./autogen.sh && \
  ./configure --prefix=/usr && \
  make -j 3 && \
  make check && \
  make install

WORKDIR $GOPATH
RUN rm -rf /tmp/protoc

RUN go get google.golang.org/grpc \
    && go get -u github.com/golang/protobuf/protoc-gen-go

RUN curl https://glide.sh/get | sh

USER golang