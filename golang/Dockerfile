# Build
FROM golang:1.17-buster AS build

WORKDIR /app

COPY . .

RUN go mod tidy && go build -a -o app_name

## Deploy
FROM alpine:3.14

RUN apk add --no-cache libc6-compat

WORKDIR /

COPY --from=build /app/app_name /app_name

EXPOSE 8090

ENTRYPOINT ["/app_name"]
