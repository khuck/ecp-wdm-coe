# ecp-wdm-coe
build scripts for XGC on HIP/ROCm

Change the settings in "sourceme.sh" as appropriate. Modules in particular.
Depending on your host CPU arch, you might have to change the `Kokkos_ARCH_SNB` argument in the kokkos build to a different architecture.  `Kokkos_ARCH_SNB` is for intel sandybridge.

To build, run the `buildall.sh` script.
To run, run the `rocprof.sh` script.

In the results.csv file, the kernel with id "127" is the one of interest (it calls the `templated_push` kernel).
