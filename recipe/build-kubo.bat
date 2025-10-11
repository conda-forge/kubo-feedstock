@echo on

set "GOPATH=%SRC_DIR%"
set CGO_ENABLED=1
set "CGO_CFLAGS=%CFLAGS%"
set "CGO_LDFLAGS=%LDFLAGS%"
set GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
set GOTAGS="openssl"

:: https://github.com/conda-forge/kubo-feedstock/issues/5
set "GOTMPDIR=%SRC_DIR%/tmp"

md "%GOTMPDIR%"

cd "src\github.com\ipfs\kubo" ^
    || exit 2

go build ^
    -o "%PREFIX%\Library\bin\ipfs.exe" ^
    .\cmd\ipfs ^
    || exit 3

go-licenses save ./cmd/ipfs ^
    --save_path "%SRC_DIR%\library_licenses" ^
    || exit 4

rd \s \q "%GOTMPDIR%"
