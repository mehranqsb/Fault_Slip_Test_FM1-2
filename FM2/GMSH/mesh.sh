#!/bin/bash

rm -f \#* *~ *.vtu

~/build-mg/bin/GMSH2OGS -i geo3D.msh -o geo.vtu -e --gmsh2_physical_id
~/build-mg/bin/NodeReordering -i geo.vtu -o geo_reorder.vtu

#
~/build-mg/bin/editMaterialID -i geo_reorder.vtu -o geo_reorder.vtu -r -m 0  -n 0
~/build-mg/bin/editMaterialID -i geo_reorder.vtu -o geo_reorder.vtu -r -m 1  -n 1
~/build-mg/bin/editMaterialID -i geo_reorder.vtu -o geo_reorder.vtu -r -m 2  -n 1
~/build-mg/bin/editMaterialID -i geo_reorder.vtu -o geo_reorder.vtu -r -m 3  -n 1
~/build-mg/bin/editMaterialID -i geo_reorder.vtu -o geo_reorder.vtu -r -m 4  -n 1
~/build-mg/bin/editMaterialID -i geo_reorder.vtu -o geo_reorder.vtu -r -m 5  -n 1
~/build-mg/bin/editMaterialID -i geo_reorder.vtu -o geo_reorder.vtu -r -m 6  -n 0

mv geo_reorder.vtu geo_domain_3D.vtu

~/build-mg/bin/createQuadraticMesh -i geo_domain_3D.vtu -o geo_domain_3D_q8.vtu

~/build-mg/bin/constructMeshesFromGeometry -m geo_domain_3D_q8.vtu -g cube_20x20x20.gml -s 1e-3
~/build-mg/bin/ExtractSurface -i geo_domain_3D_q8.vtu -o geometry_top.vtu    -x  0. -y -1. -z  0.
~/build-mg/bin/ExtractSurface -i geo_domain_3D_q8.vtu -o geometry_bottom.vtu -x  0. -y  1. -z  0.
~/build-mg/bin/ExtractSurface -i geo_domain_3D_q8.vtu -o geometry_back.vtu   -x  1. -y  0. -z  0.
~/build-mg/bin/ExtractSurface -i geo_domain_3D_q8.vtu -o geometry_front.vtu  -x -1. -y  0. -z  0.
~/build-mg/bin/ExtractSurface -i geo_domain_3D_q8.vtu -o geometry_left.vtu   -x  0. -y  0. -z -1.
~/build-mg/bin/ExtractSurface -i geo_domain_3D_q8.vtu -o geometry_right.vtu  -x  0. -y  0. -z  1.
