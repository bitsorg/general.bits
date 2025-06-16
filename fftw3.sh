package: FFTW3
version: "%(tag_basename)s"
tag: fftw-3.3.9
source: https://github.com/FFTW/fftw3.git
prefer_system: (?!slc5.*)
build_requires:
  - alibuild-recipe-tools
  - CMake
  - "GCC-Toolchain:(?!osx)"
---
#!/bin/bash -e
# ROOT and O2 need different variants of fftw3, but we cannot configure fftw3
# to build both at the same time. As a workaround, configure and build one,
# then wipe out the build directory and configure and build the second one.

# First, build fftw3 (double precision), required by ROOT.
cmake -S "$SOURCEDIR" -B "$BUILDDIR/fftw3"              \
      -DCMAKE_INSTALL_PREFIX:PATH="$INSTALLROOT"        \
      -DCMAKE_INSTALL_LIBDIR:PATH=lib
make -C "$BUILDDIR/fftw3" ${JOBS+-j "$JOBS"}
make -C "$BUILDDIR/fftw3" install

#Modulefile
mkdir -p "$INSTALLROOT/etc/modulefiles"
alibuild-generate-module --bin --lib > "$INSTALLROOT/etc/modulefiles/$PKGNAME"
