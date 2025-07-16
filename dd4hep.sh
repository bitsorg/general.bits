package: DD4Hep
version: "%(tag_basename)s"
tag: "v01-31"
source: https://github.com/AIDASoft/DD4hep.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - boost
  - ROOT
  - GEANT4
  - xercesc
  
build_requires:
  - CMake
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR            \
      -DCMAKE_INSTALL_PREFIX=$INSTALLROOT        \
      -DDD4HEP_USE_GEANT4=ON \
      -DBoost_NO_BOOST_CMAKE=ON \
      -DDD4HEP_USE_LCIO=ON \
      -DBUILD_TESTING=ON \
      -DROOT_DIR=$ROOTSYS \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_DOCS=OFF
}


