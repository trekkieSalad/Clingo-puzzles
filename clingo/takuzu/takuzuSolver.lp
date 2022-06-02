color(b;w).
row(0..n-1).
col(0..n-1).

1 { cell(X,Y,C) :  color(C)} 1 :- col(Y),row(X).

:- not n/2 {cell(X,_,b)} n/2, row(X).
:- not n/2 {cell(_,Y,b)} n/2, col(Y).

:- cell(X,Y,C), cell(X,Y+1,C), cell(X,Y+2,C).
:- cell(X,Y,C), cell(X+1,Y,C), cell(X+2,Y,C).

:- row(X), row(X'), X<X', n=#count{Y: cell(X,Y,C), cell(X',Y,C)}.
:- col(Y), col(Y'), Y<Y', n=#count{X: cell(X,Y,C), cell(X,Y',C)}.


#show cell/3.