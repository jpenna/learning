(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* 1 - 1a. Return list option without string or NONE *)
fun all_except_option (str, str_list) =
  case str_list of
      [] => NONE
    | s::ss => if same_string(s, str)
               then SOME ss
               else case all_except_option(str, ss) of
                         NONE => NONE
                       | SOME ss' => SOME (s :: ss')


(* 2 - 1b. Return concat list of lists that includes string but without the string *)
fun get_substitutions1 ([], _) = []
  | get_substitutions1 (sl::sls, str) =
      case all_except_option(str, sl) of
          NONE => get_substitutions1(sls, str)
        | SOME x => x @ get_substitutions1(sls, str)

(* 3 - 1c. 1b with tail recursiveness *)
fun get_substitutions2 (str_lists, str) =
  let
    fun helper (next, acc) =
      case next of
           [] => acc
         | ss::ss' => case all_except_option(str, ss) of
                          NONE => helper(ss', acc)
                        | SOME x => helper(ss', acc @ x)
  in
    helper(str_lists, [])
  end

(* 4 - 1d. Name substitution *)
fun similar_names (str_list, {first=f, middle=m, last=l}) =
  let
    fun replace names =
      case names of
           [] => []
         | n::ns => {first=n, middle=m, last=l} :: replace(ns)
  in
    {first=f, middle=m, last=l} :: replace(get_substitutions2(str_list, f))
  end


(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)

(* 5 - 2a *)
fun card_color (suit, _) =
  case suit of
       Clubs => Black
     | Spades => Black
     | Hearts => Red
     | Diamonds => Red

(* 6 - 2b *)
fun card_value (_, rank) =
  case rank of
       Num(i) => i
     | Ace => 11
     | Jack => 10
     | Queen => 10
     | King => 10

(* 7 - 2c *)
fun remove_card(cs, c, e) =
  case cs of
       [] => raise e
     | card::cards => if card = c
                     then cards
                     else card :: remove_card(cards, c, e)

(* 8 - 2d *)
fun all_same_color cs =
  case cs of
       [] => true
     | c::[] => true
     | c1::c2::cs => card_color(c1) = card_color(c2) andalso all_same_color(c2::cs)

(* 9 - 2e *)
fun sum_cards cs =
  let
    fun helper (next, acc) =
      case next of
           [] => acc
         | c::cs' => helper(cs', card_value(c) + acc)
  in
    helper(cs, 0)
  end

(* 10 - 2f *)
fun score (cs, goal) =
  let
    val sum = sum_cards(cs)
    val preliminary_score = if sum > goal
                            then 3 * (sum - goal)
                            else goal - sum
  in
    if all_same_color cs then preliminary_score div 2 else preliminary_score
  end

(* 11 - 2g *)
fun officiate (cs, mvs, goal) =
  let
    fun run(cards, moves, hand) =
      let
        val p = score(hand, goal);
      in
        if p > goal
        then p
        else case moves of
                  [] => p
                | (Discard card)::ms => run(cards, ms, remove_card(hand, card, IllegalMove))
                | Draw::ms => case cards of
                                   [] => p
                                 | c::cs => run(cs, ms, c::hand)
      end
  in
    run(cs, mvs, [])
  end

(* 3a - Challenge 1 *)
fun score_challenge(cards, goal) =
  let
    fun replace_elv [] = []
      | replace_elv ((suit,rank)::cs) =
          (if rank = Ace then (suit, Num 1) else (suit,rank)) :: (replace_elv cs)
    val score_ones = score(replace_elv(cards), goal);
    val score_elevens = score(cards, goal);
  in
    if score_ones > score_elevens then score_elevens else score_ones
  end

fun officiate_challenge (cs, mvs, goal) =
  let
    fun run(cards, moves, hand) =
      let
        val p = score_challenge(hand, goal);
      in
        if p > goal
        then p
        else case moves of
                  [] => p
                | (Discard card)::ms => run(cards, ms, remove_card(hand, card, IllegalMove))
                | Draw::ms => case cards of
                                   [] => p
                                 | c::cs => run(cs, ms, c::hand)
      end
  in
    run(cs, mvs, [])
  end
 
(* 3b - Challenge 2 *)
fun careful_player(cs, goal) =
  let
    fun best_move(card, pre, hand) =
      case hand of
           [] => NONE
         | h::hs => if score(pre @ (card::hs), goal) = 0
                    then SOME h
                    else best_move(card, h::pre, hs)


    fun smart_play(cards, hand, moves) =
      case cards of
           [] => moves
         | c::_ => if score(c::hand, goal) = 0
                   then Draw::moves (* do not need to discard, else discard and draw*)
                   else case best_move(c, [], hand) of
                         NONE => moves
                       | SOME card => Draw :: ((Discard card) :: moves)

    fun play(cards, hand, moves) =
      let 
        val s = score(hand, goal);
      in
        if s = 0 
        then moves
        else
          if s + 10 < goal 
          then case cards of 
                    [] => Draw::moves
                  | c::cs => play(cs, c::hand, Draw::moves)
          else smart_play(cards, hand, moves)
      end
    
    fun inverse [] = []
      | inverse (m::ms) = (inverse ms) @ [m]
  in
    inverse(play(cs, [], []))
  end














