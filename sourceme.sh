
module purge
module load gcc/7.3
module load mpi/openmpi-4.1.1-hipcc4.1
module swap rocm rocmmod4.5.0
module load cmake

export MYCC=`which clang`
export MYCXX=`which hipcc`
export MYFTN=`which flang`

export basedir=`pwd`
export srcdir=${basedir}/src
export builddir=${basedir}/build
export installdir=${basedir}/install
export KOKKOS_SOURCE_DIR=${srcdir}/kokkos
export KOKKOS_BUILD_DIR=${builddir}/kokkos
export KOKKOS_INSTALL_DIR=${installdir}/kokkos

export CABANA_SOURCE_DIR=${srcdir}/cabana
export CABANA_BUILD_DIR=${builddir}/cabana
export CABANA_INSTALL_DIR=${installdir}/cabana

export LAPACK_SOURCE_DIR=${srcdir}/OpenBLAS
export LAPACK_BUILD_DIR=${builddir}/OpenBLAS
export LAPACK_INSTALL_DIR=${installdir}/OpenBLAS

export CAMTIMERS_SOURCE_DIR=${srcdir}/camtimers
export CAMTIMERS_BUILD_DIR=${builddir}/camtimers
export CAMTIMERS_INSTALL_DIR=${installdir}/camtimers

export XGC_SOURCE_DIR=${srcdir}/XGC-Devel
export XGC_BUILD_DIR=${builddir}/xgc

export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export OMP_NUM_THREADS=4
#export BLAS_INSTALL_DIR=/usr/local/packages/OpenBLAS/2.8.0
export BLAS_INSTALL_DIR=${installdir}/OpenBLAS
export ROCM_PATH=/opt/rocm-4.5.0

#export LD_LIBRARY_PATH=${ROCM_PATH}/lib:${ROCM_PATH}/rocprofiler/lib:${ROCM_PATH}/roctracer/lib
