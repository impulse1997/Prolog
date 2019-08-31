% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

inverting([],[]).
inverting([H],[H]).
inverting([H|T],[H1|T1]):- inverting(T,[H1|T2]),append(T2,[H],T1).
palindrom(L):-inverting(L,L).

my_last([],[]).
my_last([H],H).
my_last([_|T],R):- my_last(T,R), !.

istree(nil).
istree(tree(_,L,R)):- istree(L),istree(R).

is_tree(tree(_,null,null)).
is_tree(X) :- X=tree(_,L,R),is_tree(L),is_tree(R); X=tree(_,null,R),is_tree(R); X=tree(_,L,null),is_tree(L).

successors(Item,EntireList,ListOfSuccessors) :-
    append(_,[Item|ListOfSuccessors],EntireList).
abc(L):- member(a,L),successors(a,L,L1),member(b,L1),successors(b,L1,L2),member(c,L2).

range(A,A,[A]).
range(A,B,[A|T]):- A1 is A+1, range(A1,B,T).
sum1([],0).
sum1([H],H).
sum1([H|T],S):- sum1([H],S1),sum1(T,S2),S is S1+S2.
sum(A,_):- A<0, false.

sum(A,S):- A>0 , range(0,A,L1), sum1(L1,S).

and(A,B) :- A, B.

or(A,_) :- A.
or(_,B) :- B.

equ(A,B) :- or(and(A,B), and(not(A),not(B))).

xor(A,B) :- not(equ(A,B)).

nor(A,B) :- not(or(A,B)).

nand(A,B) :- not(and(A,B)).

impl(A,B) :- or(not(A),B).

bind(true).
bind(fail).

table(A,B,Expr) :-write('['), bind(A), bind(B), do(A,B,Expr),write(']'), fail.

do(A,B,_) :- write('['),write(A), write('  '), write(B), write('  '), fail.
do(_,_,Expr) :- Expr, !, write(true),write(']'), nl.
do(_,_,_) :- write(fail),write(']'), nl.

count([],0).
count([_|T],S):- count(T,S1), S is 1+S1.


count_leaves(null,Count) :- Count is 0.
count_leaves(tree(_,null,null),1) :- !.
count_leaves(tree(_,TL,TR),C):- count_leaves(TL,C1),count_leaves(TR,C2), C is C1+C2.
element_at(X,[X|_],1).
element_at(X,[_|L],K) :- K > 1, K1 is K - 1, element_at(X,L,K1).

pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

% transfer(X,Xs,Ys,Z) Ys is the list that remains from the list Xs
%    when all leading copies of X are removed and transfered to Z

transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).

%shift(L1, N, L2) :-
   % N < 0, !,
   % N1 is -N,
   % shift(L2, N1, L1).
%shift(L1, N, L2) :-
   % append(Lx, Ly, L1), % L1 is Lx || Ly
   % append(Ly, Lx, L2), % L2 is Ly || Lx
   % length(Lx, N).
rotate([A],1,[A]).
rotate([H|T],1,[H1|T1]):- rotate(T,1,[H1|T2]),append([H],T2,T1),!.
rotate(L,N,L1) :- rotate(L,1,L2), N1 is N-1, N1>0, rotate(L2,N1,L1).
shift(L,N1,L1) :- rotate(L,N1+N1,L1).
