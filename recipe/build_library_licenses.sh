#!/usr/bin/env bash
set -eux

export LIBRARY_LICENSES_PATH="${SRC_DIR}/library_licenses/"

# this list is all go stdlib on windows
#
# when a test fails, grab the raw azure log, and find-and-replace:
#
#   ^20.* Package (\S+) does not have module info.*$
#
# with
#
#   --ignore $1 \
#
# add to the list below and sort

go-licenses save \
    "." \
    --ignore archive/tar \
    --ignore archive/zip \
    --ignore bufio \
    --ignore bytes \
    --ignore cache \
    --ignore cmp \
    --ignore compress/flate \
    --ignore compress/gzip \
    --ignore compress/zlib \
    --ignore container/heap \
    --ignore container/list \
    --ignore context \
    --ignore crypto \
    --ignore crypto/aes \
    --ignore crypto/cipher \
    --ignore crypto/ecdh \
    --ignore crypto/ecdsa \
    --ignore crypto/ed25519 \
    --ignore crypto/elliptic \
    --ignore crypto/hmac \
    --ignore crypto/md5 \
    --ignore crypto/rand \
    --ignore crypto/rsa \
    --ignore crypto/sha1 \
    --ignore crypto/sha256 \
    --ignore crypto/sha512 \
    --ignore crypto/subtle \
    --ignore crypto/tls \
    --ignore crypto/x509 \
    --ignore crypto/x509/pkix \
    --ignore database/sql \
    --ignore database/sql/driver \
    --ignore embed \
    --ignore encoding \
    --ignore encoding/asn1 \
    --ignore encoding/base32 \
    --ignore encoding/base64 \
    --ignore encoding/binary \
    --ignore encoding/gob \
    --ignore encoding/hex \
    --ignore encoding/json \
    --ignore encoding/pem \
    --ignore encoding/xml \
    --ignore errors \
    --ignore expvar \
    --ignore flag \
    --ignore fmt \
    --ignore go/ast \
    --ignore go/build/constraint \
    --ignore go/doc/comment \
    --ignore go/format \
    --ignore go/internal/typeparams \
    --ignore go/parser \
    --ignore go/printer \
    --ignore go/scanner \
    --ignore go/token \
    --ignore hash \
    --ignore hash/crc32 \
    --ignore hash/fnv \
    --ignore internal/abi \
    --ignore internal/asan \
    --ignore internal/bisect \
    --ignore internal/bytealg \
    --ignore internal/byteorder \
    --ignore internal/chacha8rand \
    --ignore internal/concurrent \
    --ignore internal/coverage/rtcov \
    --ignore internal/cpu \
    --ignore internal/filepathlite \
    --ignore internal/fmtsort \
    --ignore internal/goarch \
    --ignore internal/godebug \
    --ignore internal/godebugs \
    --ignore internal/goexperiment \
    --ignore internal/goos \
    --ignore internal/itoa \
    --ignore internal/msan \
    --ignore internal/nettrace \
    --ignore internal/oserror \
    --ignore internal/poll \
    --ignore internal/profilerecord \
    --ignore internal/race \
    --ignore internal/reflectlite \
    --ignore internal/runtime/atomic \
    --ignore internal/runtime/exithook \
    --ignore internal/runtime/maps \
    --ignore internal/runtime/math \
    --ignore internal/runtime/sys \
    --ignore internal/runtime/syscall \
    --ignore internal/saferio \
    --ignore internal/singleflight \
    --ignore internal/stringslite \
    --ignore internal/sync  \
    --ignore internal/syscall/execenv \
    --ignore internal/syscall/unix \
    --ignore internal/syscall/windows \
    --ignore internal/syscall/windows/registry \
    --ignore internal/syscall/windows/sysdll \
    --ignore internal/sysinfo \
    --ignore internal/testlog \
    --ignore internal/unsafeheader \
    --ignore internal/weak \
    --ignore io \
    --ignore io/fs \
    --ignore io/ioutil \
    --ignore iter \
    --ignore log \
    --ignore log/slog \
    --ignore maps \
    --ignore math \
    --ignore math/big \
    --ignore math/bits \
    --ignore math/cmplx \
    --ignore math/rand \
    --ignore math/rand/v2 \
    --ignore mime \
    --ignore mime/multipart \
    --ignore net \
    --ignore net/http \
    --ignore net/http/httptest \
    --ignore net/http/httptrace \
    --ignore net/netip \
    --ignore net/textproto \
    --ignore net/url \
    --ignore os \
    --ignore os/exec \
    --ignore os/signal \
    --ignore path \
    --ignore path/filepath \
    --ignore reflect \
    --ignore regexp \
    --ignore runtime \
    --ignore runtime/debug \
    --ignore runtime/metrics \
    --ignore runtime/pprof \
    --ignore slices \
    --ignore sort \
    --ignore strconv \
    --ignore strings \
    --ignore sync \
    --ignore sync/atomic \
    --ignore syscall \
    --ignore testing \
    --ignore text/tabwriter \
    --ignore text/template \
    --ignore time \
    --ignore unicode \
    --ignore unicode/utf16 \
    --ignore unicode/utf8 \
    --ignore unique \
    --ignore vendor/golang.org/x/crypto/chacha20 \
    --ignore vendor/golang.org/x/crypto/chacha20poly1305 \
    --ignore vendor/golang.org/x/crypto/cryptobyte \
    --ignore vendor/golang.org/x/crypto/cryptobyte/asn1 \
    --ignore vendor/golang.org/x/crypto/hkdf \
    --ignore vendor/golang.org/x/crypto/internal/alias \
    --ignore vendor/golang.org/x/crypto/internal/poly1305 \
    --ignore vendor/golang.org/x/crypto/sha3 \
    --ignore vendor/golang.org/x/net/dns/dnsmessage \
    --ignore vendor/golang.org/x/net/http/httpguts \
    --ignore vendor/golang.org/x/net/http/httpproxy \
    --ignore vendor/golang.org/x/net/http2/hpack \
    --ignore vendor/golang.org/x/net/idna \
    --ignore vendor/golang.org/x/sys/cpu \
    --ignore vendor/golang.org/x/text/secure/bidirule \
    --ignore vendor/golang.org/x/text/transform \
    --ignore vendor/golang.org/x/text/unicode/bidi \
    --ignore vendor/golang.org/x/text/unicode/norm \
    --ignore weak \
    --save_path "${LIBRARY_LICENSES_PATH}"

find "${LIBRARY_LICENSES_PATH}"
