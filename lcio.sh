package: LCIO
version: "%(tag_basename)s"
tag: "v02-22-03"
source: https://github.com/iLCSoft/LCIO.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - ROOT
  - CLHEP
  
build_requires:
  - CMake
  - alibuild-recipe-tools
---
#!/bin/bash -e
function Configure() {
   cmake $SOURCEDIR            \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$INSTALLROOT        \
      -DROOT_DIR=$ROOTSYS \
      -DBUILD_ROOTDICT=ON \
      -DLCIO_GENERATE_HEADERS=off
}
function PostInstall() {
       mkdir -p $INSTALLROOT/lib/cmake/LCIO"
       cp -n -r $INSTALLROOT/*.cmake $INSTALLROOT/lib/cmake/LCIO"
}

  
 


