pkg_set summary "Utility that provides fast incremental file transfer"
pkg_set webpage "https://rsync.samba.org"
pkg_set git.url "https://github.com/WayneD/rsync.git"
pkg_set src.url "https://rsync.samba.org/ftp/rsync/rsync-3.2.3.tar.gz"
pkg_set src.sha "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
pkg_set license "GPL-3.0"
pkg_set bsystem "configure"
pkg_set dep.pkg "openssl popt lz4 zstd zlib xxhash libiconv"

build() {
    configure --disable-simd
}
