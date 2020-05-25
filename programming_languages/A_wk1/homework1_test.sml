(* 1 - is_older
is_older((2020, 4, 03), (2019, 03, 03)); (* false *)
is_older((2020, 03, 03), (2019, 03, 03)); (* false *)
is_older((2020, 08, 03), (2020, 9, 03)); (* true *)
is_older((2020, 10, 03), (2020, 9, 03)); (* false *)
is_older((2019, 12, 03), (2019, 12, 05)); (* true *)
is_older((1998, 10, 30), (1998, 10, 31)); (* true *)
is_older((1998, 10, 30), (1998, 10, 29)); (* false *)
is_older((1765, 09, 03), (2089, 8, 03)); (* true *)
                                          *)

(* 2 - number_in_month 
number_in_month([(2020, 4, 03), (2019, 05, 03), (2019, 05, 03)], 5); (* 2 *)
number_in_month([(2020, 03, 03), (2019, 03, 03), (2019, 03, 03)], 03); (* 3 *)
number_in_month([(2020, 08, 03), (2020, 1, 03), (2020, 9, 03)], 12); (* 0 *)
number_in_month([], 2); (* 0 *)
                         *)

(* 3 - number_in_months
number_in_months([(2020, 4, 03), (2019, 05, 03), (2019, 05, 03)], [5, 4]); (* 3 *)
number_in_months(
 [(2020, 03, 03), (2019, 03, 03), (2019, 04, 03), (2019, 03,03)], 
 [03]
); (* 3 *)
number_in_months(
  [(2020, 07, 03), (2020, 08, 03), (2020, 09, 03), (2020, 10, 03), (2020, 9,03)], 
  [7, 9, 12]
); (* 3 *)
number_in_months([], [2]); (* 0 *)
number_in_months([(1,2,25),(3,5,26),(1,12,29),(3,2,28),(1,2,27),(1,2,25),(6,7,8)], []);
 (* 0 *)
  *)

(* 4 - dates_in_month
dates_in_month([(2020, 4, 03), (2019, 05, 03), (2019, 05, 03)], 5); 
(* [(2019, 05, 03), (2019, 05, 03)] *)
dates_in_month(
 [(2020, 03, 04), (2019, 03, 02), (2019, 04, 03), (2019, 03,10)], 
 03
); 
(* [(2020, 03, 04), (2019, 03, 02), (2019, 03,10)] *)
dates_in_month(
  [(2020, 07, 03), (2020, 08, 03), (1999, 09, 03), (2020, 10, 03), (2020, 9,03)], 
  9
); 
(* [(1999, 09, 03), (2020, 9, 03)] *)
dates_in_month([], 2); 
(* [] *)
 *)

(* 5 - dates_in_months
dates_in_months(
  [(2019, 4, 03), (2020, 4, 03), (2019, 05, 03), (2019, 05, 03)], 
  [5, 4]
); 
(* [(2019, 4, 03), (2020, 4, 03), (2019, 05, 03), (2019, 05, 03)] *)
dates_in_months(
 [(2020, 04, 04), (2019, 05, 02), (2019, 04, 03), (2019, 06,10)], 
 [03]
); 
(* [] *)
dates_in_months(
  [(2020, 09, 03), (2020, 12, 03), (1999, 09, 03), (2020, 8, 03), (2020, 9,03), (20, 10, 03), (2020, 10,03), (9, 5, 8)], 
  [9, 12, 5, 7, 8]
); 
(* [(2020, 09, 03), (2020, 12, 03), (1999, 09, 03), (2020, 8, 03), (2020, 9,03), (9, 5, 8)] *)
dates_in_months([], [2, 5]); 
(* [] *)
 *)


(* 6 - get_nth 
get_nth(["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth"], 5);
get_nth(["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth"], 2);
get_nth(["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth"], 3);
get_nth(["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth"], 9);
get_nth([], 1);
get_nth(["name"], 3);
 *)

(* 7 - date_to_string 
date_to_string((2019, 4, 03));
date_to_string((1789, 6, 18));
date_to_string((789, 12, 20));
date_to_string((129, 1, 23));
date_to_string((2003, 5, 31));
date_to_string((403, 09, 6));
 *)

(* 8 - number_before_reaching_sum 
number_before_reaching_sum(1, [3, 4, 5, 7]); (* 0 *)
number_before_reaching_sum(10, [3, 4, 5, 7]); (* 2 *)
number_before_reaching_sum(12, [3, 4, 5, 7]); (* 2 *)
number_before_reaching_sum(13, [3, 4, 5, 7]); (* 3 *)
number_before_reaching_sum(14, [13, 45, 5, 27]); (* 1 *)
number_before_reaching_sum(60, [13, 45, 5, 27]); (* 2 *)
                                                  *)

