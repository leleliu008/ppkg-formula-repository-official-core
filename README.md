# ppkg-formula-repository
the offical formula repository for [ppkg](https://github.com/leleliu008/ppkg)

## what's formula
formula is a POSIX sh script used to config a package infomation and describe how to compile a package for [ppkg](https://github.com/leleliu008/ppkg).

## the function must be invoked on top of the formula
```
package set <KEY> <VALUE>
```
|KEY|required?|overview|
|-|-|-|
|`summary`|required|the summary of this package.|
|`webpage`|optional|the home webpage of this package.<br>If this key is not present, `src.git` must be present.|
|`version`|optional|the version of this package.<br>If this key is not present, it will be calculated from `src.url`|
|`license`|optional|the license of this package.|
|`src.git`|optional|the source code git repository.<br>must end with `.git`|
|`src.url`|required|the source code download url of this package.<br>must end with one of `.git` `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.c` `.cc` `.cxx` `.cpp`.<br>also support format like `dir://DIR`|
|`src.sum`|optional|the `sha256sum` of source code.<br>If the value of `src.url` end with `.git`, this key is optional, otherwise, this key must be present.|
|`dep.cmd`|optional|the commands will be used when installing. If specify multiple values, separate them with spaces.|
|`dep.pkg`|optional|the packages will be used when installing and runtime. If specify multiple values, separate them with spaces.|
|`patches`|optional|the patches. `URL` `SHA256` pairs. [example](https://github.com/leleliu008/ppkg-formula-repository/blob/master/formula/unzip.sh#L9-L10)|
|`cdefine`|optional|append to `CPPFLAGS`|
|`ccflags`|optional|`CFLAGS`|
|`xxflags`|optional|`CXXFLAGS`|
|`ldflags`|optional|`LDFLAGS`|
|`sourced`|optional|the source directory, relative to `WORKING_DIR` which contains build script such as `configure`, `Makefile`, `CMakeLists.txt`, `meson.build`, `Cargo.toml`, etc.|
|`binsrcd`|optional|build in source directory, otherwise build out-of source directory.|
|`bsystem`|optional|build system.<br>values can be `autogen` `autotools` `configure` `cmake` `cmake-make` `cmake-ninja` `meson` `make` `ninja` `cargo` `go`|

## the function can be declared in a formula
|function|required?|overview|
|-|-|-|
|`prepare(){}`|optional|this function only run once.|
|`build(){}`|optional|this function only run once. If this function is not declared, we will call default build command according to `bsystem`|

## the function can be invoked in a formula at anywhere
|function|example|
|-|-|
|`print`|`print 'your message.'`|
|`echo`|`echo 'your message.'`|
|`info`|`info 'your infomation.'`|
|`warn`|`warn "no package manager found."`|
|`error`|`error 'error message.'`|
|`die`|`die "please specify a package name."`|
|`success`|`success "build success."`|
|`nproc`|`make --directory="$BUILD_DIR" -j$(nproc)`|
|`sed_in_place`|`sed_in_place 's/-mandroid//g' Configure`|
|`format_unix_timestamp`|`format_unix_timestamp "$TIMESTAMP_UNIX" '+%Y/%m/%d %H:%M:%S'`|
|`getvalue`|`VALUE=$(getvalue --key=value)`|
|`sha256sum`|`VALUE=$(sha256sum FILEPATH)`|
|`is_sha256sum_match`|`is_sha256sum_match FILEPATH SHA256SUM`|
|`fetch`|`fetch URL [--sha256=SHA256] --output-path=PATH`<br>`fetch URL [--sha256=SHA256] --output-dir=DIR --output-name=NAME`<br>`fetch URL [--sha256=SHA256] --output-dir=DIR [--output-name=NAME]`<br>`fetch URL [--sha256=SHA256] [--output-dir=DIR] --output-name=NAME`|

## the function can be invoked in build function only
|function|example|
|-|-|
|`configure`|`configure --enable-pic`|
|`mesonw`|`mesonw -Dneon=disabled -Darm-simd=disabled`|
|`cmakew`|`cmakew -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON`|
|`makew`|`makew`|
|`cargo`|`cargo`|

## the variable can be used in a formula at anywhere
|variable|overview|
|-|-|
|`DEBUG`|`[ "$DEBUG" = 'true' ] && echo xx`|
|||
|`NATIVE_OS_TYPE`|current machine os type.|
|`NATIVE_OS_NAME`|current machine os name.|
|`NATIVE_OS_VERS`|current machine os version.|
|`NATIVE_OS_ARCH`|current machine os arch.|
|||
|`MY_VERSION`|the version of `ppkg`.|
|`MY_HOME_DIR`|the home directory of `ppkg`.|
|`MY_HOME_PAGE`|the home webpage of `ppkg`.|
|`MY_CACHED_DIR`|the downloads directory of `ppkg`.|
|`MY_INSTALL_DIR`|the installed directory of `ppkg`.|

## the variable can be used in prepare and build function
|variable|overview|
|-|-|
|`TIMESTAMP_UNIX`|the unix timestamp of this installation.|
|||
|`WORKING_DIR`|the direcotory where the source code tarball uncompressed to or copy to.|
|`SOURCE_DIR`|the source code directory of this installation. `the source code direcotory` is the direcotory who contains `Makefile` or `configure` or `CMakeLists.txt` or `meson.build` or `Cargo.toml`|
|`BUILD_DIR`|the build directory of this package.|
|||
|`CC`|the C Compiler.|
|`CFLAGS`|the flags of `CC`.|
|`CXX`|the C++ Compiler.|
|`CXXFLAGS`|the flags of `CXX`.|
|`CPP`|the C/C++ PreProcessor.|
|`CPPFLAGS`|the flags of `CPP`.|
|`AS`|the assembler.|
|`AR`|the archiver.|
|`RANLIB`|the archiver extra tool.|
|`LD`|the linker.|
|`LDFLAGS`|the flags of `LD`.|
|`NM`|a command line tool to list symbols from object files.|
|`STRIP`|a command line tool to discard symbols and other data from object files.|
|||
|`PACKAGE_INSTALL_DIR`|the installation directory of this package.|
|`PACKAGE_BINARY__DIR`|the `bin` directory of this package of this package.|
|`PACKAGE_INCLUDE_DIR`|the `include` directory of this package of this package.|
|`PACKAGE_LIBRARY_DIR`|the `lib` directory of this package of this package.|
|`PACKAGE_PKGCONF_DIR`|the `pkgconfig` directory of this package of this package.|
|||
|`x_INSTALL_DIR`|the installation directory of x package of this package.|
|`x_INCLUDE_DIR`|the `include` directory of x package of this package.|
|`x_LIBRARY_DIR`|the `lib` directory of x package of this package.|
