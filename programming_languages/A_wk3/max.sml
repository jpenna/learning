datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp;

fun max_const e =
  let
    val max = 0;
  in
    case e of
         Constant v => v
       | Negate e1 => max_const e1
       | Add (e1, e2) => 
           let
             val m_e1 = max_const e1;
             val m_e2 = max_const e2;
           in
             if m_e1 > m_e2 then m_e1 else m_e2
           end
       | Multiply (e1, e2) => 
           (* same as above, could use a helper function, but here using a
            * library *)
            Int.max(max_const e1, max_const e2)
  end;

val test_exp = Add (Constant 19, Negate (Constant 4));
val m = max_const test_exp;
