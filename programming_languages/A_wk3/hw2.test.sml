(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw2.sml";

val test1 = all_except_option ("string", ["string"]) = SOME [];
all_except_option("Fred", ["John", "Smith"]) = NONE;
all_except_option("Fred", ["John", "Fred", "Smith"]) = SOME ["John", "Smith"];
all_except_option("Fred", []) = NONE;
all_except_option("Fred", ["John","Jorge","Mary"]) = NONE;

 val test2 = get_substitutions1([["foo"],["there"]], "foo") = [];
get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") =  ["Fredrick","Freddie","F"];
get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") =  ["Jeffrey","Geoff","Jeffrey"];
get_substitutions1([[],[]], "foo") = [];
get_substitutions1([["foo"],["there"]], "foo") = [];
get_substitutions1([["Fred","Fredrick"],[],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") =  ["Jeffrey","Geoff","Jeffrey"];
get_substitutions1([["Fred","Fredrick"],[],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"],["Mark", "Rondom"]], "Jeff") =  ["Jeffrey","Geoff","Jeffrey"];


val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = [];
get_substitutions2([["foo"],["there"]], "foo") = [];
get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") =  ["Fredrick",       "Freddie","F"];
get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") =  ["Jeffrey",       "Geoff","Jeffrey"];
get_substitutions2([[],[]], "foo") = [];
get_substitutions2([["foo"],["there"]], "foo") = [];
get_substitutions2([["Fred","Fredrick"],[],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff") =  ["Jeffrey",    "Geoff","Jeffrey"];
get_substitutions2([["Fred","Fredrick"],[],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"],["Mark", "Rondom"]],        "Jeff") =  ["Jeffrey","Geoff","Jeffrey"];
get_substitutions2([["Fred","Fredrick"],[],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"],["Mark", "Rondom"]],        "Jeff");

val test4 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
  [{first="Fred", last="Smith", middle="W"},
    {first="Fredrick", last="Smith", middle="W"},
    {first="Freddie", last="Smith", middle="W"},
     {first="F",last="Smith", middle="W"}];

similar_names(
  [], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"}
];


similar_names(
  [[], ["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"},
  {first="Fredrick", last="Smith", middle="W"},
  {first="Freddie", last="Smith", middle="W"},
  {first="F",last="Smith", middle="W"}
];
similar_names(
  [["Fred","Fredrick"],["Elizabeth","Betty"],[], ["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"},
  {first="Fredrick", last="Smith", middle="W"},
  {first="Freddie", last="Smith", middle="W"},
  {first="F",last="Smith", middle="W"}
];

similar_names(
  [["Fred","Fredrick"],["Elizabeth","Betty"],["Fred"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"},
  {first="Fredrick", last="Smith", middle="W"},
  {first="Freddie", last="Smith", middle="W"},
  {first="F",last="Smith", middle="W"}
];

similar_names(
  [["Elizabeth","Betty"]], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"}
];

similar_names(
  [["Fred","F"]], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"},
  {first="F",last="Smith", middle="W"}
];

similar_names(
  [["Fred"]], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"}
];

similar_names(
  [[], [], []], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"}
];

similar_names(
  [["Elizabeth","Betty"], ["John", "Josh"], ["Peter"]], {first="Fred", middle="W", last="Smith"}
) = [
  {first="Fred", last="Smith", middle="W"}
];



 val test5 = card_color (Clubs, Num 2) = Black;
card_color (Spades, Jack) = Black;
card_color (Hearts, Jack) = Red;
card_color (Diamonds, Jack) = Red;


 val test6 = card_value(Spades, Num 5) = 5;
card_value(Spades, Num 8) = 8;
card_value(Spades, Num 9) = 9;
card_value(Spades, Ace) = 11;
card_value(Spades, Jack) = 10;
card_value(Spades, Queen) = 10;
card_value(Spades, King) = 10;
val test6 = card_value (Clubs, Num 2) = 2


 val test7 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [];
remove_card([], (Hearts, Ace), IllegalMove) handle _ => [];
remove_card([(Spades, Ace), (Hearts, Num 10)], (Hearts, Ace), IllegalMove) handle _ => [];
remove_card([(Hearts, Ace), (Hearts, Ace), (Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace), (Hearts, Ace)];
remove_card([(Spades, Ace), (Hearts, Ace), (Hearts, Jack)], (Hearts, Ace), IllegalMove) = [(Spades, Ace), (Hearts, Jack)];
remove_card([(Spades, Ace), (Hearts, Jack), (Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Spades, Ace), (Hearts, Jack)];
remove_card([(Hearts, Ace), (Spades, Ace), (Hearts, Jack)], (Hearts, Ace), IllegalMove) = [(Spades, Ace), (Hearts, Jack)];


val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true;
all_same_color[(Hearts, Ace), (Hearts, Ace), (Hearts, Ace), (Hearts, Ace)] = true;
all_same_color[(Spades, Ace), (Hearts, Ace), (Hearts, Ace), (Hearts, Ace)] = false;
all_same_color[(Hearts, Ace), (Hearts, Ace), (Hearts, Ace), (Clubs, Ace)] = false;
all_same_color[(Hearts, Ace), (Hearts, Ace), (Spades, Ace), (Hearts, Ace)] = false;
all_same_color[(Spades, Ace), (Clubs, Ace)] = true;
all_same_color[(Hearts, Ace), (Diamonds, Ace), (Hearts, Ace), (Diamonds, Ace)] = true;
all_same_color[(Hearts, Ace), (Spades, Ace)] = false;
all_same_color[] = true;
all_same_color[(Hearts, Ace)] = true;


 val test9 = sum_cards[(Clubs, Num 2), (Clubs, Num 2)] = 4;
sum_cards[(Clubs, Ace), (Clubs, Num 2)] = 13;
sum_cards[(Clubs, Jack), (Clubs, Num 2)] = 12;
sum_cards[(Clubs, Num 3), (Clubs, Queen), (Clubs, King), (Clubs, Jack), (Clubs, Num 5)] = 38;
sum_cards[] = 0;
sum_cards[(Clubs, Num 2)] = 2;
sum_cards[(Clubs, Ace)] = 11;


 val test10 = score([(Hearts, Num 2), (Clubs, Num 4)], 10) = 4;
score([(Clubs, Num 2), (Clubs, Num 2)], 4) = 0;
score([(Clubs, Jack), (Clubs, Num 2)], 20) = 4;
score([(Clubs, Num 3), (Clubs, Queen), (Clubs, King), (Clubs, Jack), (Hearts, Num 5)], 20) = 54;
score([(Clubs, Num 2)], 2) = 0;
score([(Clubs, Ace)], 15) = 2;
score([(Clubs, Ace), (Clubs, Num 2)], 6) = 10;
score([], 90) = 45;


 val test11 = officiate([(Hearts, Num 2), (Clubs, Num 4)], [Draw], 15) = 6;
officiate([(Hearts, Num 2), (Clubs, Num 4)], [Draw, Draw, Draw], 15) = score([(Hearts, Num 2), (Clubs, Num 4)], 15);

officiate(
  [(Clubs, Num 3), (Clubs, Queen), (Clubs, King), (Clubs, Jack), (Hearts, Num 5)],
  [Draw, Draw, Draw, Discard(Clubs, Num 3), Draw],
  50
) = score([(Clubs, Queen), (Clubs, King), (Clubs, Jack)], 50);

(officiate([], [Discard(Clubs, Num 3)], 15) handle IllegalMove => 999999) = 999999;

(officiate([(Hearts, Num 2), (Clubs, Num 4)], [Draw, Draw, Discard(Clubs, Num 3)], 15) handle IllegalMove => 999999) = 999999;

officiate([(Hearts, Num 2), (Clubs, Num 4)], [], 15) = score([], 15);

officiate(
  [(Hearts, Jack), (Clubs, Queen)],
  [Draw, Draw, Discard(Hearts, Jack), Discard(Clubs, Queen)],
  10
) = score([(Hearts, Jack), (Clubs, Queen)], 10);

officiate(
  [(Hearts, Jack), (Clubs, Queen)],
  [Draw, Draw, Discard(Hearts, Jack), Discard(Clubs, Queen)],
  4
) = score([(Hearts, Jack)], 4);


officiate(
  [(Hearts, Num 2), (Clubs, Num 4), (Clubs, Num 3), (Clubs, Queen), (Clubs, King), (Clubs, Jack), (Hearts, Num 5)],
  [Draw, Discard(Hearts, Num 2), Draw, Draw, Draw, Discard(Clubs, Queen), Draw, Draw],
  15
) = score([(Clubs, Num 4), (Clubs, Num 3), (Clubs, Queen), (Clubs, King)], 15);

officiate(
  [(Hearts, Queen), (Clubs, Ace), (Clubs, Ace), (Clubs, Ace), (Clubs, King), (Clubs, Jack), (Hearts, Num 5)],
  [Draw, Discard(Hearts, Queen), Draw, Draw, Draw, Discard(Clubs, Queen), Draw, Draw],
  15
) = score([(Clubs, Ace), (Clubs, Ace), (Clubs, Ace)], 15);

(* 0 38 36 31                                                             26 *)
officiate(
  [(Hearts, Num 2), (Clubs, Num 4), (Clubs, Num 3), (Clubs, Queen), (Clubs, King), (Clubs, Jack), (Hearts, Num 5)],
  [Draw, Discard(Hearts, Num 2), Draw, Draw, Draw, Draw, Draw, Discard(Clubs, Queen), Draw],
  80
) = score([(Clubs, Num 4), (Clubs, Num 3), (Clubs, King), (Clubs, Jack), (Hearts, Num 5)], 80);




val test12 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)             = 3



val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)

             (*
val cards = [(Hearts, Num 3), (Clubs, Num 4), (Hearts, Num 5), (Hearts, Num 6), (Spades, Jack), (Hearts, Num 5), (Hearts, Num 6), (Clubs, Queen), (Clubs, Num 6), (Clubs, Num 6)];
val goal = 30;
val moves = careful_player(cards, goal);
officiate(cards, moves, goal);

              *)
