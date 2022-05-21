pkg_set summary "Interpreted, interactive, object-oriented programming language"
pkg_set webpage "https://www.python.org"
pkg_set src.url "https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tar.xz"
pkg_set src.sha "0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffcb6d1820d716d83"
pkg_set git.url "https://github.com/python/cpython.git"
pkg_set license "Python-2.0"
pkg_set depends "expat libffi openssl sqlite bzip2 xz"
pkg_set bsystem "configure"

build() {
    unset PYTHONHOME
    unset PYTHONPATH

    configure \
        --with-system-expat \
        --with-system-ffi \
        --with-openssl="$openssl_INSTALL_DIR" \
        --with-ensurepip=no \
        --with-lto \
        --enable-ipv6 \
        --enable-loadable-sqlite-extensions \
        --disable-profiling
}
