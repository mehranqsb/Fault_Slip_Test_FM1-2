##!/bin/bash

rm -f *_ts_* *.pvd *~ \#*
rm -rf ./_out
mkdir _out
OMP_NUM_THREADS=16 OGS_ASM_THREADS=16 ~/build-mg/bin/ogs -o _out FST_EPKd_FM2.prj > _out.txt
