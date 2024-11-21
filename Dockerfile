
FROM golang:1.22.8 AS builder
WORKDIR /app

COPY . .

RUN go mod download

WORKDIR /app/cmd/ordersystem

RUN go build -o /app/order-system main.go wire_gen.go

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends default-mysql-client && apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /app

COPY --from=builder /app/order-system /app/
COPY --from=builder /app/.env /app/

EXPOSE 8080 50051 8081

CMD ["./order-system"]
