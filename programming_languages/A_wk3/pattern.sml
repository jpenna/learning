exception ListLengthMismatch;


fun zip3 triple =
  case triple of
       ([],[],[]) => [] 
     | (hd1::tl1, hd2::tl2, hd3::tl3) => (hd1,hd2,hd3)::zip3(tl1,tl2,tl3)
     | _ => raise ListLengthMismatch; 


zip3([1,2,3], [4,5,6], [7,8,9]);


fun unzip3 zipped_triple =
  case zipped_triple of
       [] => ([], [], [])
     | (x,y,z)::rest => let val (x1,y1,z1) = unzip3 rest
                        in (x::x1, y::y1, z::z1)
                        end;


unzip3 [(1,4,7),(2,5,8),(3,6,9)];
unzip3 [(1,4,7),(2,5,8),(3,6,9)];
