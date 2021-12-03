set -e

rm -rf ${XGC_BUILD_DIR}
mkdir -p ${XGC_BUILD_DIR}
cd ${XGC_BUILD_DIR}

#cxx_mpi_ldflags="-L/opt/cray/pe/mpich/8.1.10/ofi/amd/4.3/lib -L${CRAY_LIBSCI_PREFIX_DIR}/lib -Wl,--as-needed,-lmpi_amd,--no-as-needed -Wl,--as-needed,-lsci_amd_mpi_mp,--no-as-needed -Wl,--as-needed,-lsci_amd_mp,--no-as-needed -ldl ${PE_MPICH_GTL_DIR_amd_gfx908} ${PE_MPICH_GTL_LIBS_amd_gfx908}"
#cxx_mpi_ldflags="-L/opt/cray/pe/mpich/8.1.10/ofi/amd/4.3/lib -L${CRAY_LIBSCI_PREFIX_DIR}/lib -Wl,-rpath,${CRAY_LIBSCI_PREFIX_DIR}/lib -Wl,--as-needed,-lsci_amd_mp,--no-as-needed -Wl,--as-needed,-lsci_amd_mpi_mp,--no-as-needed -ldl ${PE_MPICH_GTL_DIR_amd_gfx908} ${PE_MPICH_GTL_LIBS_amd_gfx908}"
cxx_mpi_ldflags="-L${CRAY_LIBSCI_PREFIX_DIR}/lib -Wl,-rpath,${CRAY_LIBSCI_PREFIX_DIR}/lib -Wl,--as-needed,-lsci_amd_mp,--no-as-needed -Wl,--as-needed,-lsci_amd_mpi_mp,--no-as-needed -ldl"

set -x
cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_CXX_COMPILER=${MYCXX} \
-DCMAKE_C_COMPILER=`which clang` \
-DCMAKE_Fortran_COMPILER=ftn \
-DCMAKE_CXX_STANDARD=14 \
-DCMAKE_CXX_FLAGS=-std=c++14 \
-DCMAKE_EXE_LINKER_FLAGS="-fopenmp ${cxx_mpi_ldflags}" \
-DBUILD_FULL_XGC=Off \
-DKokkos_ROOT="${KOKKOS_INSTALL_DIR}" \
-DCabana_ROOT="${CABANA_INSTALL_DIR}" \
-DUSE_SYSTEM_CAMTIMERS=ON \
-DCAMTIMERS_ROOT="${CAMTIMERS_INSTALL_DIR}" \
${XGC_SOURCE_DIR}
set +x

make -j 16 -l 64
#make VERBOSE=1
ctest --rerun-failed --output-on-failure
cd ../..

#-DCMAKE_CXX_COMPILER=hipcc \
#-DCMAKE_CXX_FLAGS="-fsanitize=address -fno-omit-frame-pointer" \
#-DCMAKE_EXE_LINKER_FLAGS="-fopenmp -Wl,-rpath,${GCC_X86_64}/lib64" \
