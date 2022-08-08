FROM golang:alpine AS builder
WORKDIR /usr/src/app
RUN go mod init example.com/fullcycle
COPY desafio.go .
RUN go build

FROM scratch
COPY --from=builder /usr/src/app/fullcycle .
ENTRYPOINT [ "./fullcycle" ]
