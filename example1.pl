/* April 4 */
/* example 1*/

factorial(0,1).

factorial(A,B) :-
     A > 0,
     C is A-1,
     factorial(C,D),
     B is A*D.

/* a second definition using tail recursion */

factorial(0,F,F).

factorial(N,A,F) :-
   N > 0,
   A1 is N*A,
   N1 is N-1,
   factorial(N1,A1,F).
