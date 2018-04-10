parent(kim, holly).
parent(margaret, kim).
parent(margaret, kent).
parent(esther, margaret).
parent(herbert, margaret).
parent(herbert, jean).


grandparent(GP, GC) :-
  parent(GP, P), parent(P, GC).

greatgrandparent(GGP, GGC) :-
  grandparent(GGP, P), parent(P, GGC).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :-
  parent(Z, Y),
  ancestor(X, Z).

sibling(X, Y) :-
  parent(P, X),
  parent(P, Y),
  not(X = Y).
