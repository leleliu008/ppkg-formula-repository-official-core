pkg_set summary "Utility to list open files"
pkg_set webpage "https://people.freebsd.org/~abe"
pkg_set git.url "https://github.com/lsof-org/lsof.git"
pkg_set src.url "https://github.com/lsof-org/lsof/archive/4.94.0.tar.gz"
pkg_set src.sha "a9865eeb581c3abaac7426962ddb112ecfd86a5ae93086eb4581ce100f8fa8f4"
pkg_set license "Zlib"
pkg_set bsystem "gmake"
pkg_set depends "libtirpc"
pkg_set binbstd "yes"

build() {
    export LSOF_MAKE="gmake"
    export LSOF_CC="$CC"
    export LSOF_AR="$AR rsc"
    export LSOF_RANLIB="$RANLIB"
    export LSOF_ARCH="$TARGET_OS_ARCH"
    export LSOF_INCLUDE="$SYSTEM_INCLUDE_DIR"
    export LSOF_CFGF="$CFLAGS $CPPFLAGS"
    export LSOF_CFGL="$LDFLAGS -L$PACKAGE_INSTALLING_BST_DIR/lib $libtirpc_LIBRARY_DIR/libtirpc.a"
    
    run ./Configure -clean &&
    run ./Configure -n linux &&
    gmakew &&
    run install_bins lsof &&
    run install_mans Lsof.8
}
