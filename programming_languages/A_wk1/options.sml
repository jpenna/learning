fun countdown (x : int) =
  if x = 0
  then []
  else x :: countdown(x - 1)

fun countup (x : int) =
  let 
    fun countupgo(y : int, prev : int list) =
      if y = x
      then [x]
      else y :: countupgo(y + 1, prev)
  in
    countupgo(1, [])
  end

fun max(x : int list) = 
  if null x
  then NONE
  else 
    let 
      val calc = max(tl x)
    in
      if isSome calc andalso valOf calc > hd x
      then calc
      else SOME (hd x)
    end;


max(countup(30));

max(countdown(30));

