pkg_set summary "Download with resuming and segmented downloading"
pkg_set webpage "https://aria2.github.io"
pkg_set src.url "https://github.com/aria2/aria2/releases/download/release-1.35.0/aria2-1.35.0.tar.xz"
pkg_set src.sha "1e2b7fd08d6af228856e51c07173cfcf987528f1ac97e04c5af4a47642617dfd"
pkg_set license "GPL-2.0-or-later"
pkg_set dep.pkg "zlib openssl libssh2 libxml2"
pkg_set bsystem "configure"
pkg_set ldflags "-lz -lm -lxml2 -liconv -lssl -lcrypto -lssh2"

build() {
    configure --enable-libaria2
}
