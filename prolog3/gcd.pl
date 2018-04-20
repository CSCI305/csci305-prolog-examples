gcd(X,Y,Z) :-
  X =:= Y,
  Z is X,
  !.
gcd(X, Y, Denom) :-
  X < Y,
  NewY is Y - X,
  gcd(X, NewY, Denom),
  !.
gcd(X, Y, Denom) :-
  X > Y,
  NewX is X - Y,
  gcd(NewX, Y, Denom).
