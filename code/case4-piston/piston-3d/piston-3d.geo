unit = 1e-3;
he = 2 * unit;

// Point(1) =  {0    ,0     ,0 , he};
Point(2) =  {37.5*unit ,0          ,0 , he};
Point(3) =  {37.5*unit ,59*unit    ,0 , he};
Point(4) =  {33.5*unit ,59*unit    ,0 , he};
Point(5) =  {33.5*unit ,62*unit    ,0 , he};
Point(6) =  {37.5*unit ,62*unit    ,0 , he};
Point(7) =  {37.5*unit ,66*unit    ,0 , he};
Point(8) =  {33.9*unit ,66*unit    ,0 , he};
Point(9) =  {33.9*unit ,68*unit    ,0 , he};
Point(10) = {37.5*unit ,68*unit    ,0 , he};
Point(11) = {37.5*unit ,72*unit    ,0 , he};
Point(12) = {35.5*unit ,72*unit    ,0 , he};
Point(13) = {35.5*unit ,73.75*unit ,0 , he};
Point(14) = {37.5*unit ,73.75*unit ,0 , he};
Point(15) = {37.5*unit ,80.75*unit ,0 , he};
Point(16) = {0         ,80.75*unit ,0 , he};
Point(17) = {0         ,68.75*unit ,0 , he};
Point(18) = {26*unit   ,68.75*unit ,0 , he};
Point(19) = {26*unit   ,45*unit    ,0 , he};
Point(20) = {32*unit   ,45*unit    ,0 , he};
Point(21) = {32*unit   ,5*unit     ,0 , he};
Point(22) = {35.5*unit ,5*unit     ,0 , he};
Point(23) = {35.5*unit ,0          ,0 , he};

//+
Line(1) = {2, 3};
//+
Line(2) = {3, 4};
//+
Line(3) = {4, 5};
//+
Line(4) = {5, 6};
//+
Line(5) = {6, 7};
//+
Line(6) = {7, 8};
//+
Line(7) = {8, 9};
//+
Line(8) = {9, 10};
//+
Line(9) = {10, 11};
//+
Line(10) = {11, 12};
//+
Line(11) = {12, 13};
//+
Line(12) = {13, 14};
//+
Line(13) = {14, 15};
//+
Line(14) = {15, 16};
//+
//+
Line(16) = {17, 18};
//+
Line(17) = {18, 19};
//+
Line(18) = {19, 20};
//+
Line(19) = {20, 21};
//+
Line(20) = {21, 22};
//+
Line(21) = {22, 22};
//+
Line(22) = {22, 23};
//+
Line(23) = {23, 2};

//+
Line(24) = {17, 16};
//+
Line Loop(1) = {24, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, -23, -22, -20, -19, -18, -17, -16};
//+
Plane Surface(1) = {1};
//+
Extrude {{0, 1, 0}, {0, 0, 0}, Pi/2} {
  Surface{1}; 
}
//+
Surface Loop(1) = {51, 1, 131, 55, 59, 63, 67, 71, 75, 79, 83, 87, 91, 95, 99, 103, 107, 111, 115, 119, 123, 127, 130};
//+
Volume(2) = {1};
