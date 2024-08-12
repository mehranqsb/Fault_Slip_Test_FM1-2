##!/bin/bash

rm -f *_ts_* *.pvd *~ \#*
rm -rf ./_out
mkdir _out
# mpiexec -n 8 ~/build/release-petsc/bin/ogs -o _out FST_EPKd_FM2.prj
~/build-mg/bin/ogs -o _out FST_EPKd_FM2.prj
