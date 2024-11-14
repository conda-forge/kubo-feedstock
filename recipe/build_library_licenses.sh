#!/usr/bin/env bash
set -eux

export LIBRARY_LICENSES_PATH="${SRC_DIR}/library_licenses/"

go-licenses save \
    "." \
    --ignore archive/zip\
    --ignore mime/multipart \
    --ignore os/exec \
    --save_path "${LIBRARY_LICENSES_PATH}"

find "${LIBRARY_LICENSES_PATH}"
