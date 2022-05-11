pkg_set summary "Mozilla Network Security Services"
pkg_set webpage "https://developer.mozilla.org/docs/NSS"
pkg_set src.url "https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_58_RTM/src/nss-3.58.tar.gz"
pkg_set src.sha "9f73cf789b5f109b978e5239551b609b0cafa88d18f0bc8ce3f976cb629353c0"
pkg_set license "MPL-2.0"
pkg_set dep.pkg "nspr"
pkg_set sourced "nss"

prepare() {
    :
    #sed_in_place '1a set -x' build.sh
}

build() {
    "$PACKAGE_BSCRIPT_DIR/build.sh" \
        -DSHARED_LIB_SUFFIX=$SHARED_LIBRARY_EXT \
        -c \
        -v \
        --opt \
        --disable-tests \
        --with-nspr="$nspr_INCLUDE_DIR/nspr:$nspr_LIBRARY_DIR"
}

install_files() {
    mkdir -p $PACKAGE_INSTALL_DIR/{bin,lib/pkgconfig,include/nss}            || return 1
    
    install -v -m755 Linux*/lib/*.so              $PACKAGE_LIBRARY_DIR       || return 1
    install -v -m644 Linux*/lib/{*.chk,libcrmf.a} $PACKAGE_LIBRARY_DIR       || return 1
    
    cp -v -RL {public,private}/nss/*              $PACKAGE_INCLUDE_DIR/nss   || return 1
    chmod -v 644                                  $PACKAGE_INCLUDE_DIR/nss/* || return 1
    
    install -v -m755 Linux*/bin/{certutil,pk12util} $PACKAGE_INSTALL_DIR/bin || return 1
}

install_pc_files() {
    install_pc_file 'nss' <<EOF
prefix=$PACKAGE_INSTALL_DIR
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include/nss

Name: NSS
Description: ${PACKAGE_SUMMARY}
Version: ${PACKAGE_VERSION}
Requires: nspr >= 4.12
Libs: -L\${libdir} -lnss3 -lnssutil3 -lsmime3 -lssl3
Cflags: -I\${includedir}
EOF
}
