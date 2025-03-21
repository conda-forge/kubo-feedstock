#!/usr/bin/env bash
set -eux -o pipefail

GOPATH="$( pwd )"
export GOPATH
export CGO_ENABLED=0
export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

# https://github.com/conda-forge/kubo-feedstock/issues/5
GOTMPDIR="$(pwd)/tmp"
export GOTMPDIR

mkdir -p "${GOTMPDIR}"

# omissions from the unix build, needs investigation
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
