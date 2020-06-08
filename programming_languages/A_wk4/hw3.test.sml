(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "./hw3.sml";

val test1 = only_capitals ["A","B","C"] = ["A","B","C"];
val test1 = only_capitals ["A","b","C"] = ["A","C"];
val test1 = only_capitals ["Abacate","beterra","Cate"] = ["Abacate","Cate"];
val test1 = only_capitals ["Abacate", "iLumi"] = ["Abacate"];
val test1 = only_capitals [] = [];
val test1 = only_capitals ["un", "de", "tre"] = [];
val test1 = only_capitals ["uN", "dEDSE", "trE"] = [];


val test2 = longest_string1 ["A","bc","C"] = "bc";
val test2 = longest_string1 ["Aqwpoier","bc","Iqwpoier"] = "Aqwpoier";
val test2 = longest_string1 ["r","bc","Car"] = "Car";
val test2 = longest_string1 [] = "";



val test3 = longest_string2 ["A","bc","C"] = "bc";
val test3 = longest_string2 ["A","bc","C"] = "bc";
val test3 = longest_string2 ["Aqwpoier","bc","Iqwpoier"] = "Iqwpoier";
val test3 = longest_string2 ["r","bc","Car"] = "Car";
val test3 = longest_string2 [] = "";


val test4a = longest_string3 ["A","bc","C"] = "bc";
val test4a = longest_string3 ["Aqwpoier","bc","Iqwpoier"] = "Aqwpoier";
val test4a = longest_string3 ["r","bc","Car"] = "Car";
val test4a = longest_string3 [] = "";

val test4b = longest_string4 ["A","bc","C"] = "bc";
val test4b = longest_string4 ["A","bc","C"] = "bc";
val test4b = longest_string4 ["Aqwpoier","bc","Iqwpoier"] = "Iqwpoier";
val test4b = longest_string4 ["r","bc","Car"] = "Car";
val test4b = longest_string4 [] = "";


val test5 = longest_capitalized ["A","bc","C"] = "A";
val test5 = longest_capitalized ["Abac","bc","C"] = "Abac";
val test5 = longest_capitalized ["A","bc","Car"] = "Car";
val test5 = longest_capitalized [] = "";
val test5 = longest_capitalized ["qwerpoiqjwf", "A"] = "A";
val test5 = longest_capitalized ["qwefjp","bqwepoifqjc","Chor", "Chor1"] = "Chor1";
val test5 = longest_capitalized ["qwefjp","bqwepoifqjc","Chor1", "Chor2"] = "Chor1";

val test6 = rev_string "abc" = "cba";
val test6 = rev_string "" = "";
val test6 = rev_string "123456" = "654321";
val test6 = rev_string "aba cba hou" = "uoh abc aba";

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4;
val test7 = (first_answer (fn x => if x > 3 then SOME x else NONE) [] handle NoAnswer => ~1) = ~1;
val test7 = (first_answer (fn x => if x > 9 then SOME x else NONE) [1,2,3,4,5] handle NoAnswer => ~1) = ~1;
val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [9,2,3,4,5] = 9;
val test7 = first_answer (fn x => if x > 8 then SOME x else NONE) [1,2,3,4,9] = 9;


val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE;
val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME [];
val test8 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7];
val test8 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7,0] = NONE;
val test8 = all_answers (fn x => if x > 2 then SOME [x] else NONE) [3,4,2,5,6,7] = NONE;
val test8 = all_answers (fn x => if x > 2 then SOME [x] else NONE) [7] = SOME [7];


