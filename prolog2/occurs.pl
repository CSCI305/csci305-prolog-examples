append([], B, B).
append([Head|TailA], B,
[Head|TailC]) :-
  append(TailA, B, TailC).
