# build stage
FROM golang:1.14.13-alpine AS builder
RUN apk add --no-cache git
WORKDIR /go/src/github.com/dgkanatsios/AksNodePublicIPController
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /build/app .

# final stage
FROM alpine:3.12
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=builder /build/app .
CMD ["./app"]
LABEL Name=aksnodepublicipcontroller
