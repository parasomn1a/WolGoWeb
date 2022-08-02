FROM --platform=linux/amd64 golang:1.18-alpine3.16 AS build_base

ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn
ENV TZ Asia/Shanghai

COPY ./ /buildir

RUN cd /buildir && \
    go mod tidy && \
    go build -o wol ./src/main.go ./src/wol.go

FROM --platform=linux/amd64 alpine

WORKDIR /web

ENV VERSION 0.0.4
ENV PORT 9090
ENV KEY false

COPY ./static /web/static
COPY --from=build_base /buildir/wol /web/wol

RUN chmod 755 /web/static

EXPOSE $PORT

CMD ["/web/wol", "-c", "env"]

