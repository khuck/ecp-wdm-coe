
module reset
module unload perftools-base
module load cmake/3.21.3
module load PrgEnv-amd
module load rocm/4.3.0
module load rocm-compiler/4.3.0
module list

# Handled in the craype-accel-amd-gfx908 module, but not loaded here
export CRAYPE_LINK_TYPE=dynamic
# For some reason not set by the cray-mpich module?
export PATH=${CRAY_MPICH_PREFIX}/bin:${PATH}

# Settings for using hipcc with CC wrapper - see https://docs.olcf.ornl.gov/systems/spock_quick_start_guide.html
export MPIR_CVAR_GPU_EAGER_DEVICE_MEM=0
export MPICH_GPU_SUPPORT_ENABLED=1
export MPI_CXXFLAGS="-I${MPICH_DIR}/include"
export MPI_LDFLAGS="-L${MPICH_DIR}/lib -lmpi -L/opt/cray/pe/mpich/default/gtl/lib -lmpi_gtl_hsa"

export XGC_PLATFORM=spock
export OMP_NUM_THREADS=4
export OMP_PROC_BIND=true

export MPICH_CXX=/opt/rocm-4.3.0/bin/hipcc
export MYCXX=/opt/cray/pe/mpich/8.1.10/ofi/rocm-compiler/4.3/bin/mpicxx
export MYCC=/opt/cray/pe/mpich/8.1.10/ofi/rocm-compiler/4.3/bin/mpicc
export MYFTN=/opt/cray/pe/mpich/8.1.10/ofi/rocm-compiler/4.3/bin/mpifort

export basedir=`pwd`
export archname=spock
export srcdir=${basedir}/src
export archdir=${basedir}/${archname}
export builddir=${archdir}/build
export installdir=${archdir}/install
#export installdir=/gpfs/alpine/phy122/proj-shared/spock/amd_rocm_4.3
export KOKKOS_SOURCE_DIR=${srcdir}/kokkos
export KOKKOS_BUILD_DIR=${builddir}/kokkos
export KOKKOS_INSTALL_DIR=${installdir}/kokkos

export CABANA_SOURCE_DIR=${srcdir}/cabana
export CABANA_BUILD_DIR=${builddir}/cabana
export CABANA_INSTALL_DIR=${installdir}/cabana

export PETSC_SOURCE_DIR=${srcdir}/petsc
export PETSC_BUILD_DIR=${srcdir}/petsc
export PETSC_INSTALL_DIR=${installdir}/petsc

export CAMTIMERS_SOURCE_DIR=${srcdir}/camtimers
export CAMTIMERS_BUILD_DIR=${builddir}/camtimers
export CAMTIMERS_INSTALL_DIR=${installdir}/camtimers

export APEX_SOURCE_DIR=${srcdir}/apex
export APEX_BUILD_DIR=${builddir}/apex
export APEX_INSTALL_DIR=${installdir}/apex

export ADIOS2_SOURCE_DIR=${srcdir}/ADIOS2
export ADIOS2_BUILD_DIR=${builddir}/ADIOS2
export ADIOS2_INSTALL_DIR=${installdir}/ADIOS2

export XGC_SOURCE_DIR=${srcdir}/XGC-Devel
export XGC_BUILD_DIR=${builddir}/xgc

export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export OMP_NUM_THREADS=4
export ROCM_PATH=/opt/rocm-4.3.0



