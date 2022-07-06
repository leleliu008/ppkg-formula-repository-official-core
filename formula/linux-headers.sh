pkg_set summary "vvv"
pkg_set webpage "https://mirrors.tuna.tsinghua.edu.cn/kernel/"
pkg_set src.url "https://mirrors.tuna.tsinghua.edu.cn/kernel/v5.x/linux-5.15.17.tar.xz"
pkg_set src.sha "2787f5c0cc59984902fd97916dc604f39718c73817497c25f963141bfb70abde"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    gmakew mrproper &&
    gmakew INSTALL_HDR_PATH=$PACKAGE_INSTALL_DIR headers_install
}
