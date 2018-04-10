% April 8
% Generate 8-queen solution

takeout(A,[A|B],B).
takeout(A,[B|C],[B|D]) :-
        takeout(A,C,D).

perm([],[]).
perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).

solve(P) :-
   perm([1,2,3,4,5,6,7,8],P),
   combine([1,2,3,4,5,6,7,8],P,S,D),
   all_diff(S),
   all_diff(D).

combine([],[],[],[]). 
combine([X1|X],[Y1|Y],[S1|S],[D1|D]) :- 
   S1 is X1 + Y1,
   D1 is X1 - Y1,
   combine(X,Y,S,D).

all_diff([X]).
all_diff([X|Y]) :- \+ member(X,Y), all_diff(Y).

  
