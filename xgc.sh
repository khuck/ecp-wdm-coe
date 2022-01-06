#!/bin/bash -e

rm -rf ${XGC_BUILD_DIR}
mkdir -p ${XGC_BUILD_DIR}
cd ${XGC_BUILD_DIR}

OPTIONS=(
-D CMAKE_BUILD_TYPE=RelWithDebInfo
-D CMAKE_CXX_COMPILER=${MYCXX}
-D CMAKE_C_COMPILER=${MYCC}
-D CMAKE_Fortran_COMPILER=${MYFTN}
-D Kokkos_ROOT="${KOKKOS_INSTALL_DIR}"
-D Cabana_ROOT="${CABANA_INSTALL_DIR}"
-D BUILD_FULL_XGC=OFF
)
set -x
cmake "${OPTIONS[@]}" "${XGC_SOURCE_DIR:-../}"
set +x
make -j16 -l32
