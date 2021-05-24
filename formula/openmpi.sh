package set summary "High performance message passing library"
package set webpage "https://www.open-mpi.org"
package set src.url "https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.4.tar.bz2"
package set src.sum "47e24eb2223fe5d24438658958a313b6b7a55bb281563542e1afc9dec4a31ac4"
package set bsystem "configure"
package set dep.pkg "libevent"

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