val test9a = count_wildcards Wildcard = 1;
val test9a = count_wildcards (ConstructorP("SOME", TupleP [Variable "x", ConstP 3])) = 0;
val test9a = count_wildcards (ConstructorP("SOME", TupleP [Wildcard, ConstP 3])) = 1;
val test9a = count_wildcards (ConstructorP("SOME", TupleP [Wildcard, Wildcard])) = 2;
val test9a = count_wildcards (TupleP [Wildcard, ConstructorP ("SOME", TupleP [Wildcard, Wildcard])]) = 3;
val test9a = count_wildcards (TupleP []) = 0;
val test9a = count_wildcards UnitP = 0;

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1;
val test9b = count_wild_and_variable_lengths Wildcard = 1;
val test9b = count_wild_and_variable_lengths (ConstructorP("SOME", TupleP [Variable "x", ConstP 3])) = 1;
val test9b = count_wild_and_variable_lengths (ConstructorP("SOME", TupleP [Wildcard, ConstP 3])) = 1;
val test9b = count_wild_and_variable_lengths (ConstructorP("SOME", TupleP [Wildcard, Variable "my name"])) = 8;
val test9b = count_wild_and_variable_lengths (TupleP [Wildcard, ConstructorP ("SOME", TupleP [Variable "my", ConstP 8])]) = 3;
val test9b = count_wild_and_variable_lengths (TupleP []) = 0;
val test9b = count_wild_and_variable_lengths UnitP = 0;
val test9b = count_wild_and_variable_lengths (TupleP [Variable "my", Variable "my", Variable "my"]) = 6;




val test9c = count_some_var ("x", Variable("x")) = 1;
val test9c = count_some_var ("p", Wildcard) = 0;
val test9c = count_some_var ("x", ConstructorP("SOME", TupleP [Variable "x", ConstP 3])) = 1;
val test9c = count_some_var ("i", ConstructorP("SOME", TupleP [Wildcard, ConstP 3])) = 0;
val test9c = count_some_var ("my name", ConstructorP("SOME", TupleP [Wildcard, Variable "my name"])) = 1;
val test9c = count_some_var ("my j", TupleP [Wildcard, ConstructorP ("SOME", TupleP [Variable "my", ConstP 8])]) = 0;
val test9c = count_some_var ("x", TupleP []) = 0;
val test9c = count_some_var ("x", UnitP) = 0;
val test9c = count_some_var ("my", TupleP [Variable "my", Variable "my", Variable "my"]) = 3;


val test10 = check_pat (Variable("x")) = true;
val test10 = check_pat Wildcard = true;
val test10 = check_pat (TupleP [Variable("x"), Variable("x")]) = false;
val test10 = check_pat (ConstructorP("SOME", TupleP [Variable "x", ConstP 3])) = true;
val test10 = check_pat (ConstructorP("SOME", TupleP [Variable "xor", Variable "xor"])) = false;
val test10 = check_pat (ConstructorP("SOME", TupleP [Wildcard, ConstP 3])) = true;
val test10 = check_pat (TupleP [Variable "my", ConstructorP ("SOME", TupleP [Variable "j", Variable "my"])]) = false;
val test10 = check_pat (TupleP []) = true;
val test10 = check_pat UnitP = true;
val test10 = check_pat (TupleP [Variable "my", Variable "my", Variable "my"]) = false;
val test10 = check_pat (TupleP [Variable "my1", Variable "my2", Variable "my3"]) = true;



val test11a = match (Const(1), UnitP) = NONE;
val test11 = match (Const(1), Variable("x")) = SOME [("x", Const(1))];
val test11 = match (Const(1), ConstP 1) = SOME [];
val test11 = match (Const(1), ConstP 3) = NONE;
val test11 = match (Const(5), ConstP 5) = SOME [];
val test11 = match (Const(1), Wildcard) = SOME [];
val test11b = match (Unit, UnitP) = SOME [];
val test11 = match (Tuple [], TupleP []) = SOME [];
val test11d = match (Constructor("NO", Const 3), ConstructorP("SOME", ConstP 3)) = NONE;
val test11 = match (Constructor("SOME", Const 3), ConstructorP("SOME", ConstP 3)) = SOME [];
val test11 = match (Constructor("SOME", Const 54), ConstructorP("SOME", Variable "x")) = SOME [("x", Const 54)];
val test11c = match (Tuple [Const 3], TupleP [ConstP 1]) = NONE;
val test11f = match (Constructor("SOME", Tuple [Const 54, Const 60]), ConstructorP("NO", TupleP [Variable "j", Variable "k"])) = NONE;
val test11h = match (Tuple [Const 1, Const 1], TupleP [ConstP 1]) = NONE;

