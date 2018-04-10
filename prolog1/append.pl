append2([], B, B).
append2([Head|TailA], B, [Head|TailC]) :-
  append2(TailA, B, TailC).
