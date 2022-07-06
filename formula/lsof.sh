pkg_set summary "Utility to list open files"
pkg_set webpage "https://people.freebsd.org/~abe"
pkg_set git.url "https://github.com/lsof-org/lsof.git"
pkg_set src.url "https://github.com/lsof-org/lsof/archive/4.95.0.tar.gz"
pkg_set src.sha "8ff4c77736cc7d9556da9e2c7614cc4292a12f1979f20bd520d3c6f64b66a4d7"
pkg_set license "Zlib"
pkg_set dep.pkg "libtirpc"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    export LSOF_MAKE="gmake"
    export LSOF_CC="$CC"
    export LSOF_AR="$AR rsc"
    export LSOF_RANLIB="$RANLIB"
    export LSOF_CFGF="$CFLAGS $CPPFLAGS"
    export LSOF_CFGL="$LDFLAGS"
    
    run ./Configure -clean &&
    run ./Configure -n linux &&
    gmakew &&
    run install_bins lsof &&
    run install_mans Lsof.8
}
