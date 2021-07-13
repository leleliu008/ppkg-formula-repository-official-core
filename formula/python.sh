package set summary "Interpreted, interactive, object-oriented programming language"
package set webpage "https://www.python.org"
package set src.url "https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tar.xz"
package set src.sum "0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffcb6d1820d716d83" 
package set license "Python-2.0"
package set dep.pkg "expat libffi openssl readline sqlite bzip2 xz"
package set bsystem "configure"

build() {
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
