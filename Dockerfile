FROM golang:alpine
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git
WORKDIR $GOPATH/src/github.com/scraper/
COPY . .
# Fetch dependencies.
RUN go mod download
# Build the binary.
RUN go build main.go