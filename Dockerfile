FROM golang:1.13.5-alpine3.10
ENV GIT_TAG v1.3.2
ENV PATH $PATH:/go/bin
ENV CGO_ENABLED 0

RUN adduser -D -u 1000 golang
RUN apk add --no-cache \
    git \
    curl\
    unzip \
    zip \
    make \
    ca-certificates \
    protobuf

RUN go get google.golang.org/grpc \
    && go get -d -u github.com/golang/protobuf/protoc-gen-go \
    && git -C /go/src/github.com/golang/protobuf checkout $GIT_TAG \
    && go install github.com/golang/protobuf/protoc-gen-go \
    && chown -R golang:golang /go


WORKDIR $GOPATH/src
USER golang
