% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

add(null,S) :- S is 0 .
add(tree(Key,TL,TR),S):-  add(TL,S1),add(TR,S2),S is Key+S1+S2.
count_leaves(null,Count) :- Count is 0.
count_leaves(tree(_,null,null),1) :- !.
count_leaves(tree(_,TL,TR),C):- count_leaves(tree(TL,_,_),C1),count_leaves(tree(TR,_,_),C2), C is C1+C2.
compute(tree(Key,null,null),R) :- R is Key.
compute(tree(+,LT,RT),R) :- compute(LT,R1), compute(RT,R2), R is R1+R2.
compute(tree(-,LT,RT),R) :- compute(LT,R1), compute(RT,R2), R is R1-R2.
compute(tree(/,LT,RT),R) :- compute(LT,R1), compute(RT,R2), R is R1/R2.
compute(tree(*,LT,RT),R) :- compute(LT,R1), compute(RT,R2), R is R1*R2.

converting(A,tree(A,null,null)) :- number(A).
converting(A+B, tree(+,L,R)):- converting(A,L),converting(B,R).
converting(A-B, tree(-,L,R)):- converting(A,L),converting(B,R).
converting(A*B, tree(*,L,R)):- converting(A,L),converting(B,R).
converting(A/B, tree(/,L,R)):- converting(A,L),converting(B,R).

