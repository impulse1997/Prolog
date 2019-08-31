% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

father("J","X").
father("J","Y").
mother("I","X").
mother("I","Y").
havetwochildren(X,Y) :- father(X1,Y1),mother(X2,Y1),father(X1,Y2),mother(X2,Y2),
    X is X1+X2, Y is Y1+Y2, not(Y1=Y2).




pr(0,_,1) :- !.
pr(1,X,R) :- X1 is X-1, X2 is X+1, R is X1 // X2.
pr(N,X,R) :- N>1, N1 is N-1, N2 is N-2, pr(N1,X,R1),pr(N2,X,R2),pr(1,X,R3),R is 2*R1*R3 -R2.
