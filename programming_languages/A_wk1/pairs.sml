fun swap(x : bool, y : int) = 
  (y, x)

fun sum(x : int, y : int) =
  x + y

fun div_mod(x : int, y : int) =
  (x div y, x mod y)


fun list_product(a : int list) = 
  if null a
  then 1
  else hd a * list_product(tl a)

fun countdown(x : int) = 
  if x = 1
  then [1]
  else x::countdown(x-1)

fun append (x : int list, y : int list) = 
  if null x
  then y
  else hd x :: append(tl x, y)

fun sum_pairs(x : (int * int) list) = 
  if null x
  then 0
  else #1 (hd x) + #2 (hd x) + sum_pairs(tl x)

fun firsts(x : (int * int) list) = 
  if null x
  then []
  else #1 (hd x) :: firsts(tl x)









