% April 11
% Weakness of Prolog
%
% (1) Backtrack would work
% 
%
member(Element, [Element|_]).
member(Element, [_|List]) :- member(Element, List).

% However, if  we have sth like
% 
% candidate(X) :- member(X,democrats), test(X).
%
% If the set 'democrats' has a duplicate (for whatever reason),
% then after test(X) fails Prolog will backtrack and start another
% futile search.
%
% The solution is to use Bang(!) --- the cut operator.
% Use instead
%
%member(Element, [Element|_]) :- !.
%
% But the problem is not completely solved in some cases.
%
% (2) negation problem
%
parent(bill,jake).
parent(bill, shelley).
sibling(X,Y) :- parent(M,X), parent(M,Y).  
%
% >sibling(X,Y).
%
% So we should use instead:
%sibling(X,Y) :- parent(M,X), parent(M,Y), not(X=Y).  
% 
% But if X has a lot of siblings, this is inefficient; what is more,
% `not' could give us unsatisfactory answers.
% Try
%
% >member(X,[mary,sam,tom]).
%
% >not(not(member(X,[mary,sam,tom]))).
%
% to see the difference.
