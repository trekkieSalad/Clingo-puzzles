%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                          %
%   Author:     Daniel José García Paz     %
%                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

digit(1..9).
row(0..8).
col(0..8).

1{cell(X,Y,D):digit(D)}1 :- col(Y),row(X).
:- cell(X,Y,D),cell(X,Y',D),Y!=Y'.
:- cell(X,Y,D),cell(X',Y,D),X!=X'.
:- cell(X,Y,D),cell(X',Y',D), row(Y), col(X), X!=X',Y!=Y',X/3=X'/3,Y/3=Y'/3.

#show cell/3.