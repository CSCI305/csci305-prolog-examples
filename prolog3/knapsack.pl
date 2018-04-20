weight([], 0).
weight([food(_,W,_) | Rest], X) :-
  weight(Rest,RestW),
  X is W + RestW.

calories([], 0).
calories([food(_,_,C) | Rest], X) :-
  calories(Rest, RestC),
  X is C + RestC.

subseq([],[]).
subseq([Item | RestX], [Item| RestY]) :-
  subseq(RestX, RestY).
subseq(X, [_| RestY]) :-
  subseq(X, RestY).

knapsackDecision(Pantry,Capacity,Goal,Knapsack) :-
  subseq(Knapsack,Pantry),
  weight(Knapsack,Weight),
  Weight =< Capacity,
  calories(Knapsack,Calories),
  Calories >= Goal.

legalKnapsack(Pantry, Capacity, Knapsack) :-
  subseq(Knapsack, Pantry),
  weight(Knapsack,W),
  W =< Capacity.

maxC([], Sofar, _, Sofar).
maxC([First | Rest], _, MC, Result) :-
  calories(First, FirstC),
  MC =< FirstC,
  maxC(Rest,First,FirstC,Result).
maxC([First | Rest], Sofar, MC, Result) :-
  calories(First, FirstC),
  MC > FirstC,
  maxC(Rest,Sofar,MC,Result).
maxCalories([First | Rest], Result) :-
  calories(First, FirstC),
  maxC(Rest, First, FirstC, Result).

knapsackOptimization(Pantry, Capacity, Knapsack) :-
  findall(K, legalKnapsack(Pantry, Capacity, K), L),
  maxCalories(L, Knapsack).
