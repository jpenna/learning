fun length xs =
  case xs of
       [] => 0
     | _::xs' => 1 + length xs';


length([1,2,3,4]);
 length([1]);
 length([1,2,3,4,5,6,8,9,0,10]);
