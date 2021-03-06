#!/bin/bash -e

rm -rf ${CABANA_BUILD_DIR} ${CABANA_INSTALL_DIR}
mkdir -p ${CABANA_BUILD_DIR}
cd ${CABANA_BUILD_DIR}

OPTIONS=(
-D CMAKE_BUILD_TYPE=Release
-D CMAKE_INSTALL_PREFIX="${CABANA_INSTALL_DIR}"
-D CMAKE_PREFIX_PATH="${KOKKOS_INSTALL_DIR}"
-D CMAKE_CXX_COMPILER=${MYCXX}
-D Cabana_ENABLE_TESTING=OFF
-D Cabana_ENABLE_EXAMPLES=OFF
)
cmake "${OPTIONS[@]}" "${CABANA_SOURCE_DIR:-../}"
make -j -l32
make install

#-D CMAKE_CXX_STANDARD=14
#-D CMAKE_CXX_FLAGS=-std=c++14