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
./kokkos.sh
./cabana.sh
./openblas.sh
./xgc.sh
}

get_code
build
