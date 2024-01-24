FROM golang:1.21 AS builder
WORKDIR /usr/src
COPY ./* .
RUN CGO_ENABLED=0 GOOS=linux go build -o hello-world main.go

FROM gcr.io/distroless/static
COPY --from=builder /usr/src/hello-world /bin/hello-world
CMD ["/bin/hello-world"]
EXPOSE 8080
