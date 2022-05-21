pkg_set summary "Secure FTP server for UNIX"
pkg_set webpage "https://security.appspot.com/vsftpd.html"
pkg_set src.url "https://security.appspot.com/downloads/vsftpd-3.0.3.tar.gz"
pkg_set src.sha "9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7"
pkg_set license "GPL-2.0-only"
pkg_set depends "openssl libcap libcrypt"
pkg_set binbstd "yes"
pkg_set bsystem "gmake"

build() {
    gmakew clean &&
    gmakew CC="$CC" CFLAGS="'$CFLAGS $CPPFLAGS'" LDFLAGS="'$LDFLAGS'" LIBS="'-lssl -lcrypto -lcrypt -lcap'" &&
    install_bins vsftpd
}
