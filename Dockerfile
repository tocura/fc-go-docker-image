FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY go.mod .
COPY main.go .

RUN go build -o app .

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/app /app/

CMD [ "./app" ]