val test11 = match (Tuple [Const 1, Const 3], TupleP [Variable("x"), Variable("y")]) = SOME [("x", Const(1)), ("y", Const(3))];
val test11 = match (Constructor("SOME", Tuple [Const 54, Const 60]), ConstructorP("SOME", TupleP [Variable "x", Variable "y"])) = SOME [("x", Const(54)), ("y", Const(60))];
val test11 = match (Constructor("SOME", Tuple [Const 54, Tuple [Const 60, Const 80]]), ConstructorP("SOME", TupleP [Variable "j", Variable "k"])) =  SOME [("j", Const(54)), ("k", Tuple [Const 60, Const 80])];

val test11break = match (Tuple [Const 1, Const 3], TupleP [ConstP 1, ConstP 7]) = NONE;
val test11e = match (Constructor("SOME", Tuple [Unit, Const 3]), ConstructorP("SOME", TupleP [Wildcard, Wildcard])) = SOME [];
val test11 = match (Tuple [Const 1, Const 3], TupleP [ConstP 1, ConstP 3]) = SOME [];
val test11 = match (Tuple [Const 1], TupleP [ConstP 1]) = SOME [];
val test11 = match (Constructor("SOME", Tuple [Const 54, Const 60]), ConstructorP("SOME", TupleP [Wildcard, ConstP 3])) = NONE;



val test12 = first_match Unit [UnitP] = SOME [];
val test12a = first_match (Const(1)) [UnitP] = NONE;
val test12 = first_match (Const(1)) [UnitP, ConstructorP("SOME", ConstP 3), Variable("x")] = SOME [("x", Const(1))];
val test12 = first_match (Const(1)) [UnitP, ConstructorP("SOME", ConstP 3), TupleP [ConstP 1]] = NONE;
val test12 = first_match (Constructor("SOME", Const 3)) [ConstP 1, ConstructorP("SOME", ConstP 3), UnitP] = SOME [];
val test12 = first_match (Constructor("SOME", Const 3)) [ConstP 1, ConstructorP("NO", ConstP 3), UnitP] = NONE;
val test12B = first_match (Tuple [Const 1]) [TupleP [ConstP 1]] = SOME [];
val test12 = first_match (Constructor("SOME", Tuple [Const 54, Tuple [Const 60, Const 80]])) [UnitP, ConstP 1, TupleP [ConstP 1], ConstructorP("SOME", TupleP [Variable "j", Variable "k"])] =  SOME [("j", Const(54)), ("k", Tuple [Const 60, Const 80])];

(* ((string * string * typ) list) * (pattern list) -> typ option. *)

val challenge1 = typecheck_patterns (
  [("")],
  [ConstP 10, Variable "a"],
) = SOME IntT;

val challenge2 = typecheck_patterns (
  [("")],
  [ConstP 10, Variable "a", ConstructorP("SOME", Variable "x")]
) = NONE;

val challenge3 = typecheck_patterns (
  [("")],
  [TupleP[Variable "a", ConstP 10, Wildcard], TupleP[Variable "b", Wildcard, ConstP 11], Wildcard]
) = SOME TupleT[Anything,IntT,IntT];

val challenge4 = typecheck_patterns (
  [("Red","color",UnitT),("Green","color",UnitT),("Blue","color",UnitT)],
  [ConstructorP("Red", UnitP), Wildcard]
) = SOME (Datatype "color");

val challenge5 = typecheck_patterns (
  [("Sedan","auto", Datatype "color"),("Truck","auto",TupleT[IntT, Datatype "color"]),("SUV","auto",UnitT)],
  [ConstructorP("Sedan", Variable "a"), ConstructorP("Truck", TupleP[Variable "b", Wildcard]), Wildcard]
) = SOME (Datatype "auto");

val challenge6 = typecheck_patterns (
  [("Empty","list",UnitT),("List","list",TupleT[Anything, Datatype "list"])],
  [ConstructorP("Empty",UnitP),ConstructorP("List",TupleP[ConstP 10, ConstructorP("Empty",UnitP)]), Wildcard]
) = SOME (Datatype "list");

(* val challenge9 = typecheck_patterns (
  [TupleP[Variable "x", Variable "y"], TupleP[Wildcard, Wildcard]],
) = SOME TupleT[Anything, Anything];

val challenge10 = typecheck_patterns (
  TupleP[Wildcard, Wildcard], TupleP[Wildcard, TupleP[Wildcard,Wildcard]]
) = SOME (TupleT[Anything, TupleT[Anything, Anything]]); *)
