pkg_set summary "Z Shell"
pkg_set webpage "https://www.zsh.org"
pkg_set src.url "https://downloads.sourceforge.net/project/zsh/zsh/5.8/zsh-5.8.tar.xz"
pkg_set src.sha "dcc4b54cc5565670a65581760261c163d720991f0d06486da61f8d839b52de27"
pkg_set dep.pkg "ncurses pcre"
pkg_set bsystem "configure"

build() {
    install -d "$BUILD_DIR/Doc" &&
    cp "$PACKAGE_BSCRIPT_DIR"/Doc/*.1 "$BUILD_DIR/Doc" &&
    configure \
        --enable-multibyte \
        --enable-cap \
        --enable-pcre \
        --enable-unicode9 \
        --enable-zsh-secure-free
}
