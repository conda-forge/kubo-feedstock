#!/usr/bin/env bash
set -eux -o pipefail

GOPATH="$( pwd )"
export GOPATH
export GOROOT="${BUILD_PREFIX}/go"

export CGO_ENABLED=1
export CGO_CFLAGS="${CFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
export GOTAGS="openssl nofuse"

cd "src/github.com/ipfs/kubo"

go build \
    -o "${PREFIX}/bin/ipfs" \
    ./cmd/ipfs \
    || exit 2

go-licenses save ./cmd/ipfs \
    --save_path "${SRC_DIR}/library_licenses" \
    --ignore=bazil.org/fuse \
    || exit 3
