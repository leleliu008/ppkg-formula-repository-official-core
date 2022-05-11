pkg_set summary "Bourne-Again SHell, a UNIX command interpreter"
pkg_set webpage "https://www.gnu.org/software/bash"
pkg_set git.url "https://git.savannah.gnu.org/git/bash.git"
pkg_set src.url "https://mirrors.tuna.tsinghua.edu.cn/gnu/bash/bash-5.0.tar.gz"
pkg_set src.sha "b4a80f2ac66170b2913efbfb9f2594f1f76c7b1afd11f799e22035d63077fb4d"
pkg_set version "5.0.18"
pkg_set license "GPL-3.0-or-later"
pkg_set dep.pkg "readline ncurses"
pkg_set bsystem "configure"

build() {
    configure \
        --with-curses \
        --without-bash-malloc \
        --disable-profiling \
        --enable-readline \
        --enable-select \
        --enable-history \
        --enable-static-link
}
