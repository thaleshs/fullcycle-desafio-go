FROM scratch

COPY /bin/app /go/bin/app

ENTRYPOINT ["/go/bin/app"]