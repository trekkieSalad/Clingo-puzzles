%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                          %
%   Author:     Daniel José García Paz     %
%                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#program initial.

{ entre(pos(X,Y), pos(X1,Y1), pos(X2,Y2)) } :- pos(X,Y), pos(X1,Y1), pos(X2,Y2), X1<=X, X<=X2, Y1<=Y, Y<=Y2.
N{ ocup(B,P,h) : entre(P,pos(X1,Y1),pos(X1+N-1,Y1)) } :- bloque(B,h,pos(X1,Y1),N).
N{ ocup(B,P,v) : entre(P,pos(X1,Y1),pos(X1,Y1+N-1)) } :- bloque(B,v,pos(X1,Y1),N).


pos(0..wmax,0..wmax).
action(move(B,N)) :- bloque(B,h,pos(X1,Y),L), N=(-wmax+1)..(wmax-1).
action(move(B,N)) :- bloque(B,v,pos(X,Y1),L), N=(-wmax+1)..(wmax-1).

#program dynamic.
1 {o(A) : _action(A)} 1.

:- o(move(B,N)), 'ocup(B,pos(XI,YI),v), YI+N>wmax.
:- o(move(B,N)), 'ocup(B,pos(XI,YI),v), YI+N<0.
:- o(move(B,N)), 'ocup(B,pos(XI,YI),h), XI+N>wmax.
:- o(move(B,N)), 'ocup(B,pos(XI,YI),h), XI+N<0.

ocup(B,pos(X,Y+N),v) :- 'ocup(B,pos(X,Y),v), o(move(B,N)), Y+N<=wmax, Y+N>=0.
ocup(B,pos(X+N,Y),h) :- 'ocup(B,pos(X,Y),h), o(move(B,N)), X+N<=wmax, X+N>=0.
ocup(B,P,O) :- 'ocup(B,P,O), not ch(B).
ch(B) :- o(move(B,N)).

tray :- 'ocup(A,pos(X,Y),v), o(move(A,N)), ocup(B,pos(X1,Y1),O), Y1=(Y+1)..(Y+N), X=X1, A!=B.
tray :- 'ocup(A,pos(X,Y),v), o(move(A,N)), ocup(B,pos(X1,Y1),O), Y1=(Y+N)..(Y-1), X=X1, A!=B.
tray :- 'ocup(A,pos(X,Y),h), o(move(A,N)), ocup(B,pos(X1,Y1),O), X1=(X+1)..(X+N), Y=Y1, A!=B.
tray :- 'ocup(A,pos(X,Y),h), o(move(A,N)), ocup(B,pos(X1,Y1),O), X1=(X+N)..(X-1), Y=Y1, A!=B.
:- tray.

move(B,N) :- o(move(B,N)).


#program final.
goal :- ocup(main,pos(finx,finy),_), not ocup(main,pos(finx-1,finy),_).
:- not goal.

#show move/2.