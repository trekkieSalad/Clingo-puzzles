%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                          %
%   Author:     Daniel José García Paz     %
%                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#const n=8.
tablero(1..n,1..n).
0 { reina(X,Y) } 1 :- tablero(X,Y).

:- X = 1..n, not 1 { reina(X,Y) } 1.
:- Y = 1..n, not 1 { reina(X,Y) } 1.

:- 2 { reina(X,Y) : X-Y=N }, N = -n+2..n-2.
:- 2 { reina(X,Y) : X+Y=N }, N = 3..2*n-1.

#show reina/2.
