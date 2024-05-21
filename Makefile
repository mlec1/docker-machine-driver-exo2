NAME:=exo2

# local build, use user and timestamp it
BINARY_NAME ?= ${NAME}
VERSION:=$(shell  date +%Y%m%d%H%M%S)

LDFLAGS=-ldflags "-w -s"

DIST_DIR:=dist
GO ?= go

.PHONY: all
all: build

#
# Docker-related tasks
#
build:
	mkdir -p ${DIST_DIR}
	CGO_ENABLED=0 GO111MODULE=on GOOS=linux GOARCH=amd64 go build -buildvcs=false -o ${DIST_DIR}/docker-machine-driver-${BINARY_NAME} .
	shasum -a 256 ${DIST_DIR}/*