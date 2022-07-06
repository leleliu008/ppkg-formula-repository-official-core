pkg_set summary "Interpreted, interactive, object-oriented programming language"
pkg_set webpage "https://www.python.org"
pkg_set src.url "https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tgz"
pkg_set src.sha "f3bcc65b1d5f1dc78675c746c98fcee823c038168fc629c5935b044d0911ad28"
pkg_set git.url "https://github.com/python/cpython.git"
pkg_set license "Python-2.0"
pkg_set dep.pkg "expat libffi openssl sqlite bzip2 xz"
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
