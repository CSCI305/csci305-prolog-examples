parent(kim, holly).
parent(margaret, kim).
parent(margaret, kent).
parent(esther, margaret).
parent(herbert, margaret).
parent(herbert, jean).

female(kim).
female(holly).
female(margaret).
female(esther).
female(jean).

male(herbert).
male(kent).

mother(X, Y) :- female(X), parent(X, Y).

father(X, Y) :- male(X), parent(X, Y).

sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), not(X = Y).

grandson(X, Y) :- parent(X, F), parent(F, Y), male(Y).

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
