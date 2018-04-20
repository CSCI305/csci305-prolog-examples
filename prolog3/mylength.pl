mylength([], 0).
mylength([_|Tail], Len) :-
  mylength(Tail, TailLen),
  Len = TailLen + 1.
