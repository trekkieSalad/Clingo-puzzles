%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                          %
%   Author:     Daniel José García Paz     %
%                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

row(0..r-1).
col(0..c-1).
digit(1..12).
#const n = r * c / 12.

1{ cell(X,Y,D) : digit(D) }1 :- row(X), col(Y).

adyacent(X,Y,X',Y) :- cell(X,Y,_), cell(X',Y,_), not separed(X,Y,X',Y), X'=X+1.
adyacent(X,Y,X,Y') :- cell(X,Y,_), cell(X,Y',_), not separed(X,Y,X,Y'), Y'=Y+1.
adyacent(X,Y,X',Y') :- adyacent(X',Y',X,Y).

:- cell(X,Y,D), cell(X',Y',D'), adyacent(X,Y,X',Y'), D'<D, |(D'-D) \ 12| != 1.
:- cell(X,Y,D), not n { cell(X',Y',D) } n.


#show cell/3.
