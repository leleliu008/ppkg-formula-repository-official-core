pkg_set summary "Collection of Linux utilities"
pkg_set git.url "https://github.com/karelzak/util-linux.git"
pkg_set src.url "https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.36/util-linux-2.36.tar.xz"
pkg_set src.sha "9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1"
pkg_set license "GPL-2.0"
pkg_set bsystem "configure"
pkg_set dep.pkg "readline"

build() {
    export CPPFLAGS="$CPPFLAGS -D_PATH_VI=\\\"/usr/bin/vi\\\""
    configure \
        --without-python \
        --without-systemd \
        --with-ncursesw \
        --enable-widechar \
        --disable-all-programs \
        --enable-libuuid
}
