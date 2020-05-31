datatype mytype = Pizza
                | Another of int * int
                | Any of string
                | (int * int);

fun go x =
  case x of
       Pizza => 3
     | Another (i1, i2) => i1 + i2
     | Any s => 578;

go(Pizza);
go(Another(4, 5));
go(Any "hi");
