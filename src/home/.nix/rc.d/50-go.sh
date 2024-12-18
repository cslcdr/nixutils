#!/usr/bin/env bash

export GOPATH=~/.go
export GOPROXY=direct
export GOROOT=~/.go/sdk

PATH=${GOPATH}/bin:${GOROOT}/bin:${PATH}
