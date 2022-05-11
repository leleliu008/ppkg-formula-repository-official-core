pkg_set summary "Command-line packet(TCP/IP) analyzer"
pkg_set webpage "https://www.tcpdump.org"
pkg_set src.url "https://www.tcpdump.org/release/tcpdump-4.9.3.tar.gz"
pkg_set src.sha "2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e5151e16559db6410"
pkg_set bsystem "configure"
pkg_set dep.pkg "libpcap"

build() {
    configure \
        --without-gcc \
        --disable-smb \
        --disable-universal
}
