#!/bin/bash -e

source sourceme.sh

mkdir -p ${srcdir}

get_code() {
cd ${srcdir}
if [ ! -d kokkos ] ; then
    git clone git@github.com:kokkos/kokkos.git
fi
if [ ! -d cabana ] ; then
    git clone git@github.com:ECP-copa/Cabana.git cabana
fi
if [ ! -d XGC-Devel ] ; then
    git clone git@github.com:khuck/XGC-Devel.git
fi
if [ ! -d OpenBLAS ] ; then
    git clone git@github.com:xianyi/OpenBLAS.git
fi
}

build() {
cd ${basedir}
if [ ! -d ${KOKKOS_INSTALL_DIR} ] ; then
./kokkos.sh
fi
if [ ! -d ${CABANA_INSTALL_DIR} ] ; then
./cabana.sh
fi
if [ ! -d ${LAPACK_INSTALL_DIR} ] ; then
./openblas.sh
fi
if [ ! -d ${XGC_BUILD_DIR} ] ; then
./xgc.sh
fi
}

get_code
build