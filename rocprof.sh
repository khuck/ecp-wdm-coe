#!/bin/bash -e

source sourceme.sh

export OMP_PROC_BIND=spread
export OMP_PLACES=threads
export OMP_NUM_THREADS=4

cd ${XGC_BUILD_DIR}/test_cases
rocprof --stats ../bin/electron_pushKernel-gpu \
-n_ptl 500000
#--test
mv results.csv ../../..

