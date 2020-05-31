datatype sign = P | N | Z


fun multisign (x,y) =
  let 
    fun sign a = 
      if a = 0 then Z else if a > 0 then P else N
  in
    case (sign x, sign y) of
         (_,Z) => Z
       | (Z,_) => Z
       | (N,N) => P
       | (P,P) => P
       | _ => N
  end 



fun multisign2 (x,y) =
  let 
    fun sign a = 
      if a = 0 then Z else if a > 0 then P else N
  in
    case sign x of
         P => sign y
       | N => (case sign y of
                   Z => Z
                 | N => P
                 | P => N)
       | Z => Z 
  end
