#!/usr/bin/env bash
set -eux

export GOPATH="$( pwd )"
export CGO_ENABLED=1
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

# https://github.com/conda-forge/kubo-feedstock/issues/5
export GOTMPDIR="$(pwd)/tmp"

mkdir -p "${GOTMPDIR}"

# export GOTAGS="openssl"
# export CGO_CFLAGS="${CFLAGS}"
# export CGO_CXXFLAGS="${CPPFLAGS}"
# export CGO_LDFLAGS="${LDFLAGS}"

module='github.com/ipfs/kubo'

make -C "src/${module}" install nofuse

pushd "src/${module}"
    bash "${RECIPE_DIR}/build_library_licenses.sh"
popd

rm -rf "${GOTMPDIR}"
