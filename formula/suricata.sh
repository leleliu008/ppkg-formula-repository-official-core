package set summary "Network IDS, IPS, and security monitoring engine"
package set webpage "https://suricata-ids.org"
package set src.url "https://www.openinfosecfoundation.org/download/suricata-5.0.3.tar.gz"
package set src.sum "34413ecdad2ff2452526dbcd22f1279afd0935151916c0ff9cface4b0b5665db"
package set license "GPL-2.0"
package set bsystem "configure cargo"
package set dep.pkg "jansson file libnet libpcap libyaml lz4 pcre libiconv"

build() {
    configure --enable-pie
}
