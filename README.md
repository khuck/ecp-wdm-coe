# ecp-wdm-coe
build scripts for XGC on HIP/ROCm

## Building on Spock

If building on spock, source the `sourceme-spock.sh` file, and run `buildall.sh`.
It should just clone the XGC source and build the full code with the installed dependencies.

## Building elsewhere

Change the settings in `sourceme.sh` as appropriate. Modules in particular.
Depending on your host CPU arch, you might have to change the `Kokkos_ARCH_SNB`
argument in the kokkos build to a different architecture.  `Kokkos_ARCH_SNB` is
for intel sandybridge.  See
https://github.com/kokkos/kokkos/blob/master/Makefile.kokkos for examples.

If you have a BLAS/LAPACK installation already (or if you are building the full
code), you can skip the OpenBLAS step.  Just modify `sourceme.sh` to change the
`LAPACK_INSTALL_DIR` path.

To build, run the `buildall.sh` script.
To run the kernel tests, run the `rocprof.sh` script.

In the results.csv file, the kernel with id "127" is the one of interest (it calls the `templated_push` kernel).

Please note that the original `sourceme.sh` file is from a test system at UO.
On Spock, you don't have to build any dependencies.  Please see the buildall-spock.sh for details.

### Building full XGC

Modify `buildall.sh` to set `fullcode=1` before running it.
