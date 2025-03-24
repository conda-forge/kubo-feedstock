#!/usr/bin/env bash
set -eux -o pipefail

GOPATH="$( pwd )"
export GOPATH
export CGO_ENABLED=1
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
export GOTAGS="openssl"

# https://github.com/conda-forge/kubo-feedstock/issues/5
GOTMPDIR="$(pwd)/tmp"
export GOTMPDIR

mkdir -p "${GOTMPDIR}"

module='github.com/ipfs/kubo'

make -C "src/${module}" install nofuse

pushd "src/${module}"
    bash "${RECIPE_DIR}/build_library_licenses.sh"
popd

rm -rf "${GOTMPDIR}"
