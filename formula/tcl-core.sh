package set summary "Tool Command Language"
package set webpage "https://www.tcl-lang.org"
package set version "8.6.10"
package set src.url "https://downloads.sourceforge.net/project/tcl/Tcl/${PACKAGE_VERSION}/tcl${PACKAGE_VERSION}-src.tar.gz"
package set src.sum "5196dbf6638e3df8d5c87b5815c8c2b758496eb6f0e41446596c9a4e638d87ed"
package set license "TCL"
package set bsystem "configure"
package set sourced "unix"

build() {
    unset EXTRA_CONFIGURE_FLAGS
    
    if echo "$TARGET_OS_ARCH" | grep -q '64' ; then
        EXTRA_CONFIGURE_FLAGS="--enable-64bit"
    else
        EXTRA_CONFIGURE_FLAGS="--disable-64bit"
    fi

    configure \
        --enable-dtrace \
        --enable-zipfs \
        --enable-load \
        --enable-dll-unloading \
        --enable-threads \
        --with-tzdata \
        $EXTRA_CONFIGURE_FLAGS
}
