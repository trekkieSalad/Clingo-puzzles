%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                          %
%   Author:     Daniel José García Paz     %
%                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% any set of invalids is possible
{ invalid(X,Y) } :- cell(X,Y,N).

% remove adjacent invalids
:- invalid(X,Y), invalid(X+1,Y).
:- invalid(X,Y), invalid(X,Y+1).

% remove repeated values ​​in rows and columns
:- cell(X,Y,N), 2{not invalid(X',Y): cell(X',Y,N)}.
:- cell(X,Y,N), 2{not invalid(X,Y'): cell(X,Y',N)}.

% defining connection rules
conected(X,Y,X',Y) :- cell(X,Y,_), cell(X',Y,_), X'=X+1.
conected(X,Y,X,Y') :- cell(X,Y,_), cell(X,Y',_), Y'=Y+1.
conected(X,Y,X',Y') :- conected(X',Y',X,Y).


% every block must be reachable from cells 1,1 or 1,2
reachable(1,1). reachable(1,2).
reachable(X',Y') :- reachable(X,Y), conected(X,Y,X',Y'), not invalid(X,Y).

:- cell(X,Y,_), not reachable(X,Y).

#show invalid/2.
#show cell/3.