pkg_set summary "Lightweight and flexible command-line JSON processor"
pkg_set webpage "https://stedolan.github.io/jq"
pkg_set git.url "https://github.com/stedolan/jq.git"
pkg_set src.url "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz"
pkg_set src.sha "5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72"
pkg_set license "MIT"
pkg_set depends "oniguruma bison"
pkg_set bsystem "configure"

build() {
    # https://www.gnu.org/software/gnulib/manual/html_node/lgamma_005fr.html
    if [ "$NATIVE_OS_KIND" = darwin ] ; then
        export ac_cv_lib_m_lgamma_r=no
        export MACOSX_DEPLOYMENT_TARGET=10.8
    fi

    configure --with-oniguruma="$oniguruma_INSTALL_DIR"
}
