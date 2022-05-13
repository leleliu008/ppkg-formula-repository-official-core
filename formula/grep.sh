pkg_set summary "GNU grep, egrep and fgrep"
pkg_set webpage "https://www.gnu.org/software/grep"
pkg_set src.url "https://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz"
pkg_set src.sha "5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-threads=posix \
        --disable-assert \
        --disable-gcc-warnings \
        --with-included-regex &&
    sed_in_place 's|bash|sh|' "$PACKAGE_INSTALL_DIR/bin/egrep" &&
    sed_in_place 's|bash|sh|' "$PACKAGE_INSTALL_DIR/bin/fgrep"
}
