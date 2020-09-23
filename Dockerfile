FROM golang:alpine as builder

RUN apk -U --no-cache add git make

ENV GOROOT /usr/local/go

ADD . /src/sdf-converter
WORKDIR /src/sdf-converter

RUN make binary

#--- # ---#

FROM alpine

COPY --from=builder /src/sdf-converter/bin/sdf-converter /app/sdf-converter

RUN apk -U --no-cache add bash ca-certificates \
    && chmod +x /app/sdf-converter

WORKDIR /app

VOLUME ["/app/config"]

ENTRYPOINT ["/app/sdf-converter"]
