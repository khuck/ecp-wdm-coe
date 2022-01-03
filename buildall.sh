#!/bin/bash -e

# on spock, kokkos is installed in /gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3/kokkos
# on spock, cabana is installed in /gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3/cabana
# on spock, camtimers is already installed in /gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3/camtimers
# on spock, petsc is already installed in /gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3/petsc
# on spock, petsc will have blas/lapack (no OpenBLAS necessary)
# on spock, adios2 is already installed in /gpfs/alpine/phy122/proj-shared/spock/adios2/devel
# ...For most up-to-date paths, check XGC-Devel/CMake/find_dependencies_spock.cmake

#source sourceme.sh

# If building the full code set this to 1
fullcode=0

mkdir -p ${srcdir}

get_code() {
    cd ${srcdir}

    if [ "$LMOD_SYSTEM_NAME" != "spock" ] ; then
        if [ ! -d kokkos ] ; then
            git clone git@github.com:kokkos/kokkos.git
        fi

        if [ ! -d cabana ] ; then
            git clone git@github.com:ECP-copa/Cabana.git cabana
        fi

        if [ ! -d OpenBLAS ] ; then
            git clone git@github.com:xianyi/OpenBLAS.git
        fi

        if [ ! -d camtimers ] ; then
            git clone git@github.com:khuck/camtimers.git
        fi

        # only need these if building full code
        if [ $fullcode -eq 1 ] ; then
            if [ ! -d petsc ] ; then
                git clone https://gitlab.com/petsc/petsc.git
            fi

            if [ ! -d ADIOS2 ] ; then
                git clone https://github.com/ornladios/ADIOS2.git
            fi
        fi
    fi

    if [ ! -d XGC-Devel ] ; then
        git clone --branch spock_amd git@github.com:khuck/XGC-Devel.git
    fi
    cd ..
}

build() {
    cd ${basedir}

    if [ "$LMOD_SYSTEM_NAME" != "spock" ] ; then
        if [ ! -d ${KOKKOS_INSTALL_DIR} ] ; then
            ./kokkos.sh
        fi

        if [ ! -d ${CABANA_INSTALL_DIR} ] ; then
            ./cabana.sh
        fi

        if [ ! -d ${CAMTIMERS_INSTALL_DIR} ] ; then
            ./camtimers.sh
        fi

        if [ $fullcode -ne 1 ] ; then
            # petsc will have blas/lapack now
            if [ ! -d ${LAPACK_INSTALL_DIR} ] ; then
                ./openblas.sh
            fi
        else
            # only needed for full XGC
            if [ ! -d ${PETSC_INSTALL_DIR} ] ; then
                ./petsc.sh
            fi

            # only needed for full XGC
            if [ ! -d ${ADIOS2_INSTALL_DIR} ] ; then
                ./adios2.sh
            fi
        fi
    fi

    if [ ! -d ${XGC_BUILD_DIR} ] ; then
        if [ "$LMOD_SYSTEM_NAME" = "spock" ] ; then
            # full XGC, because we can
            ./xgc.sh
        else
            if [ $fullcode -eq 1 ] ; then
                # full XGC
                ./xgc.sh
            else
                # XGC test kernels only
                ./kernels_only.sh
            fi
        fi
    fi
}

get_code
build
