/* April 4 */
/* takeout example*/

takeout(A,[A|B],B).
takeout(A,[B|C],[B|D]) :-
        takeout(A,C,D).
