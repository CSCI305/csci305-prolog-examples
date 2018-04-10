reverse2([Head|Tail], X) :-
  reverse2(Tail, Y),
  append(Y, [Head], X).
