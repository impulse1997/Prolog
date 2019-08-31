% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

:-op(500,xfx,was).
:-op(400,fx,the).
:-op(450,xfx,of).
john was the secretary of the department.

:-op(300,xfy,gives).
:-op(200,fy,deleting).
:-op(50,yfx,from).
deleting X from L1 gives L :- delete(L1,X,L).

:-op(200, fx,concating).
:-op(200,yfx,and).
:-op(300,xfy,gives).

concating L1 and L2 gives R:- append(L1,L2,R).
concating L1 and L2 and L3 and L4 gives R:-
append(L1,L2,R1),append(L3,L4,R2),append(R1,R2,R).

square:- writef('DA-TI NR'), read(X), Y is X*X, writef('%d^2, %d', [X,Y]),read('stop'),abort(),square.

writelst([]).
writelst([H|T]):- write(H),write(' '), writelst(T).


:-op(400,fx,intersecting).
:-op(400,yfx,with).
:-op(350,xfy,gives).
intersecting L1 with L2 gives L3:- intersection(L1,L2,L3).

:- op(300, fx, '{').
:- op(400, xfx, '..').
:- op(300, xf, '}').

intersecting {A..B} with {C..D} gives {E..F} :- B >= C,
	E is max(A,C),
	F is min(B,D), !.
intersecting {_.._} with {_.._} gives What :- What = void, !.
