FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY /src/app .

RUN go get -d -v \
    && go install -v \
    && go build -o $GOPATH/bin/app

##

FROM scratch

COPY --from=builder /go/bin/app /go/bin/

ENTRYPOINT ["/go/bin/app"]