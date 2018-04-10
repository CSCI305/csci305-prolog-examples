% April 15
% Computing the coloring of a map
% This is the hardest example, you won't see sth like this in the final.

% This is how the graph (or regions) are represented
%
map1([[1,2],[1,4],[1,5],[2,3],[2,4],[3,4],[4,5],[1,3]]).

adjacent(X,Y,Map) :- member([X,Y],Map); member([Y,X],Map).

% list all regions from the linked list representation
% find_regions([[1,2],[1,4],[1,5],[2,3],[2,4],[3,4],[4,5],[1,3]],[],R).
% 
find_regions([],R,R).
find_regions([[X,Y]|S], R, A) :-
  (member(X,R) ->
     (member(Y,R) -> find_regions(S,R,A); find_regions(S,[Y|R],A));
        (member(Y,R) -> find_regions(S,[X|R],A); find_regions(S,[X,Y|R],A))).

% list all coloring
% color([[1,2],[1,4],[1,5],[2,3],[2,4],[3,4],[4,5],[1,3]],[red,blue,green.yellow],Coloring).
%
color(Map,Colors,Coloring) :-
    find_regions(Map,[],Regions), 
    color_all(Regions, Colors, Coloring), 
    \+ conflict(Map, Coloring).

color_all([R|Rs],Colors,[[R,C]|A]) :-
    member(C,Colors),
    color_all(Rs, Colors, A). 

color_all([],_,[]).

conflict(Map,Coloring) :-
    member([R1,C],Coloring),
    member([R2,C],Coloring),
    adjacent(R1,R2,Map).
    
