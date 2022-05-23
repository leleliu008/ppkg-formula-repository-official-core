pkg_set summary "Collection of Linux utilities"
pkg_set git.url "https://github.com/karelzak/util-linux.git"
pkg_set src.url "https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz"
pkg_set src.sha "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
pkg_set license "GPL-2.0-or-later"
pkg_set depends "readline"
pkg_set bsystem "configure"

if [ "$NATIVE_OS_KIND" = darwin ] ; then
    # Fix ./include/statfs_magic.h:4:10: fatal error: 'sys/statfs.h' file not found
    pkg_set fix.url "https://github.com/util-linux/util-linux/commit/478b9d477ecdd8f4e3a7b488524e1d4c6a113525.patch?full_index=1"
    pkg_set fix.sha "576c26c3d15642f1c44548d0120b192b855cceeebf8ad97fb5e300350e88a3f7"

    # Fix lib/procfs.c:9:10: fatal error: 'sys/vfs.h' file not found
    pkg_set res.url "https://github.com/util-linux/util-linux/commit/3671d4a878fb58aa953810ecf9af41809317294f.patch?full_index=1"
    pkg_set res.sha "d38c9ae06c387da151492dd5862c58551559dd6d2b1877c74cc1e11754221fe4"
fi

prepare() {
    if [ "$NATIVE_OS_KIND" = darwin ] ; then
        patch -p1 < ../fix/478b9d477ecdd8f4e3a7b488524e1d4c6a113525.patch
        patch -p1 < ../res/3671d4a878fb58aa953810ecf9af41809317294f.patch
    fi
}

build() {
    configure \
        --without-python \
        --without-systemd \
        --without-ncursesw \
        --enable-widechar \
        --enable-libuuid
}
