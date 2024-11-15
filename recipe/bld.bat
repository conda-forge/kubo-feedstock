copy "%RECIPE_DIR%\build_win.sh" . || exit 1

set "PREFIX=%PREFIX:\=/%"
set "SRC_DIR=%SRC_DIR:\=/%"
set "MSYSTEM=MINGW%ARCH%"
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1

bash -lc "./build_win.sh" || exit 1
