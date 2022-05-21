pkg_set summary "GNU implementation of the famous stream editor"
pkg_set webpage "https://www.gnu.org/software/sed"
pkg_set src.url "https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz"
pkg_set src.sha "f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --program-prefix=g \
        --without-selinux \
        --with-included-regex \
        --disable-acl \
        --disable-assert
    (
        run cd "$PACKAGE_INSTALL_DIR/bin"
        ln -s gsed sed
    )
}
