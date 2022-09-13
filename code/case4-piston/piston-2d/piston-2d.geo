unit = 1e-3;
he = 0.8 * unit;

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

Point(24) = {-37.5*unit ,0          ,0 , he};
Point(25) = {-37.5*unit ,59*unit    ,0 , he};
Point(26) = {-33.5*unit ,59*unit    ,0 , he};
Point(27) = {-33.5*unit ,62*unit    ,0 , he};
Point(28) = {-37.5*unit ,62*unit    ,0 , he};
Point(29) = {-37.5*unit ,66*unit    ,0 , he};
Point(30) = {-33.9*unit ,66*unit    ,0 , he};
Point(31) = {-33.9*unit ,68*unit    ,0 , he};
Point(32) = {-37.5*unit ,68*unit    ,0 , he};
Point(33) = {-37.5*unit ,72*unit    ,0 , he};
Point(34) = {-35.5*unit ,72*unit    ,0 , he};
Point(35) = {-35.5*unit ,73.75*unit ,0 , he};
Point(36) = {-37.5*unit ,73.75*unit ,0 , he};
Point(37) = {-37.5*unit ,80.75*unit ,0 , he};
Point(38) = {-26*unit   ,68.75*unit ,0 , he};
Point(39) = {-26*unit   ,45*unit    ,0 , he};
Point(40) = {-32*unit   ,45*unit    ,0 , he};
Point(41) = {-32*unit   ,5*unit     ,0 , he};
Point(42) = {-35.5*unit ,5*unit     ,0 , he};
Point(43) = {-35.5*unit ,0          ,0 , he};
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
Line(24) = {16, 37};
//+
Line(25) = {37, 36};
//+
Line(26) = {36, 35};
//+
Line(27) = {35, 34};
//+
Line(28) = {34, 33};
//+
Line(29) = {33, 32};
//+
Line(30) = {32, 31};
//+
Line(31) = {31, 30};
//+
Line(32) = {30, 29};
//+
Line(33) = {29, 28};
//+
Line(34) = {28, 27};
//+
Line(35) = {27, 26};
//+
Line(36) = {26, 25};
//+
Line(37) = {25, 24};
//+
Line(38) = {24, 43};
//+
Line(39) = {43, 42};
//+
Line(40) = {42, 41};
//+
Line(41) = {41, 40};
//+
Line(42) = {40, 39};
//+
Line(43) = {39, 38};
//+
Line(44) = {38, 17};
//+
Line Loop(1) = {24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 16, 17, 18, 19, 20, 22, 23, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14};
//+
Plane Surface(1) = {1};
