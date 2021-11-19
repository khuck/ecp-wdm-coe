# ecp-wdm-coe
build scripts for XGC on HIP/ROCm

Change the settings in "sourceme.sh" as appropriate. Modules in particular.
Depending on your host CPU arch, you might have to change the `Kokkos_ARCH_SNB` argument in the kokkos build to a different architecture.  `Kokkos_ARCH_SNB` is for intel sandybridge.

If you have a BLAS/LAPACK installation already, you can skip the OpenBLAS step.  Just modify `sourceme.sh` to change the `LAPACK_INSTALL_DIR` path.

To build, run the `buildall.sh` script.
To run, run the `rocprof.sh` script.

In the results.csv file, the kernel with id "127" is the one of interest (it calls the `templated_push` kernel).
