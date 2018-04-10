% April 8
% Compute a permutation

takeout(A,[A|B],B).
takeout(A,[B|C],[B|D]) :-
        takeout(A,C,D).

perm([],[]).
perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).
