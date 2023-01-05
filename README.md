# ppkg-formula-repository
the offical formula repository for [ppkg](https://github.com/leleliu008/ppkg)

## what's formula
a formula is a [YAML](https://yaml.org/spec/1.2.2/) format file which is used to configure a ppkg's package infomation and describe how to compile a package for [ppkg](https://github.com/leleliu008/ppkg).

|KEY|required?|overview|
|-|-|-|
|`summary`|required|the summary of this package.|
|`license`|optional|the license of this package.<br>a space-separated list of [SPDX license short identifiers](https://spdx.github.io/spdx-spec/v2.3/SPDX-license-list/#a1-licenses-with-short-identifiers)|
|`version`|optional|the version of this package.<br>If this mapping is not present, it will be calculated from `src-url`, if `src-url` is also not present, it will be calculated from running time as format `date +%Y.%m.%d`|
||||
|`web-url`|optional|the home webpage of this package.<br>If this mapping is not present, `git-url` must be present.|
||||
|`git-url`|optional|the source code git repository.<br>If `src-url` is not present, this mapping must be present.|
|`git-ref`|optional|reference: https://git-scm.com/book/en/v2/Git-Internals-Git-References <br>example values: `HEAD` `refs/heads/master` `refs/heads/main` `refs/tags/v1`, default value is `HEAD`|
|`git-sha`|optional|the full git commit id, 40-byte hexadecimal string, if `git-ref` and `git-sha` both are present, `git-sha` takes precedence over `git-ref`|
|`shallow`|optional|indicates whether do a git shallow fetch. values can be `yes` or `no`. default value is `yes`.|
||||
|`src-url`|optional|the source code download url of this package.<br>If value of this mapping ends with any of `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.tlz` `.tbz2`, it will be uncompressed to `PACKAGE_INSTALLING_SRC_DIR` when this package is installing, otherwise, it will be copied to `PACKAGE_INSTALLING_SRC_DIR`<br>also support format like `dir://DIR`|
|`src-uri`|optional|the mirror of `src-url`.|
|`src-sha`|optional|the `sha256sum` of source code.<br>`src-sha` and `src-url` must appear togther.|
||||
|`fix-url`|optional|the patch file download url of this package.<br>If value of this mapping ends with any of `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.tlz` `.tbz2`, it will be uncompressed to `PACKAGE_INSTALLING_FIX_DIR` when this package is installing, otherwise, it will be copied to `PACKAGE_INSTALLING_FIX_DIR`.|
|`fix-sha`|optional|the `sha256sum` of patch file.<br>`fix-sha` and `fix-url` must appear togther.|
||||
|`res-url`|optional|other resource download url of this package.<br>If value of this mapping ends with any of `.zip` `.tar.xz` `.tar.gz` `.tar.lz` `.tar.bz2` `.tgz` `.txz` `.tlz` `.tbz2`, it will be uncompressed to `PACKAGE_INSTALLING_RES_DIR` when this package is installing, otherwise, it will be copied to `PACKAGE_INSTALLING_RES_DIR`.|
|`res-sha`|optional|the `sha256sum` of resource file.<br>`res-sha` and `res-url` must appear togther.|
||||
|`dep-pkg`|optional|a space-separated list of   `ppkg packages` that are depended by this package when installing and/or runtime, which will be installed via [ppkg](https://github.com/leleliu008/ppkg).|
|`dep-upp`|optional|space-separated   `uppm packages` that are depended by this package when installing and/or runtime, which will be installed via [uppm](https://github.com/leleliu008/uppm).|
|`dep-pym`|optional|a space-separated list of `python packages` that are depended by this package when installing and/or runtime, which will be installed via `pip3`.|
|`dep-plm`|optional|a space-separated list of    `perl modules` that are depended by this package when installing and/or runtime, which will be installed via `cpan`.|
||||
|`cdefine`|optional|append to `CPPFLAGS`|
|`ccflags`|optional|append to `CFLAGS`|
|`xxflags`|optional|append to `CXXFLAGS`|
|`ldflags`|optional|append to `LDFLAGS`|
||||
|`exetype`|optional|indicates whether can be built as statically-linked executable.<br>values can be any of `statically-linked` `dynamically-linked`. If this mapping is not present, `statically-linked` will be used. this mapping only affects `GNU/Linux` system.|
||||
|`bsystem`|optional|build system.<br>values can be any of `autogen` `autotools` `configure` `cmake` `cmake-gmake` `cmake-ninja` `meson` `xmake` `gmake` `ninja` `cargo` `go`|
|`bscript`|optional|the directory where the build script is located in, relative to `PACKAGE_INSTALLING_TOP_DIR`. build script such as `configure`, `Makefile`, `CMakeLists.txt`, `meson.build`, `Cargo.toml`, etc.|
|`binbstd`|optional|whether build in the directory where the build script is located in, otherwise build in other directory. values can be `yes` or `no`. default value is `no`.|
|`prepare`|optional|bash shell code to be run before `install`. `pwd` is `PACKAGE_INSTALLING_BST_DIR`|
|`install`|optional|bash shell code to be run when user run `ppkg install <PKG>`. If this mapping is not present, `ppkg` will run default install code according to `bsystem`|
|`symlink`|optional|whether symlink installed files to `/opt/ppkg/symlinked/*`. values can be `yes` or `no`. default value is `yes`.|

## the commands can be invoked in prepare and install block
|command|usage-example|
|-|-|
|`echo`|`echo 'your message.'`|
|`info`|`info 'your infomation.'`|
|`warn`|`warn "no package manager found."`|
|`error`|`error 'error message.'`|
|`die`|`die "please specify a package name."`|
|`success`|`success "build success."`|
|`sed_in_place`|`sed_in_place 's/-mandroid//g' Configure`|
|`format_unix_timestamp`|`format_unix_timestamp "$TIMESTAMP_UNIX" '+%Y/%m/%d %H:%M:%S'`|
|`wfetch`|`wfetch URL [--sha256=SHA256] --output-path=PATH`<br>`wfetch URL [--sha256=SHA256] --output-dir=DIR --output-name=NAME`<br>`wfetch URL [--sha256=SHA256] --output-dir=DIR [--output-name=NAME]`<br>`wfetch URL [--sha256=SHA256] [--output-dir=DIR] --output-name=NAME`|

## the commands can be invoked in install block only
|command|usage-example|
|-|-|
|`configure`|`configure --enable-pic`|
|`mesonw`|`mesonw -Dneon=disabled -Darm-simd=disabled`|
|`cmakew`|`cmakew -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON`|
|`gmakew`|`gmakew`|
|`xmakew`|`xmakew`|
|`cargow`|`cargow`|
|`gow`|`gow`|

## the variable can be used in prepare and install block
|variable|overview|
|-|-|
|`TIMESTAMP_UNIX`|the unix timestamp of this action.|
|||
|`NATIVE_OS_KIND`|current machine os kind.|
|`NATIVE_OS_TYPE`|current machine os type.|
|`NATIVE_OS_NAME`|current machine os name.|
|`NATIVE_OS_VERS`|current machine os version.|
|`NATIVE_OS_ARCH`|current machine os arch.|
|`NATIVE_OS_NCPU`|current machine os's cpu core count.|
|||
|`PPKG_VERSION`|the version of `ppkg`.|
|`PPKG_EXECUTABLE`|the path of `ppkg`.|
|`PPKG_HOME`|the home directory of `ppkg`.|
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
|`PACKAGE_INSTALLING_TOP_DIR`|the directory used when installing.|
|`PACKAGE_INSTALLING_SRC_DIR`|the directory where the source code files uncompressed to or copy to.|
|`PACKAGE_INSTALLING_FIX_DIR`|the directory where the patch files uncompressed to or copy to.|
|`PACKAGE_INSTALLING_RES_DIR`|the directory where the other resource files uncompressed to or copy to.|
|`PACKAGE_INSTALLING_BST_DIR`|the directory where the build script (`Makefile`, `configure`, `CMakeLists.txt`, `meson.build`, `Cargo.toml`) is located in.|
|`PACKAGE_INSTALLING_TMP_DIR`|the directory where the tmp files are stored in when run build script.|
|||
|`PACKAGE_INSTALL_DIR`|the directory where the output files will be installed to.|
|||
|`x_INSTALL_DIR`|the installation directory of x package.|
|`x_INCLUDE_DIR`|`$x_INSTALL_DIR/include`|
|`x_LIBRARY_DIR`|`$x_INSTALL_DIR/lib`|
