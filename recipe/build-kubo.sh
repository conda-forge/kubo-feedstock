#!/usr/bin/env bash
set -eux -o pipefail

GOPATH="$( pwd )"
export GOPATH
export GOROOT="${BUILD_PREFIX}/go"

export CGO_ENABLED=1
export CGO_CFLAGS="${CFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
export GOTAGS="openssl"

cd "src/github.com/ipfs/kubo"

bash "${RECIPE_DIR}/check-go-version.sh" \
    || exit 2

go build \
    -o "${PREFIX}/bin/ipfs" \
    ./cmd/ipfs \
    || exit 3

go-licenses save ./cmd/ipfs --save_path "${SRC_DIR}/license-files" \
    || exit 4
