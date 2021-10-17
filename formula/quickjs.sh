package set summary "Small and embeddable JavaScript engine"
package set webpage "https://bellard.org/quickjs"
package set version "2020-11-08"
package set src.url "https://bellard.org/quickjs/quickjs-${PACKAGE_VERSION}.tar.xz"
package set src.sum "2e9d63dab390a95ed365238f21d8e9069187f7ed195782027f0ab311bb64187b"
package set license "MIT"
package set bsystem "make"
package set binsrcd 'YES'

build() {
    makew clean &&
    makew install CC=$CC AR=$AR STRIP=$STRIP prefix="$PACKAGE_INSTALL_DIR"
}