(* 9 - what_month
what_month(45); (* 2 *)
what_month(100); (* 4 *)
what_month(300); (* 10 *)
what_month(350); (* 12 *)
what_month(1); (* 1 *)
what_month(365); (* 12 *)
                  *)

(* 10 - month_range 
month_range(58, 63); (* [2, 2, 3, 3, 3, 3 ] *)
month_range(1, 10); (* [10x1] *)
month_range(360, 365); (* [6x12] *)
month_range(5, 3); (* [] *)
                    *)

(* 11 - oldest 
oldest([(2020, 4, 03), (2019, 05, 01), (2019, 05, 03)]); 
(* SOME (2019, 05, 01) *)
oldest([(2020, 04, 04), (2019, 05, 02), (2019, 04, 03), (2019, 06,10)]); 
(* (2019, 04, 03) *)
oldest([(1999, 09, 02), (2020, 09, 03), (2020, 12, 03), (1999, 09, 03), (2020, 8, 03), (2020, 9,03), (20, 10, 03), (2020, 10,03), (9, 5, 8)]); 
(* SOME (9, 5, 8) *)
oldest([(1999, 09, 02), (2020, 09, 03), (2020, 12, 03), (1999, 09, 03), (2020, 8, 03), (2020, 9,03)]); 
(* SOME (1999, 09, 02) *)
oldest([(1999, 09, 02), (2020, 09, 03), (2020, 12, 03), (1999, 09, 03), (2020, 8, 03), (1999, 09, 02), (2020, 9,03)]); 
(* SOME (1999, 09, 02) *)
oldest([]); 
(* NONE *)
 *)

(* 11 - oldest_2 *)
oldest_2([(2020, 4, 03), (2019, 05, 01), (2019, 05, 03)]); 
(* SOME (2019, 05, 01) *)
oldest_2([(2020, 04, 04), (2019, 05, 02), (2019, 04, 03), (2019, 06,10)]); 
(* (2019, 04, 03) *)
oldest_2([(1999, 09, 02), (2020, 09, 03), (2020, 12, 03), (1999, 09, 03), (2020, 8, 03), (2020, 9,03), (20, 10, 03), (2020, 10,03), (9, 5, 8)]); 
(* SOME (9, 5, 8) *)
oldest_2([(1999, 09, 02), (2020, 09, 03), (2020, 12, 03), (1999, 09, 03), (2020, 8, 03), (2020, 9,03)]); 
(* SOME (1999, 09, 02) *)
oldest_2([(1999, 09, 02), (2020, 09, 03), (2020, 12, 03), (1999, 09, 03), (2020, 8, 03), (1999, 09, 02), (2020, 9,03)]); 
(* SOME (1999, 09, 02) *)
oldest_2([]); 
(* NONE *)


 (* remove_duplicates 
 remove_duplicates([9,9,4,3,9,4, 8]);
 remove_duplicates([10, 5, 4, 3, 3, 10, 8]);
 
 remove_duplicates([9]);
 remove_duplicates([9, 9]);
 remove_duplicates([9, 3, 9]);
 remove_duplicates([7, 7, 3, 9]);
  *)

(* 12 - number_in_months_challenge 
number_in_months_challenge([(2020, 4, 03), (2019, 05, 03), (2019, 05, 03)], [5, 5, 5, 4]); (* 3 *)
number_in_months_challenge(
 [(2020, 03, 03), (2019, 03, 03), (2019, 04, 03), (2019, 03,03)],
 [03, 4, 3]
); (* 4 *)
number_in_months_challenge(
  [(2020, 07, 03), (2020, 08, 03), (2020, 09, 03), (2020, 10, 03), (2020, 9,03)],
  [7, 9, 12, 7, 9]
); (* 3 *)
number_in_months_challenge([], [2]); (* 0 *) 
                                      *)

(* CHALLENGE reasonable_date                               
reasonable_date((~4, 3, 4));
reasonable_date((2020, 13, 4));
reasonable_date((2020, 3, 40));
reasonable_date((45, ~1, 32));
reasonable_date((2020, 0, 4));
reasonable_date((0, 3, 4));
reasonable_date((2020, 3, 0));
reasonable_date((2020, 2, 30));
reasonable_date((2019, 2, 29));
reasonable_date((2100, 2, 29));
reasonable_date((2100, 4, 31));
print("-------------");
reasonable_date((2020, 3, 4));
reasonable_date((2020, 12, 31));
reasonable_date((2020, 3, 31));
reasonable_date((1600, 2, 29));
reasonable_date((1600, 2, 28));
reasonable_date((2020, 2, 29));
reasonable_date((2020, 2, 28));
 *)
