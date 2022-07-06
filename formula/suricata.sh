pkg_set summary "Network IDS, IPS, and security monitoring engine"
pkg_set webpage "https://suricata-ids.org"
pkg_set src.url "https://www.openinfosecfoundation.org/download/suricata-5.0.3.tar.gz"
pkg_set src.sha "34413ecdad2ff2452526dbcd22f1279afd0935151916c0ff9cface4b0b5665db"
pkg_set license "GPL-2.0"
pkg_set bsystem "configure cargo"
pkg_set dep.pkg "jansson file libnet libpcap libyaml lz4 pcre libiconv"

build() {
    configure --enable-pie
}
