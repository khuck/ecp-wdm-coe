# ecp-wdm-coe
build scripts for XGC on HIP/ROCm

Change the settings in "sourceme.sh" as appropriate. Modules in particular.
To build, run the `buildall.sh` script.
To run, run the `rocprof.sh` script.

In the results.csv file, the kernel with id "127" is the one of interest (it calls the `templated_push` kernel).
