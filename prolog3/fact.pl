fact(X, 1) :-
  X =:= 1,
  !.
fact(X, Fact) :-
  X > 1,
  NewX is X - 1,
  fact(NewX, NF),
  Fact is X * NF.
