FROM golang:alpine AS builder
WORKDIR /src
COPY /src/main.go .
RUN go build main.go

FROM scratch
WORKDIR /build
COPY --from=builder /src/main .

CMD ["./main"]
