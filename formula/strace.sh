pkg_set summary "Diagnostic, instructional, and debugging tool for the Linux kernel"
pkg_set webpage "https://strace.io/"
pkg_set git.url "https://github.com/strace/strace.git"
pkg_set src.url "https://github.com/strace/strace/releases/download/v5.17/strace-5.17.tar.xz"
pkg_set src.sha "5fb298dbd1331fd1e1bc94c5c32395860d376101b87c6cd3d1ba9f9aa15c161f"
pkg_set license "LGPL-2.1-or-later"
pkg_set bsystem "configure"

build() {
    configure --enable-mpers=no
}
