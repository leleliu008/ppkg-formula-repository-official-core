package set summary "Tool for downloading RTMP streaming media"
package set webpage "https://rtmpdump.mplayerhq.hu"
package set src.git "https://git.ffmpeg.org/rtmpdump.git"
package set src.url "https://deb.debian.org/debian/pool/main/r/rtmpdump/rtmpdump_2.4+20151223.gitfa8646d.1.orig.tar.gz"
package set src.sum "5c032f5c8cc2937eb55a81a94effdfed3b0a0304b6376147b86f951e225e3ab5"
package set version "2.4+20151223"
package set license "GPL-2.0-or-later"
package set bsystem "make"
package set dep.pkg "openssl"
package set binsrcd 'YES'
package set patches "https://raw.githubusercontent.com/Homebrew/formula-patches/85fa66a9/rtmpdump/openssl-1.1.diff" \
                    "3c9167e642faa9a72c1789e7e0fb1ff66adb11d721da4bd92e648cb206c4a2bd"

prepare() {
    patch -p0 < "$PACKAGE_PATCHES" 
}

build() {
    if [ "$NATIVE_OS_KIND" = 'darwin' ] ; then
        SYS=darwin
    else
        SYS=posix
    fi
    makew clean   SYS=$SYS &&
    makew         SYS=$SYS CC=$CC LD=$LD CRYPTO=OPENSSL OPT= THREADLIB_posix= XCFLAGS="'$CFLAGS $CPPFLAGS'" XLDFLAGS="'$LDFLAGS'" &&
    makew install SYS=$SYS prefix="$PACKAGE_INSTALL_DIR" mandir="$PACKAGE_INSTALL_DIR/share/man"
}
