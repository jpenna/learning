(* 
 * Internal invariants: 
 * (1) all denominator are greater than 0, even if client uses negative values. 
 * (2) all rational values returned from functions are reduced.
 *
 * The internal function MAINTAIN and RELIES on these internal invariants.
 * Use signatures, so the invariants cannot be violated by clients.
 * *)

 (* Signatures (1) deny bindings exists (private) and (2) make types abstract (clients cannot create values of them or access their pieces directly *)

signature RATIONAL_A =
sig
  (* datatype rational = Whole of int | Frac of int*int *)
  (* With the above, Rational1.Frac(8, ~1) works, because `datatype rational` is public and the client can call this constructor directly *)

  (* by just declaring the `type` with no = means the type exists, but clients can't use it *)
  type rational
  val Whole : int -> rational (* exposes Whole as a constructor (function) *)
  exception BadFrac
  val make_frac : int * int -> rational
  val add : rational * rational -> rational
  val toString : rational -> string

  (* signature can be more strict and the module implement it more general, but the signature defines the type *)
  val get_back : string -> string (* less general... *)
end


structure Rational1 :> RATIONAL_A = 
struct 
  datatype rational = Whole of int | Frac of int*int

  exception BadFrac

  fun get_back x = x

  fun gcd (x, y) = 
    if x = y 
    then x
    else if x < y 
         then gcd(x,y-x)
         else gcd(y,x)

  fun reduce r =
    case r of 
         Whole _ => r
       | Frac(x,y) => if x = 0
                      then Whole 0
                      else let val d = gcd(abs x, y) in 
                        if d = y
                        then Whole (x div d)
                        else Frac (x div d, y div d) 
                      end 

  fun make_frac (x, y) =
    if y = 0 
    then raise BadFrac
    else if y < 0
    then reduce(Frac(~x, ~y))
    else reduce(Frac(x, y))

  fun add (r1, r2) =
    case (r1, r2) of 
         (Whole(i), Whole(j)) => Whole(i+j)
       | (Whole(i), Frac(j,k)) => Frac(i*k + j, k)
       | (Frac(i,k), Whole(j)) => Frac(j*k + i, k)
       | (Frac(i,k), Frac(j,n)) => reduce(Frac(i*n + j*k, k*n))


  fun toString r =
    case r of 
         Whole i => Int.toString i 
       | Frac(a,b) => (Int.toString a) ^ "/" ^ (Int.toString b)


end


val x = Rational1.make_frac(4, 5);
val y = Rational1.make_frac(8,2);
val z = Rational1.add(x, y);
val a = Rational1.toString(z);
