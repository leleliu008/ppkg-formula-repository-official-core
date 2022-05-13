pkg_set summary "Manage compile and link flags for libraries"
pkg_set webpage "https://freedesktop.org/wiki/Software/pkg-config"
pkg_set src.url "https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz"
pkg_set src.sha "6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591"
pkg_set license "GPL-2.0-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --with-internal-glib \
        --disable-host-tool
}
