pkg_set summary "Optimized BLAS library"
pkg_set webpage "https://www.openblas.net"
pkg_set git.url "https://github.com/xianyi/OpenBLAS.git"
pkg_set src.url "https://github.com/xianyi/OpenBLAS/archive/v0.3.14.tar.gz"
pkg_set src.sha "d381935d26f9cae8e4bbd7d7f278435adf8e3a90920edf284bb9ad789ee9ad60"
pkg_set license "BSD-3-Clause"
pkg_set bsystem "make"
pkg_set binbstd 'YES'

build() {
    # https://github.com/xianyi/OpenBLAS/wiki/How-to-build-OpenBLAS-for-Android
    case $TARGET_OS_ARCH in
        armv7a)  ARCH=arm   ; TARGET='ARMV7' ; BINARY=32 ; ARM_SOFTFP_ABI=1 ;;
        aarch64) ARCH=arm64 ; TARGET='ARMV8' ; BINARY=64 ; ARM_SOFTFP_ABI=1 ;;
        i686)    ARCH=x86   ; TARGET='ATOM'  ; BINARY=32 ; ARM_SOFTFP_ABI=1 ;;
        x86_64)  ARCH=x86_64; TARGET='ATOM'  ; BINARY=64 ; ARM_SOFTFP_ABI=1 ;;
    esac
    makew clean OSNAME=Android ARCH=$ARCH TARGET=$TARGET HOSTCC="$CC_FOR_BUILD" &&
    makew       OSNAME=Android ARCH=$ARCH TARGET=$TARGET HOSTCC="$CC_FOR_BUILD" ONLY_CBLAS=1 ARM_SOFTFP_ABI=$ARM_SOFTFP_ABI CC="$CC" AR="$AR" &&
    makew install PREFIX="$PACKAGE_INSTALL_DIR"
}
