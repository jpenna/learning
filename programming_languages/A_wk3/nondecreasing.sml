fun nondecreasing vals =
  case vals of
       [] => true
     | _::[] => true
     | x::y::xs => x <= y andalso nondecreasing (y::xs);

nondecreasing [1,2,3,4,5,6,7,8];
nondecreasing [8];
nondecreasing [2,8];


nondecreasing [1,2,3,4,5,6,7,8,3];
nondecreasing [1,2,3,4,5,3,6,7,8];
nondecreasing [8,3];
nondecreasing [2,8,3];


 fun nondecreasing vals =
  case vals of
       [] => 0
     | _::[] => 1
     | x::y::xs => nondecreasing (y::xs);
