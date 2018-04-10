% April 8
% Simple I/O in Prolog
% There are more complex I/O functions in Prolog

browse(File) :-
   seeing(Old),  /*save for later*/
   see(File),    /*open file*/
   repeat,
   read(Data),
   process(Data),
   seen,         /* close file*/
   see(Old),     /* previously read source*/
   !.            /* stop */

process(end_of_file) :- !.
process(Data) :- write(Data), nl, fail.
