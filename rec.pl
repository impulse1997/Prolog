% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

add(null,S):- S is 0.
add(tree(K,L,R),S):- add(L,S1),add(R,S2), S is K+S1+S2.


count_leaves(null,C):- C is 0.
count_leaves(tree(_,null,null),1):-!.
count_leaves(tree(_,L,R),S):- count_leaves(L,S1),count_leaves(R,S2), S is S1+S2.

compute(tree(Key,null,null),Key):-!.
compute(tree(+,L,R),C) :- compute(L,C1),compute(R,C2), C is C1+C2.
compute(tree(-,L,R),C) :- compute(L,C1),compute(R,C2), C is C1-C2.
compute(tree(/,L,R),C) :- compute(L,C1),compute(R,C2), C is C1/C2.
compute(tree(*,L,R),C) :- compute(L,C1),compute(R,C2), C is C1*C2.

converting(A,tree(A,null,null)):- number(A).
converting(A+B,tree(+,A1,B1)):- converting(A,A1),converting(B,B1).
converting(A-B,tree(-,A1,B1)):- converting(A,A1),converting(B,B1).
converting(A*B,tree(*,A1,B1)):- converting(A,A1),converting(B,B1).
converting(A/B,tree(/,A1,B1)):- converting(A,A1),converting(B,B1).

is_tree(tree(_,null,null)).
is_tree(tree(_,null,R)):- is_tree(R).
is_tree(tree(_,L,null)):-is_tree(L).
is_tree(tree(_,LT,RT)):-  is_tree(LT),is_tree(RT).

symetrical(null,null).
symetrical(tree(K1,L1,R1),tree(K2,L2,R2)):- K1 is K2, symetrical(L1,R2),symetrical(R1,L2).
preorder(null).
preorder(tree(K,null,null)):- write(K), !.
preorder(tree(K,L,R)):- write(K), preorder(L),preorder(R).
inaltime(null,0).
inaltime(tree(_,L,R),H):- inaltime(L,H1), inaltime(R,H2), H is max(H1,H2)+1.

nod(null,0).
nod(tree(_,null,null),1).
nod(tree(_,L,null),C) :- nod(L,C1), C is C1+1.

inserting(R,[],[R]).
inserting(R,[H|T],X):- append([R],[H],X1),append(X1,T,X).
inserting(R,[H|T],X) :- inserting(R,T,X1), append([H],X1,X).

deleting_one(X,[X],[]).
deleting_one(X,[X|T],T).
deleting_one(X,[H|T],R):- deleting_one(X,T,R1), append(H,R1,R).

deleting_all(X,[X],[]):-!.
deleting_all(X,[X|T],R):- deleting_all(X,T,R), !.
deleting_all(X,[H|T],R) :- deleting_all(X,T,R1), append([H],R1,R).

range(A,A,[A]).
range(A,B,[A|T]):- A1 is A+1, range(A1,B,T), !.


flatten-list([A],[A]).
flatten-list([H|T],R):- is_list(H), flatten-list(H,R1),flatten-list(T,R2), append(R1,R2,R), !.

flatten-list([H|T],R):-flatten-list(T,R2), append([H],R2,R).

pr1(null,[]).
pr1(tree(K,null,null), [K]):- !.
pr1(tree(K,L,R),LST):- pr1(L,LST1),pr1(R,LST2), append([K],LST1,LST3),append(LST3,LST2,LST).

inverting([H],[H]).
inverting([H|T],[H1|T1]):-inverting(T,[H1|T2]),append(T2,[H],T1).
duplicate([],[]):- !.
duplicate([H|T],[H1|T1]):- H1 = [H,H], duplicate(T,T1).

my_last([H],H).
my_last([_|T],R):-my_last(T,R).

pen([H|T]) :- rotate([H|T],2,[H1|_]), write(H1).

pr2(X,Y,[X,Y]) :- write(X),write(Y).
pr2(X,Y,L):- nextto(X,Y,L), write(X),write(Y).

writem(A,I) :- write(A), I <A, I1 is I-1,writem(A,I1).
:-op(500,fy,multypling).
:-op(450,yfx,times).
:-op(250,xfy,gives).

multypling A times 3 gives N:- N, write(A), write(A),write(A).



rotate([A],1,[A]).
rotate([H|T],1,[H1|T1]):- rotate(T,1,[H1|T2]),append([H],T2,T1),!.
rotate(L,N,L1) :- rotate(L,1,L2), N1 is N-1, N1>0, rotate(L2,N1,L1).
shift(L,N1,L1) :- inverting(L,L2), rotate(L2,N1,L3), inverting(L3,L1).






