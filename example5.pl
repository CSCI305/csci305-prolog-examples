% April 6
% The use of 'not'.

male(henry).
male(tom).
female(lisa).
female(jenny).

married(tom).
married(lisa).

bachelor(P) :- male(P), not(married(P)).
