//+ Parameters
no_layers = 4;
thickness_fault_h = 0.0233;
width = 20.;
dip_angle = 65 * Pi / 180.;
thickness_fault = thickness_fault_h * Sin(dip_angle);
dx = (thickness_fault / 2.) * Sin(dip_angle) * Sin(dip_angle);
dy = (thickness_fault / 2.) * Sin(dip_angle) * Cos(dip_angle);
dx_i = 0.5 * Cos(dip_angle);
dy_i = 0.5 * Sin(dip_angle);
x_center = 10.;
y_center = 10.;
x_0 = 5.22035 + 0.10492;
y_0 = 0;
x_1 = 5.4535 - 0.10492;
y_1 = 0;
x_2 = 14.7797 - 0.10492;
y_2 = 20;
x_3 = 14.5465 + 0.10492;
y_3 = 20;
//
lc = 1.;
fc = 1.5;
hc = 5.;
//+ Nodal Coordinates
Point(1) = {0.,        0.,   0., lc * hc};
Point(2) = {x_0,   y_0,  0., lc * fc};
Point(3) = {x_1,   y_1,   0., lc * fc};
Point(4) = {20.,       0.,   0., lc * hc};
Point(5) = {20.,      20.,   0., lc * hc};
Point(6) = {x_2,  y_2,   0., lc * fc};
Point(7) = {x_3,  y_3,   0., lc * fc};
Point(8) = {0.,       20.,   0., lc * hc};
Point(9) = {x_center - dx + dx_i, y_center + dy + dy_i, 0., lc * fc };
Point(10)= {x_center - dx - dx_i, y_center + dy - dy_i, 0., lc * fc};
Point(11)= {x_center + dx + dx_i, y_center - dy + dy_i, 0., lc * fc};
Point(12)= {x_center + dx - dx_i, y_center - dy - dy_i, 0., lc * fc};
Point(13)= {x_center - dx, y_center + dy, 0., lc * fc };
Point(14)= {10., 10., 0., lc * fc };
Point(15)= {x_center + dx, y_center - dy, 0., lc * fc};
Point(16)= {9.37, 8.64896064, 0., lc * fc};
Point(17)= {9.37 - dx, 8.64896064 + dy, 0., lc * fc};
Point(18)= {9.37 + dx, 8.64896064 - dy, 0., lc * fc};
Point(19)= {0., 8.64896064 + dy, 0., lc * fc}; //17
Point(20)= {0., y_center + dy, 0., lc * fc}; // 10
Point(21) = {0., y_center + dy + dy_i, 0., lc * fc }; // 9
Point(22)= {width, y_center - dy, 0., lc * fc};
Point(23)= {width, y_center - dy - dy_i, 0., lc * fc};
Point(24)= {width, 8.64896064 - dy, 0., lc * fc};
//+ Lines
Line(1) = {1, 2};
Line(2) = {2, 17};
Line(3) = {17, 10};
Line(4) = {10, 13};
Line(5) = {13, 9};
Line(6) = {9, 7};
Line(7) = {7, 8};
Line(8) = {8, 21};
Line(9) = {21, 20};
Line(10) = {20, 19};
Line(11) = {19, 1};
Line(12) = {2, 3};
Line(13) = {3, 18};
Line(14) = {18, 17};
Line(15) = {18, 12};
Line(16) = {12, 10};
Line(17) = {12, 15};
Line(18) = {15, 14};
Line(19) = {14, 13};
Line(20) = {15, 11};
Line(21) = {11, 9};
Line(22) = {11, 6};
Line(23) = {6, 7};
Line(24) = {3, 4};
Line(25) = {4, 24};
Line(26) = {24, 23};
Line(27) = {23, 22};
Line(28) = {22, 5};
Line(29) = {5, 6};
//+
Curve Loop(1) = {8, 9, 10, 11, 1, 2, 3, 4, 5, 6, 7};
Plane Surface(1) = {1};
//+
Curve Loop(2) = {2, -14, -13, -12};
Plane Surface(2) = {2};
//+
Curve Loop(3) = {3, -16, -15, 14};
Plane Surface(3) = {3};
//+
Curve Loop(4) = {4, -19, -18, -17, 16};
Plane Surface(4) = {4};
//+
Curve Loop(5) = {5, -21, -20, 18, 19};
Plane Surface(5) = {5};
//+
Curve Loop(6) = {6, -23, -22, 21};
Plane Surface(6) = {6};
//+
Curve Loop(7) = {29, -22, -20, -17, -15, -13, 24, 25, 26, 27, 28};
Plane Surface(7) = {7};
//
Transfinite Curve {2, 13} = 111 Using Progression 1;
Transfinite Curve {3, 15} = 19 Using Progression 1;
Transfinite Curve {21, 16} = 2 Using Progression 1;
Transfinite Curve {4, 5, 17, 20} = 57 Using Progression 1;
Transfinite Curve {6, 22} = 205 Using Progression 1;
Transfinite Curve {23, 21, 16, 14, 12} = 4 Using Progression 1;
//+
Transfinite Surface {2, 3, 6};

// Set Mesh Algorithm
Mesh.Algorithm = 6; // For 2D, Frontal-Delaunay
Mesh.Algorithm3D = 10; // For 3D, Frontal-Delaunay

Extrude {0, 0, -10.} {
  Surface{1};  // The surface to be extruded
  // Layers{no_layers};
}
Extrude {0, 0, -10.} {
  Surface{2};  // The surface to be extruded
  // Layers{no_layers};
}
Extrude {0, 0, -10.} {
  Surface{3};  // The surface to be extruded
  // Layers{no_layers};
}
Extrude {0, 0, -10.} {
  Surface{4};  // The surface to be extruded
  // Layers{no_layers};
}
Extrude {0, 0, -10.} {
  Surface{5};  // The surface to be extruded
  // Layers{no_layers};
}
Extrude {0, 0, -10.} {
  Surface{6};  // The surface to be extruded
  // Layers{no_layers};
}
Extrude {0, 0, -10.} {
  Surface{7};  // The surface to be extruded
  // Layers{no_layers};
}
Physical Volume("HostRock", 264) = {1, 7};
Physical Volume("Fault", 265) = {2, 3, 4, 5, 6};

// Physical Surface("HostRock", 264) = {1, 7};
// Physical Surface("Fault", 265) = {2, 3, 4, 5, 6};

Field[1] = MathEval;
Field[1].F = "0.01 + 0.1 * sqrt(exp((x-10.)^2 + (y-10.)^2 + (z-0.)^2))";

// Apply the scalar field as the background field for mesh control
Background Field = 1;

