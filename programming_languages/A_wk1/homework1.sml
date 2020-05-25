(*
 * ## 1 ##
 * Instead of multiple if/else, create a number based on the date passsed and
 * compare them. Uses more memory, but the code is cleaner. 
 *)
fun is_older (date : (int * int * int), base : (int * int * int)) =
  let
    val dYear = (#1 date) * 10000;
    val dMonth = (#2 date) * 100;
    val dDay = (#3 date);
    val dateNum = dYear + dMonth + dDay;

    val bYear = (#1 base) * 10000;
    val bMonth = (#2 base) * 100;
    val bDay = (#3 base);
    val baseNum = bYear + bMonth + bDay;
  in
    dateNum < baseNum
  end;

(* ## 2 ## *)
fun number_in_month (date_list : (int * int * int) list, month : int) = 
  if null date_list
  then 0
  else 
    let
      val others = number_in_month(tl date_list, month);
    in
      if (#2 (hd date_list)) = month 
      then 1 + others
      else others
    end;

(* ## 3 ## *)
fun number_in_months (date_list : (int * int * int) list, months : int list) = 
  if null months
  then 0
  else
    let
      val cur_month_count = number_in_month(date_list, hd months);
    in
      if null (tl months)
      then cur_month_count   
      else cur_month_count + number_in_months(date_list, (tl months))
    end;

(* ## 4 ## *)
fun dates_in_month (date_list : (int * int * int) list, month : int) =
  if null date_list
  then []
  else 
    let 
      val cur_date = hd date_list;
      val others = dates_in_month(tl date_list, month);
    in
      if #2 cur_date = month
      then cur_date :: others
      else others
    end;

(* ## 5 ## *)
fun dates_in_months (dates : (int * int * int) list, months : int list) = 
  if null months
  then []
  else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months); 

(* ## 6 ## *)
fun get_nth (words : string list, nth : int) =
  if nth = 1
  then hd words
  else get_nth(tl words, nth - 1); 

(* ## 7 ## *)
fun date_to_string (date : (int * int * int)) =
  let
    val months_names = [
      "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    ];
    val month = get_nth(months_names, (#2 date));
  in
    month ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
  end;

(* ## 8 ## *)
fun number_before_reaching_sum (sum : int, nums : int list) =
  if hd nums >= sum
  then 0
  else 1 + number_before_reaching_sum(sum - (hd nums), tl nums);

(* ## 9 ## *)
fun what_month (days : int) =
  let 
    val month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  in
    1 + number_before_reaching_sum(days, month_days)
  end;

(* ## 10 ## *)
fun month_range (first_day : int, last_day : int) =
  if first_day > last_day
  then []
  else what_month(first_day) :: month_range(first_day + 1, last_day);

(* ## 11 ## *)
fun oldest (dates : (int * int * int) list) =
  if null dates
  then NONE
  else 
    if null (tl dates)
    then SOME (hd dates)
    else
      let 
        val older = if is_older(hd dates, hd (tl dates)) then hd dates else hd (tl dates);
        val next = oldest(tl (tl dates));
      in
        if isSome next andalso is_older(valOf next, older)
        then next
        else SOME (older)
      end;

(* better 11 *)
fun oldest_2 (dates : (int * int * int) list) = 
  if null dates
  then NONE
  else 
    let
      val next = oldest_2(tl dates);
    in 
      if isSome next andalso is_older(valOf next, hd dates)
      then next
      else SOME (hd dates)
    end;


(* ## Challenge 12 ## *)
fun remove_duplicates (nums : int list) =
  let 
    fun has (needle : int, haystack : int list) =
      not (null haystack) andalso (needle = hd haystack orelse has(needle, tl haystack))

    fun build (to_unique : int list, acc : int list) =
      if null to_unique 
      then acc
      else 
        if has(hd to_unique, acc)
        then build(tl to_unique, acc)
        else build(tl to_unique, hd to_unique :: acc);

     fun inverse (l : int list) =
       if null (tl l)
       then [hd l]
       else inverse(tl l) @ [hd l]; 
  in
    inverse(build(nums, []))
  end;


fun number_in_months_challenge(dates : (int * int * int) list, months : int list) =
  let
    val unique_months = remove_duplicates(months);
  in
    number_in_months(dates, unique_months)
  end;

(* 13 - Challenge *)
fun reasonable_date(date : (int * int * int)) =
  let
    val year = #1 date;
    val month = #2 date;
    val day = #3 date;
    val month_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    val is_leap_year = (year mod 400 = 0) orelse (year mod 4 = 0 andalso year mod 100 <> 0);

    fun get_month_days (nth : int, m_days : int list) =
      if nth = 1
      then hd m_days
      else get_month_days(nth - 1, tl m_days)
  in
    not (
      year <= 0 
      orelse month > 12 
      orelse month <=0 
      orelse day <= 0
      orelse day > get_month_days(month, month_days) 
      orelse (not is_leap_year andalso month = 2 andalso day > 28) 
    )
  end;



use "homework1_test.sml";
