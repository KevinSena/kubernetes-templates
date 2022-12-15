FROM golang:1.19 AS build
WORKDIR /
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64  go build -o server main.go
FROM scratch
WORKDIR /
COPY --from=build /server /
CMD ["/server"]