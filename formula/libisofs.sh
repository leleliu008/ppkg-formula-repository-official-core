pkg_set summary "Library to create an ISO-9660 filesystem with extensions like RockRidge or Joliet"
pkg_set webpage "https://www.libburnia-project.org"
pkg_set src.url "http://files.libburnia-project.org/releases/libisofs-1.5.2.tar.gz"
pkg_set src.sha "ef5a139600b3e688357450e52381e40ec26a447d35eb8d21524598c7b1675500"
pkg_set bsystem "configure"
pkg_set depends "libiconv"

build() {
    configure --disable-verbose-debug
}
