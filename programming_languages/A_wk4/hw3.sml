(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* 1 *)
val only_capitals = List.filter (fn s => Char.isUpper (String.sub (s, 0)));

(* 2 *)
fun longest_string1 slist = 
  foldl (fn (s, init) => if String.size s > String.size init then s else init) "" slist

(* 3 *)
fun longest_string2 slist = 
 foldl (fn (s, init) => if String.size s >= String.size init then s else init) "" slist

(* 4 *)
fun longest_string_helper f slist =
  foldl (fn (s, init) => if f(String.size s, String.size init) then s else init) "" slist

val longest_string3 = longest_string_helper (fn (a, b) => a > b);
val longest_string4 = longest_string_helper (fn (a, b) => a >= b);

(* 5 *)
val longest_capitalized = foldl (
  fn (s, init) => 
    if (Char.isUpper o String.sub)(s, 0) andalso String.size s > String.size init 
    then s 
    else init
) ""

(* 6 *)
val rev_string = String.implode o List.rev o String.explode 

(* 7 *)
fun first_answer f alist =
  case alist of
       [] => raise NoAnswer |
       x::xs => case f x of 
                     SOME y => y |
                     NONE => first_answer f xs

(* 8 *)
fun all_answers f alist =
  let
    fun helper ([], init) = init
      | helper (_, NONE) = NONE
      | helper (s::ss, SOME init) = helper(ss, case f s of 
                                               NONE => NONE 
                                             | SOME x => SOME (init @ x)
                                     )
  in
    helper(alist, SOME [])
  end

(* 9 *)
val count_wildcards = g (fn _ => 1) (fn _ => 0)

val count_wild_and_variable_lengths = g (fn _ => 1) (fn s => String.size(s))

fun count_some_var (s, p) = g (fn _ => 0) (fn v => if v = s then 1 else 0) p

(* 10 *)
fun check_pat p = 
  let
    fun get_all_names p =
      case p of
           Variable x => [x] 
         | TupleP t => List.foldl (fn (p, acc) => get_all_names p @ acc) [] t
         | ConstructorP(_, p) => get_all_names p
         | _ => []

    fun repeats ss = 
      case ss of 
           [] => false
         | s::ss' => List.exists (fn s' => s' = s) ss' orelse repeats ss'
  in
    not ((repeats o get_all_names) p)
  end

(* 11 *)
fun match (v, p) =
  case (v, p) of
       (_, Wildcard) => SOME []
     | (s, Variable p) => SOME [(p, s)]
     | (Unit, UnitP) => SOME []
     | (Const x, ConstP y) => if x = y then SOME [] else NONE
     | (Tuple vs, TupleP ps) => 
         if length vs = length ps then all_answers match (ListPair.zip(vs, ps)) else NONE
     | (Constructor (s1, v1), ConstructorP (s2, v2)) => if s1 = s2 then match(v1, v2) else NONE
     | _ => NONE

(* 12 *)
fun first_match v ps =
  SOME (first_answer (fn p => match(v, p)) ps) handle NoAnswer => NONE






