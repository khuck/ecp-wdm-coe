#!/bin/bash -e

rm -rf ${PETSC_INSTALL_DIR}
cd ${PETSC_SOURCE_DIR}

./configure \
--with-debugging=0 \
--with-mpiexec="srun -p ecp -N 1 -A fus123 -t 00:10:00" \
--with-hip=1 \
--with-hipc=hipcc \
--with-mpi-dir=${CRAY_MPICH_DIR} \
--prefix=${PETSC_INSTALL_DIR} \
--download-parmetis=1 \
--download-metis=1 \
--download-fblaslapack=1 \
--download-hypre=1 \
PETSC_ARCH=arch-spock-amd

make -j16 -l16
make check
make install

#--with-parmetis-dir=${PARMETIS_INSTALL_DIR} \
#--with-metis-dir=${PARMETIS_INSTALL_DIR} \
#--with-blas-lib=${CRAY_LIBSCI_PREFIX_DIR}/lib/libsci_amd_mpi_mp.so \
#--with-lapack-lib=${OLCF_NETLIB_SCALAPACK_ROOT}/lib/libscalapack.so \
#--with-cc=/opt/rocm-4.2.0/llvm/bin/clang \
#--with-cxx=/opt/rocm-4.2.0/llvm/bin/clang++ \
#--with-fc=/opt/rocm-4.2.0/llvm/bin/flang \