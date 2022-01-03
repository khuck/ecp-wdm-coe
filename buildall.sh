#!/bin/bash -e

#source sourceme.sh

mkdir -p ${srcdir}

get_code() {
cd ${srcdir}

# on spock, kokkos is installed in /gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3/kokkos
if [ ! -d kokkos ] ; then
    git clone git@github.com:kokkos/kokkos.git
fi

# on spock, cabana is installed in /gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3/cabana
if [ ! -d cabana ] ; then
    git clone git@github.com:ECP-copa/Cabana.git cabana
fi

# on spock, petsc will have blas/lapack
#if [ ! -d OpenBLAS ] ; then
    #git clone git@github.com:xianyi/OpenBLAS.git
#fi

# on spock, camtimers is installed in /gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3/camtimers
if [ ! -d camtimers ] ; then
    git clone git@github.com:khuck/camtimers.git
fi

# on spock, petsc is installed in /gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3/petsc
if [ ! -d petsc ] ; then
    git clone https://gitlab.com/petsc/petsc.git
fi

if [ ! -d ADIOS2 ] ; then
    git clone https://github.com/ornladios/ADIOS2.git
fi

if [ ! -d XGC-Devel ] ; then
    git clone git@github.com:khuck/XGC-Devel.git
fi

cd ..
}

build() {
cd ${basedir}

if [ ! -d ${KOKKOS_INSTALL_DIR} ] ; then
pwd
./kokkos.sh
fi

if [ ! -d ${CABANA_INSTALL_DIR} ] ; then
./cabana.sh
fi

# petsc will have blas/lapack now
#if [ ! -d ${LAPACK_INSTALL_DIR} ] ; then
#./openblas.sh
#fi

if [ ! -d ${CAMTIMERS_INSTALL_DIR} ] ; then
./camtimers.sh
fi

# only needed for full XGC
if [ ! -d ${PETSC_INSTALL_DIR} ] ; then
./petsc.sh
fi

# only needed for full XGC
if [ ! -d ${ADIOS2_INSTALL_DIR} ] ; then
./adios2.sh
fi

if [ ! -d ${XGC_BUILD_DIR} ] ; then
# XGC test kernels only
#./kernels_only.sh
#./kernels_only-spock.sh

# full XGC
./xgc.sh
fi
}

get_code
build
