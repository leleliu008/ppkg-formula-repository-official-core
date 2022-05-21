pkg_set summary "EXIF parsing library"
pkg_set webpage "https://libexif.github.io"
pkg_set src.url "https://github.com/libexif/libexif/releases/download/libexif-0_6_22-release/libexif-0.6.22.tar.xz"
pkg_set src.sha "5048f1c8fc509cc636c2f97f4b40c293338b6041a5652082d5ee2cf54b530c56"
pkg_set license "LGPL-2.1"
pkg_set depends "gettext"
pkg_set bsystem "autotools"

build() {
    configure --enable-docs
}
