pkg_set summary "High performance message passing library"
pkg_set webpage "https://www.open-mpi.org"
pkg_set src.url "https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.4.tar.bz2"
pkg_set src.sha "47e24eb2223fe5d24438658958a313b6b7a55bb281563542e1afc9dec4a31ac4"
pkg_set bsystem "configure"
pkg_set dep.pkg "libevent"

build() {
    configure \
        --disable-coverage \
        --disable-mpi-fortran \
        --disable-oshmem-fortran \
        --disable-builtin-atomics \
        --enable-sysv-shmem=no \
        --enable-sysv-sshmem=no \
        --enable-binaries \
        --enable-mpi-java \
        --with-libevent="$libevent_INSTALL_DIR" \
        FC=''
}
